extends CanvasLayer

func _ready():
	$PauseMenu.hide()

func _on_pause_btn_pressed():
	get_tree().paused = true
	$PauseMenu.show()

func _on_close_btn_pressed():
	$PauseMenu.hide()
	get_tree().paused = false

func _on_restart_btn_pressed():
	$PauseMenu.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()

