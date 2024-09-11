extends "res://base_level/scripts/level.gd"

@onready var boss = get_node("BossFox")
var boss_vel = 430
var subir:bool = false

func _ready():
	lvl_number = get_tree().get_current_scene().get_name().trim_prefix("Level ").to_int() - 1
	node_progress_bar.set("min_value", get_node("InicioLVL").position.x)
	node_progress_bar.set("max_value", get_node("FinalLVL").position.x)
	
	for i in 3:
		mixtapes[i] = playerData.lvl_Mixtapes[lvl_number][i+1]
		var node_mix = get_node("Colecionaveis/Mixtape" + str(i+1))
		node_mix.mix_number = i
		node_mix.mix_status = mixtapes[i]
		node_mix.update_frame()
	
	boss.get_node("AnimacaoFox").play("idle")

func _process(delta):
	
	boss.position.x += boss_vel * delta
	if !win_condition and boss.position.x >= (node_cam.position.x - 465):
		boss_vel = 412
		node_cam.position.x += 12 * delta
		if node_cam.position.x >= 9915 and node_cam.position.y >= -327:
			node_cam.position.y -= 100 * delta
	
	
	
	node_progress_bar.set("value", node_player.position.x)
