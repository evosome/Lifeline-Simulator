extends Event
class_name ThirstyPlantEvent


func perform_action() -> void:
	for actor in Planty.get_all_actors():
		if actor is Plant && actor.is_thirsty():
			actor.water()
