class_name SectorWeapon
extends IWeapon

@export_range(1, 360) var Nums: int = 5
@export_range(0, 359) var Arc:int = 45

func _init() -> void:
	WeaponKind = Enums.WeaponKinds.Sector
