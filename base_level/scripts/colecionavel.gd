extends Area2D

signal collected_mix

func _on_area_entered(area):
	if area.name == "PlayerArea":
		collected_mix.emit()
		self.hide()
