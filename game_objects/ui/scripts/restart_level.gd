extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_yes_pressed() -> void:
	get_tree().reload_current_scene()


func _on_no_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/main_level.tscn")
