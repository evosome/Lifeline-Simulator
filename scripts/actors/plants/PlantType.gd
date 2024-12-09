extends Resource
class_name PlantType

@export var icon: Texture2D
@export var textures: Array[Texture2D]

@export var thirst_base: float = 4.0
@export var thirst_threshold: float = 2.0
@export var thirst_amplifier: float = 0.2

@export var age_threshold: float = 10.0
@export var age_amplifier: float = 0.2
