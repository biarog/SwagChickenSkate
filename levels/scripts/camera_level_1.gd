extends Camera2D

var CAM_VELOCITY = 250.0

func _physics_process(delta):
	position.x += CAM_VELOCITY * delta

func set_cam_velocity(speed:float):
	CAM_VELOCITY = speed
