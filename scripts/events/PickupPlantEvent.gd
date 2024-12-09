extends Event
class_name PickupPlantEvent


func perform_action() -> void:
	for actor in Planty.get_all_actors():
		if actor is Plant && actor.need_pick():
			actor.pick()
			Planty.increase_type(actor.plant_type)
