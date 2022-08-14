extends Node2D
export (int) var follow_speed = 50


	
func _process(delta):
	$Path2D/PathFollow2D.offset += 50 * delta


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Player Dead")
		if GameScripts.check_reset() == false:
			body.global_position = GameScripts.get_spawn().global_position
