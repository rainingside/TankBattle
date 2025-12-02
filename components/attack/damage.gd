class_name Damage
extends Resource

@export var DamageFrom: Enums.DamageFroms
@export var Attack:int

func p_init(from: Enums.DamageFroms, attack: int) -> void:
	DamageFrom = from
	Attack = attack
