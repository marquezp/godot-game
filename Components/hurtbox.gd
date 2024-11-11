class_name HurtBox
extends Area2D

	
func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	#owner is the root of the scene where you place a node
	if hitbox != null and owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
