extends Control

const LEVEL_BTN = preload("res://gui/cenas/change_scene_button.tscn")

@export_dir var dir_path

@onready var grid = $GridLevels
@onready var screen = $Camera
@onready var btn_right = $Camera/MoveScreenRight
@onready var btn_left = $Camera/MoveScreenLeft

var qnt_levels := 0
var tela_atual := 1

func left_btn_vis():
	if(tela_atual == 1 && btn_left.is_visible()):
		btn_left.hide()
	elif (tela_atual > 1 && !btn_left.is_visible()):
		btn_left.show()

func right_btn_vis():
	if(tela_atual == qnt_levels && btn_right.is_visible()):
		btn_right.hide()
	elif (tela_atual < qnt_levels && !btn_right.is_visible()):
		btn_right.show()

func _ready() -> void:
	get_levels(dir_path)
	left_btn_vis()
	right_btn_vis()

#Para cada arquivo no diretorio definido pelo dir_path sera adicionada uma nova coluna na grid
#e chama a funcao create_level_button
func get_levels(path) -> void:
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "" :
			qnt_levels += 1
			grid.set_columns(qnt_levels)
			create_level_button('%s/%s' % [dir.get_current_dir(), file_name], file_name)
			file_name = dir.get_next()
		
		dir.list_dir_end()
		
	else:
		print('An error occurred when tring to access the path')

#Instancia um novo botao de nivel, alem de adiciona-lo na grid
func create_level_button(level_path: String, level_name: String) -> void:
	var button = LEVEL_BTN.instantiate()
	button.text = level_name.trim_suffix('.tscn').replace('_', ' ')
	button.scene_path = level_path
	grid.add_child(button)

func move_screen(move_to: Vector2) -> void:
	var tween = create_tween()
	tween.tween_property(screen, "position", move_to, 0.7).set_trans(Tween.TRANS_BACK)

func _on_move_screen_right_pressed() -> void:
	tela_atual += 1
	var movimento : Vector2 = screen.position
	movimento.x += 1096
	move_screen(movimento)
	left_btn_vis()
	right_btn_vis()

func _on_move_screen_left_pressed()  -> void:
	tela_atual -= 1
	var movimento : Vector2 = screen.position
	movimento.x -= 1096
	move_screen(movimento)
	left_btn_vis()
	right_btn_vis()
