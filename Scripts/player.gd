extends Node2D

@export var speed = 5

func take_damage(amount: int) -> void:
	print("Player took damage: ", amount)
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector(
		'left','right',
		'up', 'down')
	direction = direction.normalized()
	if direction.length():
		position = position + direction * speed
