class_name SectorWeapon
extends IWeapon

@export_range(1, 360) var Nums: int = 5
@export_range(0, 360) var Arc:int = 45

func _init() -> void:
	WeaponKind = Enums.WeaponKinds.Sector

func p_init(bulletScene:PackedScene, nums:int, arc:int) -> void:
	BulletScene = bulletScene
	Nums = nums
	Arc = arc

func p_init_random(bulletScene:PackedScene) -> void:
	var nums = randi_range(3, 12)
	var arc = randi_range(45, 360)
	p_init(bulletScene, nums, arc)
