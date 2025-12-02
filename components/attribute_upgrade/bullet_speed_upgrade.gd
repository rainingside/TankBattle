class_name BulletSpeedUpgrade
extends ITankAttributeUpgrade

@export var BulletSpeed:int

func _p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.BulletSpeed += BulletSpeed
