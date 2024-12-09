extends PanelContainer
class_name EventNotificationGroupView

@export var _event_packed: PackedScene

@export var ticks_count_label: Label
@export var events_container: VBoxContainer


func set_ticks_count(value: int) -> void:
	ticks_count_label.text = str(value)


func set_notifications(notifications: Array[EventNotification]) -> void:
	for notification in notifications:
		var event_view: EventView = _event_packed.instantiate()
		event_view.set_icon(notification.get_event().icon)
		event_view.set_event_name(notification.get_event().name)
		events_container.add_child(event_view)
	
