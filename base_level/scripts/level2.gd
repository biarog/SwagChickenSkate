extends "res://base_level/scripts/level.gd"

@onready var boss = get_node("BossFox")
var boss_vel = 430
var subir:bool = false

func _ready():
	boss.get_node("AnimacaoFox").play("idle")
	node_progress_bar.set("min_value", get_node("InicioLVL").position.x)
	node_progress_bar.set("max_value", get_node("FinalLVL").position.x)

func _process(delta):
	
	boss.position.x += boss_vel * delta
	if !win_condition and boss.position.x >= (node_cam.position.x - 465):
		boss_vel = 412
		node_cam.position.x += 12 * delta
	
	node_progress_bar.set("value", node_player.position.x)
