extends Node2D


#Main stats of player
export var max_health = 100
var health = max_health
var next_level = 100
var xp = 0
var level = 1


func _ready():
	add_to_group("Gamestate")


func _process(delta):
	update_gui()


func update_gui():
	get_tree().call_group("GUI", "update_healthbar", max_health, health)
	get_tree().call_group("GUI", "update_progressbar", next_level, xp)

