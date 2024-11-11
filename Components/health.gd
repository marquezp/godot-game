class_name Health
extends Node

signal health_depleted()

@export var max_health: int = 20
@onready var health: int = max_health : set = set_health, get = get_health

	
func set_health(value: int):
	var clamped_value = clampi(value, 0, max_health)
	if clamped_value != health:
		health = clamped_value
		
		if health == 0:
			health_depleted.emit()
	
func get_health() -> int:
	return health

	
