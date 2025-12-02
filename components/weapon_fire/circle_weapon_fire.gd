class_name CircleWeaponFire
extends IWeaponFire

func p_fire(parent:Node, gposition: Vector2, dir: Vector2, bullet_speed:int, bullet_pierce:int, damage: Damage,  weapon:IWeapon) -> void:
	if not (weapon is CircleWeapon):
		return
	var arc:float = PI * 2 / weapon.Nums
	for i in range(weapon.Nums):
		var bullet = weapon.BulletScene.instantiate() as Bullet
		bullet.Speed
		var dirNew = dir.rotated(arc * i)
		bullet.p_init_data(gposition, dirNew, bullet_speed, bullet_pierce, damage)
		parent.add_child(bullet)
