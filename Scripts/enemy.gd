extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: Node2D = $"../Player"
@onready var health: Health = $Health
@onready var game_manager: Node = $"../GameManager"
@export var speed = 100

# 
func take_damage(amount: int) -> void:
	animation_player.play("hit")
	health.set_health(health.get_health()-amount)
	
func _process(delta: float) -> void:
	var target = player.global_position
	global_position = global_position.move_toward(target,speed * delta)
		
	
# Enemy Death
func _on_health_health_depleted() -> void:
	game_manager.increment_score()
	queue_free()
