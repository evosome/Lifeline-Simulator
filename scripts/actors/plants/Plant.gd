extends Actor
class_name Plant

enum States {
	SEED,
	SMALL,
	YOUNG,
	MATURE,
}

@export var _sprite: Sprite2D
@export var _watering_animation: AnimationPlayer

@export var plant_type: PlantType
@export var base_state: States = States.SEED

var _age: float

@onready var _textures_map = plant_type.textures
@onready var _thirst_base: float = plant_type.thirst_base
@onready var _thirst_threshold: float = plant_type.thirst_threshold
@onready var _age_threshold: float = plant_type.age_threshold
@onready var _age_amplifier: float = plant_type.age_amplifier
@onready var _thirst_amplifier: float = plant_type.thirst_amplifier

@onready var _thirst: float = _thirst_base
@onready var _state: States = base_state
@onready var _next_threshold: float = _age_threshold


func _ready() -> void:
	_sprite.texture = _textures_map[_state]


func act() -> void:
	_age += _age_amplifier
	_thirst -= _thirst_amplifier
	
	if _thirst <= 0:
		# add died state
		_sprite.texture = _textures_map[_state]
	
	if _age > _next_threshold && _state < States.MATURE:
		_state += 1
		_next_threshold += _age_threshold
		_sprite.texture = _textures_map[_state]


func water() -> void:
	_thirst = _thirst_base
	_watering_animation.play("watering")


func is_thirsty() -> bool:
	return _thirst < _thirst_threshold


func need_pick() -> bool:
	return _state == States.MATURE

func pick() -> void:
	queue_free()
