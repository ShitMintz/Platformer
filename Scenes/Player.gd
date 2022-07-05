extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400
export (int) var slide_speed = 400

var velocity = Vector2.ZERO

export (float) var friction = 10
export (float) var acceleration = 25

enum state {Attack, Fall, Pushing, Jump, StartJump, Idle, Roll, Running}

onready var Player_state = state.Idle

func update_animation(anim):
	pass

func handle_state(state):
	pass

func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir*speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	if velocity.x == Vector2.ZERO:
		Player_state = state.Idle
	elif Input.is_action_just_pressed("Jump") and is_on_floor():
		Player_state = state.StartJump
	elif velocity.x != 0:
		Player_state = state.Running
	
	if not is_on_floor():
		if velocity.y < 0:
			Player_state = state.jump
		if velocity.y > 0:
			Player_state = state.Fall

	handle_state(Player_state)
	update_animation(Player_state)
	#set gravity
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func _ready():
	$AnimationPlayer.play("Idle")
	pass
