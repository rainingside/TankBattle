class_name BulletSpeedUpgrade
extends ITankAttributeUpgrade

@export var BulletSpeed:int = 100

func _init() -> void:
	UpgradeText = "子弹速度"

func p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.BulletSpeed += BulletSpeed
