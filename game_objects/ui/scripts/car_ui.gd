extends Control

var seconds: float = 0.0
var minutes: int = 0.0
var track_finished: bool = false

@onready var checkpoint_manager: CheckpointManager = get_tree().get_nodes_in_group("checkpoint_manager")[0]

signal get_time_info(minutes: int, seconds: float)
# Called when the node enters the scene tree for the first time.
func _ready():
	checkpoint_manager.track_finished.connect(_track_finished)


func _physics_process(delta):
	if !track_finished:
		seconds += delta
		if seconds > 59.0:
			minutes += 1
			seconds = 0.0
		$TimerLabel.set_text("Timer: " + str(minutes) + ":" + str(snappedf(seconds, 1)))

func _track_finished() -> void:
	track_finished = true
	emit_signal("get_time_info", minutes, seconds)
