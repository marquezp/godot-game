extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func take_damage(amount: int) -> void:
	animation_player.play("hit")
	print("Damage: ", amount)
	
#@onready var player: CharacterBody2D = $"../Player"
#@onready var enemy: Area2D = $"."
#
#@export var speed = 100
#
#func _process(delta: float) -> void:
	#var target = player.global_position
	#global_position = global_position.move_toward(target,speed * delta)
		#
#func _reload_scene():
	#get_tree().reload_current_scene()
	#
#func _on_body_entered(body: Node2D) -> void:
	#if body.name == "Player":
		#print("you are dead")
		#call_deferred("_reload_scene")


		
		
