extends Node
var checkpoints:Array[CheckpointArea] =  []
var checkpoints_passed:int = 0 
var checkpoint_amount:int = 0
@onready var last_position: Vector3 = get_tree().get_nodes_in_group("player")[0].global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_amount = checkpoints.size()
	for check in get_tree().get_nodes_in_group("checkpoint"): 
		checkpoints.push_back(check as CheckpointArea)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for checkpoint in checkpoints:
		if checkpoint.entered: 
			checkpoints_passed += 1
			last_position = get_tree().get_nodes_in_group("player")[0].global_position
			checkpoints.erase(checkpoint)
		
		
