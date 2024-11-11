extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var player: Node2D = $"../Player"
@onready var health: Health = $Health
@onready var game_manager: Node = $"../GameManager"
@export var speed = 100

var dead : bool = false

# 
func take_damage(amount: int) -> void:
	animation_tree["parameters/playback"].travel("hurt")
	health.set_health(health.get_health()-amount)
		
# Enemy Death
func _on_health_health_depleted() -> void:
	game_manager.increment_score()
	animation_tree["parameters/playback"].travel("death")
	dead = true

# Wait for end of death animation to clear node
func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "death"):
		queue_free()

# follow the player around
func _process(delta: float) -> void:
	var target = player.global_position
	if ((global_position - target).x > 0):
		sprite.scale.x = -1
	if ((global_position - target).x < 0):
		sprite.scale.x = 1
	if not dead:
		global_position = global_position.move_toward(target,speed * delta)
