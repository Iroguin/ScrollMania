extends Control

@export var leaderboard_entry_scene: PackedScene = preload("res://game_objects/ui/leaderboard_entry.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for entry in GameManager.player_data:
		var leaderboard_entry: Control = leaderboard_entry_scene.instantiate()
		leaderboard_entry.player_name = entry.name
		leaderboard_entry.time = str(entry.minutes) + ":" + str(entry.seconds)
		leaderboard_entry.level_name = entry.level
		$EntryContainer.add_child(leaderboard_entry)


func _on_back_pressed() -> void:
	self.visible = false
