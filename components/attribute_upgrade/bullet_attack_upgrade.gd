class_name BulletAttackUpgrade
extends ITankAttributeUpgrade

@export var BulletAttack:int = 10

func _init() -> void:
	UpgradeText = "攻击"

func p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.BulletAttack += BulletAttack
