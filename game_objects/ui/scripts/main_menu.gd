extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LeaderboardContainer.visible = false
	$LevelSelectContainer.visible = false
	$LeaderboardContainer.visibility_changed.connect(_leaderboard_visibility_changed)
	$LevelSelectContainer.visibility_changed.connect(_level_select_visibility_changed)


func _on_play_pressed() -> void:
	$LevelSelectContainer.visible = true


func _on_leaderboard_pressed() -> void:
	$LeaderboardContainer.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()

func _leaderboard_visibility_changed() -> void:
	$MainMenuContainer.visible = !$LeaderboardContainer.visible
func _level_select_visibility_changed() -> void:
	$MainMenuContainer.visible = !$LevelSelectContainer.visible
