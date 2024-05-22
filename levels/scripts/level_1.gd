extends Node2D

var win_condition := false

func kill_player():
	get_tree().paused = true
	$CameraLevel/DeathWindow.show()

func _on_got_hit():
	kill_player()

func _on_player_exited_camera():
	if !win_condition:
		kill_player()

func _on_victory_area_body_entered(body):
	if body.name == 'Player':
		win_condition = true
		$CameraLevel.set_cam_velocity(0.0)
