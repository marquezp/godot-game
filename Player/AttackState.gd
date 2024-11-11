extends State
class_name AttackState

@export var move_state: State

func on_enter():
	print("attacked")
	
func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "attack"):
		next_state = move_state
