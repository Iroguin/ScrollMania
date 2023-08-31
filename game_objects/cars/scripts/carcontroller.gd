extends VehicleBody3D

@export var max_brake:float = 20
@export var max_speed:float = 300

#TODO: do this wheel grip thing with some inverse logarythmic math so speed equals less grip
@export var wheel_grip:float = 0
var turning_radius:float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("scroll_press"):
		$left_rear.brake = max_brake
		$right_rear.brake = max_brake
		$left_rear.engine_force = 0
		$right_rear.engine_force = 0
		$right_rear.wheel_friction_slip = 0
		$left_rear.wheel_friction_slip = 0
		$right_front.wheel_friction_slip = 1.0
		$left_front.wheel_friction_slip = 1.0
	else:
		$left_rear.brake = 0
		$right_rear.brake = 0
		$left_rear.engine_force = max_speed
		$right_rear.engine_force = max_speed
		$right_rear.wheel_friction_slip = 6.5
		$left_rear.wheel_friction_slip = 6.5
		$right_front.wheel_friction_slip = 8.5
		$left_front.wheel_friction_slip = 8.5
	if Input.is_action_just_pressed("scroll_left"):
		turning_radius += 8.75
	if Input.is_action_just_pressed("scroll_right"):
		turning_radius -= 8.75
	turning_radius = clamp(turning_radius,-35, 35)
	$left_front.steering = deg_to_rad(turning_radius)
	$right_front.steering = deg_to_rad(turning_radius)
