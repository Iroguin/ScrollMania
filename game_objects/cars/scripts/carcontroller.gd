extends VehicleBody3D

@export var max_brake:float = 20000
@export var max_speed:float = 600

#TODO: do this wheel grip thing with some inverse logarythmic math so speed equals less grip
@export var wheel_grip:float = 0
var turning_radius:float = 0.0
var time:float = 0.0
var is_drifting:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if linear_velocity.y < -30: 
		self.linear_velocity = Vector3.ZERO
		turning_radius = 0.0
		self.global_position = CheckpointManager.last_position
		self.global_rotation = CheckpointManager.last_checkpoint_rotation


func _physics_process(delta):
	if Input.is_action_pressed("scroll_press"):
		time += delta
		if time > 0.5:
			is_drifting = false
			$left_rear.brake = max_brake
			$right_rear.brake = max_brake
			$left_rear.engine_force = 0.0
			$right_rear.engine_force = 0.0
			print(is_drifting)
	else:
		time = 0.0
		$left_rear.brake = 0
		$right_rear.brake = 0
		$left_rear.engine_force = max_speed
		$right_rear.engine_force = max_speed
		
	if Input.is_action_just_pressed("scroll_press"):
		is_drifting = !is_drifting
	
	if is_drifting == true:
		print(transform.basis.z)
		apply_central_force(transform.basis.z * 400)
		$left_rear.engine_force = 0.0
		$right_rear.engine_force = 0.0
		$right_rear.wheel_friction_slip = 0.1
		$left_rear.wheel_friction_slip = 0.1
		$right_front.wheel_friction_slip = 2.0
		$left_front.wheel_friction_slip = 2.0
		
	if is_drifting == false:
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
