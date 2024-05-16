extends CharacterBody2D

var grav = 10
var speed = 100
func _process(delta):
	
	if !is_on_floor():
		velocity.y += grav
		
	velocity.x = 0
	
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y -= speed
	move_and_slide()
	
	#elif is_on_floor() and Input.is_action_just_pressed("ui_down"):

