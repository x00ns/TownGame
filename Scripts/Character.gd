extends CharacterBody3D

@export_category("Movement base")
@export var GRAVITY : float = ProjectSettings.get_setting("physics/3d/default_gravity")
@export var MIN_SPEED: float = 4.0
@export var MAX_SPEED: float = 6.0
@export var WALKING_SPEED: float = 0.0

@onready var state_machine: Node = $CharacterState
var inp_dir: Vector3 = Vector3.ZERO

func update(delta: float) -> void:
	velocity.y -= GRAVITY * delta
