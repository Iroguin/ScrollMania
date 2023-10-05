extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.stream = load("res://assets/music/level3_backroundmusic.mp3")
	self.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
