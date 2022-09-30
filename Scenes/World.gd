extends Node2D


func _ready():
	pass


func _process(_delta):

	if Input.is_action_just_pressed("reset"):
		GameScripts.reset()
	print(GameScripts.get_time())
	$CanvasLayer/Control/Label.text = GameScripts.get_time()
	
