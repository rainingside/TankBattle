class_name SectorBulletFire
extends IBulletFire

@export_range(1, 360) var Nums: int = 3
@export_range(0, 359) var Arc:int = 45

func p_fire(parent:Node, gposition: Vector2, dir: Vector2, damage: Damage) -> void:
	var arc_rad:float = deg_to_rad(Arc)
	var dir_begin = dir.rotated(-arc_rad / 2)
	var increment = arc_rad / (Nums - 1)
	for i in range(Nums):
		var bullet = BulletScene.instantiate() as Bullet
		var dir_new = dir_begin.rotated(increment * i)
		bullet.p_init_data(gposition, dir_new, damage)
		parent.add_child(bullet)
