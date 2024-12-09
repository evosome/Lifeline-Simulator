extends Control
class_name UI

var _types: Dictionary = {}

@export var _event_notification_packed: PackedScene
@export var _types_counter_packed: PackedScene

@export var play_button: Button
@export var pause_button: Button
@export var _scrollable: ScrollContainer
@export var _event_calendar: VBoxContainer
@export var _types_container: FlowContainer


func _ready() -> void:
	_scrollable.get_v_scroll_bar().changed.connect(
		func():
			_scrollable.scroll_vertical = _scrollable.get_v_scroll_bar().max_value
	)


func show_plant_type(plant_type: PlantType, count: int) -> void:
	if _types.has(plant_type):
		_types[plant_type].set_count(count)
	else:
		var type_counter = _types_counter_packed.instantiate() as TypeCounter
		type_counter.set_count(count)
		type_counter.set_type_texture(plant_type.icon)
		_types_container.add_child(type_counter)
		_types[plant_type] = type_counter


func add_notification_group(
	ticks: int,
	notifications: Array[EventNotification]
) -> void:
	var notification_view: EventNotificationGroupView = \
		_event_notification_packed.instantiate()
	
	_event_calendar.add_child(notification_view)
	
	notification_view.set_ticks_count(ticks)
	notification_view.set_notifications(notifications)
