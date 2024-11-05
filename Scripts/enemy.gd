extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: Node2D = $"../Player"
@export var speed = 100

func take_damage(amount: int) -> void:
	animation_player.play("hit")
	print("Damage: ", amount)
	
func _process(delta: float) -> void:
	var target = player.global_position
	global_position = global_position.move_toward(target,speed * delta)
		
		
