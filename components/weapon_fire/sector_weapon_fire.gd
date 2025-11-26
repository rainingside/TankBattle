class_name SectorWeaponFire
extends IWeaponFire

func p_fire(parent:Node, gposition: Vector2, dir: Vector2, damage: Damage, weapon:IWeapon) -> void:
	if not (weapon is SectorWeapon):
		return
	var arc_rad:float = deg_to_rad(weapon.Arc)
	var dir_begin = dir.rotated(-arc_rad / 2)
	var increment = arc_rad / (weapon.Nums - 1)
	for i in range(weapon.Nums):
		var bullet = weapon.BulletScene.instantiate() as Bullet
		var dir_new = dir_begin.rotated(increment * i)
		bullet.p_init_data(gposition, dir_new, damage)
		parent.add_child(bullet)
