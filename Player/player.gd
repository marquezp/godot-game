extends Node2D

@export var speed = 5
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine

var direction: Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true

func _reload_scene():
	get_tree().reload_current_scene()
	print("Game Over")
	
func take_damage(amount: int) -> void:
	print("Player took damage: ", amount)
	call_deferred("_reload_scene")

func update_facing_direction():
	if direction.x > 0:
		sprite.scale.x = 1
	elif direction.x < 0:
		sprite.scale.x = -1

func update_animation():
	animation_tree.set("parameters/Move/blend_position", max(abs(direction.x), abs(direction.y)))

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector(
		'left','right',
		'up', 'down')
		
	if player_state_machine.check_if_can_move():
		position = position + direction * speed
	
	update_animation()
	update_facing_direction()
	
	
		
	

		
		
		
		
		
