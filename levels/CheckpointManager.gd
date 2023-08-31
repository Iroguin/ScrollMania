extends Node
@export var checkpoints:Array[CheckpointArea] = [] 
var checkpoints_passed:int = 0 
var checkpoint_amount:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_amount = checkpoints.size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for checkpoint in checkpoints:
		if checkpoint.entered: 
			checkpoints_passed += 1
			checkpoints.erase(checkpoint)
			print(checkpoints_passed)
		
		
