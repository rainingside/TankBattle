class_name StraightWeapon
extends IWeapon

@export_range(1, 5) var Nums: int = 1
@export_range(10, 20) var Distance: int = 10

func _init() -> void:
	WeaponKind = Enums.WeaponKinds.Straight
