class_name CircleWeapon
extends IWeapon

@export_range(1, 360) var Nums: int = 12

func _init() -> void:
	WeaponKind = Enums.WeaponKinds.Circle
