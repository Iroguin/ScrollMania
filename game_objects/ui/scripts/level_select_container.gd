extends Control

@export var levels: Array[PackedScene] = []
@export var level_entry_container_scene: PackedScene = preload("res://game_objects/ui/level_entry.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in levels: 
		var level_select: Control = level_entry_container_scene.instantiate()
		level_select.level = level
		$ScrollContainer/HBoxContainer.add_child(level_select)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	self.visible = false
