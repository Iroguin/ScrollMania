extends Control

var minutes: int = 0
var seconds: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	CheckpointManager.track_finished.connect(_track_finished)
	var parent = get_parent()
	if parent.has_signal("get_time_info"):
		parent.get_time_info.connect(_get_time_info)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_name_text_box_text_changed() -> void:
	$VBoxContainer/Buttons/Yes.disabled = $VBoxContainer/NameTextBox.text == ""

func _track_finished() -> void:
	self.visible = true

func _get_time_info(minutes: int, seconds: float) -> void:
	$VBoxContainer/TimerLabel.set_text("Finished time: " + str(minutes) + ":" + str(snappedf(seconds, 1)))
	self.minutes = minutes
	self.seconds = seconds


func _on_yes_pressed() -> void:
	GameManager.set_player_data($VBoxContainer/NameTextBox.text, minutes, seconds)
	get_tree().change_scene_to_file("res://levels/main_menu.tscn")


func _on_no_pressed() -> void:
	pass # Replace with function body.
