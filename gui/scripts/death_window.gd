extends CanvasLayer

func _ready():
	hide()

func died():
	get_tree().paused = true
	show()

func _on_restart_btn_pressed():
	hide()
	get_tree().paused = false
	get_tree().reload_current_scene()
