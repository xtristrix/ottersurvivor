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


func update_progressbar(max_xp, xp):
	$Control/ProgressBar.max_value = max_xp
	$Control/ProgressBar.value = xp
