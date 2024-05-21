extends CharacterBody2D

const JUMP_VELOCITY = -615.0
const SKATE_VELOCITY = 250.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.x = SKATE_VELOCITY
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	move_and_slide()

func _input(event : InputEvent):
	if event.is_action_pressed("move_down") && is_on_floor() :
		position.y += 5
