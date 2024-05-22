extends Area2D

signal got_hit

func _on_area_entered(area):
	if area.name == "PlayerArea":
		got_hit.emit()
