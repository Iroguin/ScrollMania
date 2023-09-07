extends Node
var checkpoints:Array[CheckpointArea] =  []
var checkpoints_passed:int = 0 
var checkpoint_amount:int = 0
@onready var last_position: Vector3 = get_tree().get_nodes_in_group("player")[0].global_position
@onready var last_checkpoint_rotation: Vector3 = get_tree().get_nodes_in_group("player")[0].global_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_amount = checkpoints.size()
	for check in get_tree().get_nodes_in_group("checkpoint"): 
		checkpoints.push_back(check as CheckpointArea)
	for checkpoint in checkpoints:
		checkpoint.checkpoint_entered.connect(_on_checkpoint_entered)

func _on_checkpoint_entered(checkpoint: Node3D):
	checkpoints_passed += 1
	last_position = get_tree().get_nodes_in_group("player")[0].global_position
	last_checkpoint_rotation = Vector3(0, checkpoint.global_rotation.y, 0)
	last_position.y += 2.0
	
