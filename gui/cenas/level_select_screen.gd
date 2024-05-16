extends Control

const LEVEL_BTN = preload("res://gui/cenas/change_scene_button.tscn")

@export_dir var dir_path

@onready var grid = $GridLevels

var qnt_levels := 0

func _ready() -> void:
	get_levels(dir_path)

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
