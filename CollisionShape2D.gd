extends CollisionShape2D

func _on_body_entered(body):
	if body.name == "player":
		get_tree().reload_current_scene()