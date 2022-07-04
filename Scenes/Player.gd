extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400
export (int) var slide_speed = 400

var velocity = Vector2.ZERO

export (float) var friction = 10
export (float) var acceleration = 25

enum state {Attack, Fall, Pushing, Jump, Idle, Roll, Running}

onready var Player_state = state.Idle

func update_animation(anim):
	$AnimationPlayer.play(anim)

func handle_state(state):
	pass

func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir*speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)

func _physics_process(delta):
	pass

func _ready():
	$AnimationPlayer.play("Idle")
	pass
