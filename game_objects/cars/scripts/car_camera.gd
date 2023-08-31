extends Camera3D
class_name CarCamera3D

@export var follow_node: VehicleBody3D
@export var target_distance:float = 3.0
@export var target_height:float = 2.0

var last_look_at: Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	last_look_at = follow_node.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var delta_v:Vector3 = self.global_position - follow_node.global_position
	var target_pos:Vector3 = self.global_position
	# ignore y
	delta_v.y = 0.0
	
	if delta_v.length() > target_distance:
		delta_v = delta_v.normalized() * target_distance
		delta_v.y = target_height
		target_pos = follow_node.global_transform.origin + delta_v
	else:
		target_pos.y = follow_node.global_transform.origin.y + target_height
	self.global_position = self.global_position.lerp(target_pos, delta * 20)
	
	last_look_at = self.global_position.lerp(follow_node.global_position, delta * 20.0)
	
	look_at(last_look_at, Vector3.UP)
