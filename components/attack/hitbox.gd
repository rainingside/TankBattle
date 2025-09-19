class_name Hitbox
extends Area2D

signal hit(damage:Damage)

func _ready() -> void:
	area_entered.connect(on_area_entered)
	
func on_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		hit.emit(area.Damage)
