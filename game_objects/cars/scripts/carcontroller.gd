extends VehicleBody3D

@export var max_brake:float = 50 
@export var max_speed:float = 30
@export var accel:float = 100
@export var global_grip:float = 1 

#TODO: do this wheel grip thing with some inverse logarythmic math so speed equals less grip
@export var wheel_grip:float = 0
var turning_radius:float = 0.0
var time:float = 0.0
var is_drifting:bool = false

@onready var checkpoint_manager: CheckpointManager = get_tree().get_nodes_in_group("checkpoint_manager")[0]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if linear_velocity.y < -30: 
		self.linear_velocity = Vector3.ZERO
		turning_radius = 0.0
		self.global_position = checkpoint_manager.last_position
		self.global_rotation = checkpoint_manager.last_checkpoint_rotation


func _physics_process(delta):
	global_grip = linear_velocity.length()
	if linear_velocity.length() > max_speed:
		$left_rear.engine_force = 0.0
		$right_rear.engine_force = 0.0
	else: 
		$left_rear.engine_force = accel
		$right_rear.engine_force = accel
	if Input.is_action_pressed("scroll_press"):
		time += delta
		if time > 0.2:
			is_drifting = false
			$left_rear.brake = max_brake
			$right_rear.brake = max_brake
			$left_front.brake = max_brake
			$right_front.brake = max_brake
			$left_rear.engine_force = 0.0
			$right_rear.engine_force = 0.0
	else:
		time = 0.0
		$left_front.brake = 0
		$right_front.brake = 0
		$left_rear.brake = 0
		$right_rear.brake = 0

	if Input.is_action_just_pressed("scroll_press"):
		is_drifting = !is_drifting
	
	if is_drifting == true:
		apply_central_force(-transform.basis.z * 200)
		$left_rear.engine_force = 0.0
		$right_rear.engine_force = 0.0
		$right_rear.wheel_friction_slip = 0.5
		$left_rear.wheel_friction_slip = 0.5
		$right_front.wheel_friction_slip = 0.5
		$left_front.wheel_friction_slip = 0.5
		
	if is_drifting == false:
		$right_rear.wheel_friction_slip = 1 + global_grip * 0.2
		$left_rear.wheel_friction_slip = 1 + global_grip * 0.2
		$right_front.wheel_friction_slip = 1 + global_grip * 0.2
		$left_front.wheel_friction_slip = 1 + global_grip * 0.2
	if Input.is_action_just_pressed("scroll_left"):
		turning_radius = lerpf(turning_radius, turning_radius + 11.666, 5 * delta)
	if Input.is_action_just_pressed("scroll_right"):
		turning_radius = lerpf(turning_radius, turning_radius - 11.666, 5 * delta)
	turning_radius = clamp(turning_radius,-35, 35)
	$left_front.steering = deg_to_rad(turning_radius)
	$right_front.steering = deg_to_rad(turning_radius)
