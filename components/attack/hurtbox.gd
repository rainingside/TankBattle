class_name Hurtbox 
extends Area2D

signal hurt(damage:Damage)

@export var From:Enums.DamageFroms

func _ready() -> void:
	area_entered.connect(on_area_entered)
	
func on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		if owner == area.owner:
			return
		area.hit.emit(From)
		hurt.emit(area.HitDamage)
