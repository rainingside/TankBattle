class_name BulletPierceUpgrade
extends ITankAttributeUpgrade

@export var BulletPierce:int

func _p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.BulletPierce += BulletPierce
