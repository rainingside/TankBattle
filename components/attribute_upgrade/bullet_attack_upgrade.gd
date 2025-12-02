class_name BulletAttackUpgrade
extends ITankAttributeUpgrade

@export var BulletAttack:int

func _p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.BulletAttack += BulletAttack
