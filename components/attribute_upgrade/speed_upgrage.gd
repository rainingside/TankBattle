class_name SpeedUpgrage
extends ITankAttributeUpgrade

@export var Speed: int = 50

func _p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.Speed += Speed
