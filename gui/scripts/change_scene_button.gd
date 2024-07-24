extends Button

@export_file var scene_path

var original_size := scale
var grow_size := Vector2(1.1, 1.1)

func _ready():
	pivot_offset = size/2

#Funcao cosmetica pra aumentar o tamanho do botao quando o mouse passa em cima
func _on_mouse_entered():
	change_button(grow_size, 0.1)

#Funcao cosmetica que diminui o tamanho do botao quando o mouse sai de cima
func _on_mouse_exited():
	change_button(original_size, 0.1)

#Funcao que modifica o tamanho do botao
func change_button(end_size: Vector2, duration: float):
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'scale', end_size, duration)

#Funcao que muda a cena quando o botao eh pressionado
func _on_pressed():
	get_tree().paused = false
	if scene_path == null:
		return
	get_tree().change_scene_to_file(scene_path)
