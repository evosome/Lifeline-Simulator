extends Object
class_name EventNotification

var _event: Event
var _timestamp: int


func _init(event: Event, timestamp: int) -> void:
	_event = event
	_timestamp = timestamp


func get_event() -> Event:
	return _event


func get_timestamp() -> int:
	return _timestamp


func _to_string() -> String:
	return "EventNotification(event=\"%s\", timestamp=%d)" % [_event, _timestamp]
