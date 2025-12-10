class_name SpeedUpgrage
extends ITankAttributeUpgrade

@export var Speed: int = 50

func _init() -> void:
	UpgradeText = "速度"

func p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.Speed += Speed
