extends Timer

@onready var spawnTimer: Timer = $"."
@export var nextSpawnTime := 3.0

var preloadedEnemy := preload("res://Scenes/Enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	spawnTimer.start(nextSpawnTime)

func _on_timeout() -> void:
	# Spawn an enemy
	var enemy = preloadedEnemy.instantiate()
	var viewportSize = get_viewport().size
	var xPos := randi() % int(viewportSize.x)
	var yPos := randi() % int(viewportSize.y)
	enemy.position = Vector2(xPos,yPos);
	enemy.scale = Vector2(3,3)
	
	get_tree().current_scene.add_child(enemy)
	# restart timer
	spawnTimer.start(nextSpawnTime)
