extends Node
class_name Level

enum Terrain {
	GRASS,
	DIRT
}

@export var _actors: Node
@export var _terrain: TileMapLayer
@export var _cell_size: Vector2i


func spawn(actor: Actor) -> void:
	_actors.add_child(actor)


func despawn(actor: Actor) -> void:
	_actors.remove_child(actor)
