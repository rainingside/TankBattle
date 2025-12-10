class_name BulletPierceUpgrade
extends ITankAttributeUpgrade

@export var BulletPierce:int = 1

func _init() -> void:
	UpgradeText = "穿透"

func p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.BulletPierce += BulletPierce
