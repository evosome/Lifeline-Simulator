extends PanelContainer
class_name EventView

@export var _icon_texture_rect: TextureRect
@export var _event_name_label: Label


func set_icon(texture: Texture2D) -> void:
	_icon_texture_rect.texture = texture


func set_event_name(name: String) -> void:
	_event_name_label.text = name
