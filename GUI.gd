extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func update_healthbar(health_max, health):
	$Control/HealthBar.max_value = health_max
	$Control/HealthBar.value = health
	$Control/LblHealth.text = str(health) + "/" + str(health_max) 

func update_progressbar(max_xp, xp, level):
	$Control/ProgressBar.max_value = max_xp
	$Control/ProgressBar.value = xp
	$Control/LblProgress.text = str(xp) + "/" + str(max_xp)
	$Control/LblLevel.text = "Lvl.: " + str(level)

func update_countdown(time_left):
	var time_left_int = int(time_left)
	var seconds = time_left_int % 60
	if seconds < 10:
		seconds = "0" + str(seconds)
	var minutes = (time_left_int / 60)%60
	$Control/lblCountdown.text = str(minutes) + ":" + str(seconds)
