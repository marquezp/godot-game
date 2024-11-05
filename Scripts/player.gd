extends Node2D

@export var speed = 5

func _reload_scene():
	get_tree().reload_current_scene()
	print("Game Over")
	
func take_damage(amount: int) -> void:
	print("Player took damage: ", amount)
	call_deferred("_reload_scene")
	
func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector(
		'left','right',
		'up', 'down')
	direction = direction.normalized()
	if direction.length():
		position = position + direction * speed
