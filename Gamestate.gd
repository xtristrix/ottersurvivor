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
	check_for_level_up()


func update_gui():
	get_tree().call_group("GUI", "update_healthbar", max_health, health)
	get_tree().call_group("GUI", "update_progressbar", next_level, xp, level)
	get_tree().call_group("GUI", "update_countdown", $CountdownTimer.time_left)


func _on_TemplateEnemyTimer_timeout():
	spawn_template_enemy()


func update_xp(add_xp):
	xp += add_xp


func check_for_level_up():
	if xp >= next_level:
		xp -= next_level
		next_level = int(next_level * 1.1)
		level += 1


func _on_CountdownTimer_timeout():
	print("timeout")


func spawn_template_enemy():
	var enemy = template_enemy.instance()
	var enemy_spawn_location = get_node("MobPath/PathFollow2D")
	enemy_spawn_location.offset = randi()
	enemy.position = enemy_spawn_location.position
	add_child(enemy)


func changeHealth(change):
	health += change


