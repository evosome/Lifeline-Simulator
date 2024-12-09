extends Resource
class_name Event

@export var name: String
@export var icon: Texture2D


func perform_action() -> void:
	pass


func _to_string() -> String:
	return "Event(name=\"%s\")" % [name]
