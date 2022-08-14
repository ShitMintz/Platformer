extends Area2D


func _ready():
	$AnimationPlayer.play("SpikeTrigger")


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Player Dead")
		if GameScripts.check_reset() == false:
			body.global_position = GameScripts.get_spawn().global_position
