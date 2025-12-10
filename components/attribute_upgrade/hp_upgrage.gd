class_name HPUpgrade
extends ITankAttributeUpgrade

@export var HP: int  = 20

func _init() -> void:
	UpgradeText = "血量"
	
func p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.HP += HP
