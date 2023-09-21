extends HBoxContainer

@export var player_name: String = ""
@export var time: String = ""
@export var level_name: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Name.text = player_name
	$Time.text = time
	$Level.text = level_name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
