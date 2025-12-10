class_name CircleWeapon
extends IWeapon

@export_range(4, 360) var Nums: int = 12

func _init() -> void:
	WeaponKind = Enums.WeaponKinds.Circle

func p_init(bulletScene:PackedScene, nums:int) -> void:
	BulletScene = bulletScene
	Nums = nums

func p_init_random(bulletScene:PackedScene) -> void:
	Nums = randi_range(4, 12)
	p_init(bulletScene, Nums)
