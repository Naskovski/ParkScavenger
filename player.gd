extends CharacterBody3D

@export var WALK_SPEED := 3.0
@export var RUN_SPEED := 8.5
@export var JUMP_VELOCITY := 4.5
@export var ROTATION_SPEED := 2.0
@export var WALK_THRESHOLD := 0.5  

@onready var camera = $Camera3D
@onready var animation_player = $AnimationPlayer

var gravity = ProjectSettings.get("physics/3d/default_gravity")

func _ready():
	add_to_group("player")


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("jump")) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		play_animation("Run")

	var move_input = Input.get_axis("ui_down", "ui_up")
	var turn_input = Input.get_axis("ui_right", "ui_left")

	if turn_input:
		rotate_y(turn_input * ROTATION_SPEED * delta)

	var is_running = Input.is_action_pressed("run") 
	var speed = RUN_SPEED if is_running else WALK_SPEED

	var direction = -transform.basis.z * move_input
	direction.y = 0
	direction = direction.normalized()

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		if is_running:
			play_animation("Run")
		else:
			play_animation("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		play_animation("Survey") 

	move_and_slide()

func play_animation(anim_name: String):
	if animation_player.current_animation != anim_name:
		animation_player.play(anim_name)
