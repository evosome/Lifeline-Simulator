extends Event
class_name ActEvent


func perform_action() -> void:
	for node in Planty.get_all_actors():
		var actor = node as Actor
		actor.act()
