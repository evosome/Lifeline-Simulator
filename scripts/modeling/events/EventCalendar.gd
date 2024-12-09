extends Node
class_name EventCalendar

signal notification_added(notification: EventNotification)


class EventNode:
	var event: EventNotification
	var next: EventNode
	var prev: EventNode
	
	func _init(
		event: EventNotification,
		next: EventNode,
		prev: EventNode
	) -> void:
		self.event = event
		self.next = next
		self.prev = prev
	
	func add_after(other: EventNode) -> void:
		self.next = other.next
		self.prev = other
		other.next.prev = self
		other.next = self
	
	static func of(event: EventNotification) -> EventNode:
		return EventNode.new(
			event, null, null
		)
	
	static func empty() -> EventNode:
		return EventNode.new(null, null, null)


var _head: EventNode


func _init() -> void:
	_bind_head()


func _bind_head() -> void:
	_head = EventNode.empty()
	_head.next = _head
	_head.prev = _head


func add(event: EventNotification) -> void:
	var new_node = EventNode.of(event)
	
	if is_empty():
		new_node.add_after(_head)
	else:
		var current_node: EventNode = _head.next
		while (
			current_node.next != _head &&
			current_node.event.get_timestamp() < event.get_timestamp()
		):
			current_node = current_node.next
		
		new_node.add_after(current_node)
	
	notification_added.emit(event)


func filter(predicate: Callable) -> Array[EventNotification]:
	var values: Array[EventNotification] = []
	var current_node = _head.next
	while current_node != _head:
		if predicate.call(current_node.event):
			values.append(current_node.event)
		current_node = current_node.next
	return values


func is_empty() -> bool:
	return _head.next == _head


func as_array() -> Array:
	var values: Array[EventNotification] = []
	var current_node = _head.next
	while current_node.next != _head:
		values.append(current_node.event)
		current_node = current_node.next
	return values
