extends CharacterBody2D

@onready var animation = $Sprite/AnimationPlayer

const JUMP_VELOCITY = -615.0
@export var SKATE_VELOCITY : float

signal exited_camera

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.x = SKATE_VELOCITY
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("jump")
		
	move_and_slide()

func _input(event : InputEvent):
	if event.is_action_pressed("move_down") && is_on_floor() :
		position.y += 5

func _on_visible_on_screen_notifier_2d_screen_exited():
	exited_camera.emit()
