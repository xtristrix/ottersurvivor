extends KinematicBody2D


onready var player = get_parent().get_node("Player")
var path_to_player = null
export var speed = 100
export var health = 100
export var xp = 20


func _ready():
	pass


func _process(delta):
	check_if_alive()
	follow_player()
	move_and_slide(path_to_player * speed)


func hurt(damage):
	health -= damage


func follow_player():
	path_to_player = (player.global_position - global_position).normalized()


func check_if_alive():
	if health <= 0:
		die()

func die():
	get_tree().call_group("Gamestate", "update_xp", xp)
	queue_free()
