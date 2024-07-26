extends Node2D

var win_condition := false

static var data_file_path = "user://save/"
static var data_file_name = "PlayerData.tres"
static var playerData = PlayerData.new()

var mixtapes = [0, 0, 0]
var lvl_number : int

@onready var node_player = get_node("Player")
@onready var node_cam = get_node("CameraLevel")

func _ready():
	lvl_number = get_tree().get_current_scene().get_name().trim_prefix("Level ").to_int() - 1
	
	for i in 3:
		mixtapes[i] = playerData.lvl_Mixtapes[lvl_number][i+1]
		var node_mix = get_node("Colecionaveis/Mixtape" + str(i+1))
		node_mix.mix_number = i
		node_mix.mix_status = mixtapes[i]
		node_mix.update_frame()

func _physics_process(delta):
	if !win_condition:
		node_cam.position.x += node_player.SKATE_VELOCITY * delta

#Relacionado a mortes
func kill_player():
	get_tree().paused = true
	$CameraLevel/DeathWindow.show()

func _on_got_hit():
	kill_player()

func _on_player_exited_camera():
	if !win_condition:
		kill_player()


#Vitoria do nivel
func _on_victory_area_body_entered(body):
	if body.name == 'Player':
		win_condition = true
		for i in 3:
			playerData.lvl_Mixtapes[lvl_number][i+1] = mixtapes[i]
		$CameraLevel/WinWindow.show()
		$CameraLevel/PauseWindow.hide()


#eColecionaveis
func _on_mixtape_1_collected_mix():
	mixtapes[0] = true

func _on_mixtape_2_collected_mix():
	mixtapes[1] = true

func _on_mixtape_3_collected_mix():
	mixtapes[2] = true
