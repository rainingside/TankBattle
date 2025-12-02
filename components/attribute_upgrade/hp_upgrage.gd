class_name HPUpgrade
extends ITankAttributeUpgrade

@export var HP: int  = 20

func _p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.HP += HP
