extends Resource
class_name Situation

@export var _condition: Condition
@export var _is_active: bool = true
@export var _bound_events: Array[Event]


func is_active() -> bool:
	return _is_active


func is_condition_passing() -> bool:
	return _condition.is_passing()


func set_is_active(is_active: bool) -> void:
	_is_active = is_active


func get_bound_events() -> Array[Event]:
	return _bound_events
