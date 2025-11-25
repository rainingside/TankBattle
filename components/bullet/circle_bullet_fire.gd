class_name CircleBulletFire
extends IBulletFire

@export_range(1, 360) var Nums: int = 1

func p_fire(parent:Node, gposition: Vector2, dir: Vector2, damage: Damage) -> void:
	var arc:float = PI * 2 / Nums
	for i in range(Nums):
		var bullet = BulletScene.instantiate() as Bullet
		var dirNew = dir.rotated(arc * i)
		bullet.p_init_data(gposition, dirNew, damage)
		parent.add_child(bullet)
