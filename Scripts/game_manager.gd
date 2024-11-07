extends Node
@onready var score_text: Label = $"../Score"

var score = 0

func _ready():
	score_text.text = "Score: 0"

func increment_score() -> void:
	score += 1
	score_text.text = "Score: " + str(score)
	print(score)
