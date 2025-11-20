class_name Hurtbox 
extends Area2D

signal hit(damage:Damage)

func _ready() -> void:
	area_entered.connect(on_area_entered)
	
func on_area_entered(area: Area2D) -> void:
	if owner == area.owner:
		return
	if area is Hitbox:
		hit.emit(area.HitDamage)
