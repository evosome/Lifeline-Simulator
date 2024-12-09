extends Event
class_name PlantEmptyFieldsEvent

@export var packed_plant: PackedScene
@export var plant_types: Array[PlantType]


func _instantiate_random_plant() -> Plant:
	var plant: Plant = packed_plant.instantiate()
	var plant_type: PlantType = plant_types[randi() % plant_types.size()]
	plant_type.age_amplifier = randf_range(0.2, 1.0)
	plant_type.age_threshold = randf_range(4.0, 20.0)
	plant_type.thirst_base = randf_range(6.0, 20.0)
	plant_type.thirst_amplifier = randf_range(0.1, 1.5)
	plant.plant_type = plant_type
	return plant


func perform_action():
	for node in Planty.get_all_planties():
		var plenty = node as PlantyPlace
		if !plenty.has_plant():
			plenty.plant(_instantiate_random_plant())
