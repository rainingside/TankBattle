class_name FireInternalUpGrade
extends ITankAttributeUpgrade

@export var FireInternal:float = 0.2

func _init() -> void:
	UpgradeText = "攻击间隔"

func p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.FireInternal -= FireInternal
