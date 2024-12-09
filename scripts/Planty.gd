extends Node
class_name Planty

static var _instance: Planty

@export var _ui: UI
@export var _actors: Node
@export var _planties: Node
@export var _modeling: SemiModeling
@export var _known_plant_types: Array[PlantType]

var types_counter: Dictionary = {}


func _ready() -> void:
	_instance = self
	for plant_type in _known_plant_types:
		types_counter[plant_type] = 0
	_modeling.start()
	
	_modeling.tick.connect(
		func(t):
			var notifications = _modeling._event_calendar.filter(
				func(n: EventNotification):
					return t == n.get_timestamp()
			)
			_ui.add_notification_group(
				t,
				notifications
			)
	)
	
	_ui.play_button.pressed.connect(
		func():
			_modeling.start()
	)
	
	_ui.pause_button.pressed.connect(
		func():
			_modeling.stop()
	)


static func get_calendar() -> EventCalendar:
	return _instance._modeling._event_calendar


static func get_all_actors() -> Array:
	return (_instance._actors
		.get_children()
		.filter(func(n: Node): return n is Actor)
	) as Array[Actor]


static func get_all_planties() -> Array:
	return (_instance._planties
		.get_children()
		.filter(func(n: Node): return n is PlantyPlace)
	) as Array[PlantyPlace]


static func increase_type(type: PlantType) -> void:
	if !_instance.types_counter.has(type):
		_instance.types_counter[type] = 0
	_instance.types_counter[type] += 1
	_instance._ui.show_plant_type(type, _instance.types_counter[type])
