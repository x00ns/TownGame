extends "res://Scripts/Character.gd"

var jumping: bool = false
var running: bool = false
var boxing: bool = false
var current_speed: float = 0.0

@onready var cam: Camera3D = $Camera3D
@export var MOUSE_SENSITIVITY: float = 0.1

func _ready() -> void:
	WALKING_SPEED = randf_range(MIN_SPEED, MAX_SPEED)
	current_speed = WALKING_SPEED
	print(WALKING_SPEED)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENSITIVITY))
		# rotate X
		cam.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENSITIVITY))
		# clamp X rotating
		cam.rotation.x = clamp(
			cam.rotation.x,
			deg_to_rad(-45),
			deg_to_rad(45)
		)

func _physics_process(delta: float) -> void:
	current_speed = WALKING_SPEED
	var dir = Vector3.ZERO
	# apply gravity
	update(delta)
	# direction
	if (Input.is_action_pressed("forward")): dir = -transform.basis.z
	if (Input.is_action_pressed("backward")): dir = transform.basis.z
	if (Input.is_action_pressed("left")): dir = -transform.basis.x
	if (Input.is_action_pressed("right")): dir = transform.basis.x
	
	inp_dir = dir.normalized()
	# states
	running = Input.is_action_just_pressed("shift")
	jumping = Input.is_action_pressed("ui_accept")
	boxing= Input.is_action_just_pressed("mouse_left_click")
	# update state machine
	state_machine.update(delta)
	# apply moving
	move_and_slide()
