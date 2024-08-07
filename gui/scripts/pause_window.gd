extends CanvasLayer

func _ready():
	$PauseMenu.hide()

func pause():
	get_tree().paused = true
	$PauseMenu.show()

func unpause():
	$PauseMenu.hide()
	get_tree().paused = false

func _on_pause_btn_pressed():
	pause()

func _on_close_btn_pressed():
	unpause()

func _on_restart_btn_pressed():
	unpause()
	get_tree().reload_current_scene()

