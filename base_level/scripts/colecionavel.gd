extends Area2D

@export var mix_number : int
@export var mix_status : int

signal collected_mix 

func _on_area_entered(area):
	if area.name == "PlayerArea":
		collected_mix.emit()
		self.hide()

func update_frame():
	var frame_coords : Vector2
	frame_coords.x = mix_status
	frame_coords.y = mix_number
	$DesenhoMixtape.set_frame_coords(frame_coords)
