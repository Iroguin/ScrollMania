extends Node

class PlayerData:
	var name: String
	var minutes: int
	var seconds: float

var player_data: Array[PlayerData] = []

func set_player_data(name: String, minutes: int, seconds:float) -> void:
	var player_found: bool = false
	for i in player_data:
		if i.name == name:
			i.minutes = minutes
			i.seconds = seconds
			player_found = true
			break
	if !player_found:
		var data: PlayerData = PlayerData.new()
		data.name = name
		data.minutes = seconds
		data.seconds = seconds
		player_data.push_back(data)
	
