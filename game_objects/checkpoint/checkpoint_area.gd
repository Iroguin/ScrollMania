extends Area3D
class_name CheckpointArea
signal checkpoint_entered(checkpoint:Node3D)

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	self.add_to_group("checkpoint")
func _ready():
	self.body_entered.connect(_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _body_entered(body):
	if body.is_in_group("player"):
		self.emit_signal("checkpoint_entered", self)
		self.remove_from_group("checkpoint")
		self.set_deferred("monitoring", false) 
