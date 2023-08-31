extends Control

var seconds: float = 0.0
var minutes: int = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	seconds += delta
	if seconds > 59.0:
		minutes += 1
		seconds = 0.0
	$TimerLabel.set_text("Timer: " + str(minutes) + ":" + str(snappedf(seconds, 1)))
