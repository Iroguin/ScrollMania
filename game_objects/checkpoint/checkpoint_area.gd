extends Area3D
class_name CheckpointArea
var entered:bool = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	self.body_entered.connect(_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func _body_entered(body):
	if body.name == "caterham":
		entered = true  
		
