extends Node2D


#Main stats of player
export var max_health = 100
var health = max_health
var next_level = 100
var xp = 0
var level = 1

#exports for instanced scenes
export(PackedScene) var template_enemy



func _ready():
	randomize()
	add_to_group("Gamestate")


func _process(delta):
	update_gui()


func update_gui():
	get_tree().call_group("GUI", "update_healthbar", max_health, health)
	get_tree().call_group("GUI", "update_progressbar", next_level, xp)


func _on_TemplateEnemyTimer_timeout():
	spawn_template_enemy()


func spawn_template_enemy():
	var enemy = template_enemy.instance()
	var enemy_spawn_location = get_node("MobPath/PathFollow2D")
	enemy_spawn_location.offset = randi()
	enemy.position = enemy_spawn_location.position
	add_child(enemy)
