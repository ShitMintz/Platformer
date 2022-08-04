extends Area2D


func _ready():
	$AnimationPlayer.play("CheckPoint")
	
func _Process(delta):
	if Game_Scripts.get_spawned() != self:
		$AnimationPlayer.play("CheckPoint")





func _on_CheckPoint_body_entered(body):
	pass # Replace with function body.
