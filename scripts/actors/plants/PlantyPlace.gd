extends Node2D
class_name PlantyPlace

var _plant_ref: Plant = null

@export var _level_ref: Level


func plant(new_plant: Plant) -> void:
	_plant_ref = new_plant
	_plant_ref.position = position
	_level_ref.spawn(new_plant)


func remove() -> void:
	if !_plant_ref:
		return
	_level_ref.despawn(_plant_ref)


func has_plant() -> bool:
	return _plant_ref != null
