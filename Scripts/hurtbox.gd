class_name HurtBox
extends Area2D

func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	
func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null:
		return
	#owner is the root of the scene where you place a node
	if hitbox.owner.name != owner.name and owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
