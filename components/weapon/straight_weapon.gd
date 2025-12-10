class_name StraightWeapon
extends IWeapon

@export_range(1, 5) var Nums: int = 1
@export_range(10, 20) var Distance: int = 10

func _init() -> void:
	WeaponKind = Enums.WeaponKinds.Straight

func p_init(bulletScene:PackedScene, nums:int, distance:int) -> void:
	BulletScene = bulletScene
	Nums = nums
	Distance = distance

func p_init_random(bulletScene:PackedScene) -> void:
	var nums = randi_range(1, 5)
	var distance = randi_range(10, 20)
	p_init(bulletScene, nums, distance)
