extends KinematicBody2D


onready var player = get_parent().get_node("Player")
var path_to_player = null
export var speed = 100


func _ready():
	pass


func _process(delta):
	follow_player()
	move_and_slide(path_to_player * speed)


func follow_player():
	path_to_player = (player.global_position - global_position).normalized()
