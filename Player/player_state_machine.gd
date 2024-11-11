extends Node
class_name PlayerStateMachine

@export var current_state: State
@export var animation_tree : AnimationTree

var states : Array[State]

func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			# Set the states up with what they need to function
			child.playback = animation_tree["parameters/playback"]
		else:
			push_warning("Child " + child.name + " is not a state for PlayerStateMachine")

func _physics_process(_delta: float) -> void:
	if (current_state.next_state != null):
		switch_states(current_state.next_state)
		
func check_if_can_move():
	return current_state.can_move
	
func switch_states(new_state: State):
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	current_state = new_state
	current_state.on_enter()

# calls the state_input function on the state that is currently running
func _input(event: InputEvent):
	current_state.state_input(event)
