extends Node
class_name SemiModeling

signal tick(count: int)

@export var _is_modeling: bool = false

var _modeling_tick: int = 0

@export var _timer: Timer
@export var _situations: Array[Situation]
@export var _event_calendar: EventCalendar
@export var _planning_delta_ticks: int = 1


func _ready() -> void:
	print("=== simulation started ===")
	_timer.timeout.connect(func(): update())


func _interrogative() -> void:
	var active_situations: Array[Situation] = _situations.filter(
		func(s: Situation):
			return s.is_active()
	)
	
	print("[time:", _modeling_tick, "] found ", active_situations.size(), " active situations")
	for situation in active_situations:
		
		if !situation.is_condition_passing():
			continue
		
		for event in situation.get_bound_events():
			_event_calendar.add(EventNotification.new(event, _modeling_tick))
			event.perform_action()
			print("    -> Performing event ", event.name, " at ", _modeling_tick)


func _imperative() -> void:
	tick.emit(_modeling_tick)
	_modeling_tick += 1


func start() -> void:
	_is_modeling = true
	_timer.start(0.1)


func stop() -> void:
	_is_modeling = false


func is_modeling() -> bool:
	return _is_modeling


func update() -> void:
	if !_is_modeling:
		return
	
	_interrogative()
	_imperative()
