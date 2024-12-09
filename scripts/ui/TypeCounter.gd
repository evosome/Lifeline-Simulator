extends Control
class_name TypeCounter

@export var _count_label: Label
@export var _type_texture_rect: TextureRect


func set_count(value: int) -> void:
	_count_label.text = str(value)


func set_type_texture(texture: Texture2D) -> void:
	_type_texture_rect.texture  = texture
