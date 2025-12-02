class_name FireInternalUpGrade
extends ITankAttributeUpgrade

@export var FireInternal:float

func _p_apply_upgrade(attribute: TankAttribute) -> void:
	attribute.FireInternal -= FireInternal
