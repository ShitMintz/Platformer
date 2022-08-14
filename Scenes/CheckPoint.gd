extends Area2D


func _ready():
	$AnimationPlayer.play("CheckPoint")
	
func _Process(delta):
	if GameScripts.get_spawned() != self:
		$AnimationPlayer.play("CheckPoint")



func _on_CheckPoint_body_entered(body):
	if body.is_in_group("Player"):
		GameScripts.set_spawn(self)
		$AnimationPlayer.play("Saved")
