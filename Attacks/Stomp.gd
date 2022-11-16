extends Area2D


export var damage = 100


func _process(delta):
	pass


func _on_Timer_timeout():
	queue_free()


func _on_Stomp_body_entered(body):
	if body.is_in_group("Enemies"):
		body.hurt(damage)
