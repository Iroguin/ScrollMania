extends VBoxContainer

@export var level:PackedScene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if level == null: 
		$LevelButton.disabled = true
	else: 
		$LevelButton.text = level.resource_path.get_file().trim_suffix('.tscn')



func _on_level_button_pressed() -> void:
	get_tree().change_scene_to_packed(level)
