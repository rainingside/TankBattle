class_name StraightWeaponFire
extends IWeaponFire

func p_fire(parent:Node, gposition: Vector2, dir: Vector2, damage: Damage, weapon:IWeapon) -> void:
	if not (weapon is StraightWeapon):
		return
	for i in range(weapon.Nums):
		var bullet = weapon.BulletScene.instantiate() as Bullet
		var waittime = i * float(weapon.Distance + bullet.Length) / bullet.Speed
		parent.get_tree().create_timer(waittime).timeout.connect(func(): on_delay(parent, gposition, dir, damage, bullet))

func on_delay(parent:Node, gposition: Vector2, dir: Vector2, damage: Damage, bullet: Bullet) -> void:
	bullet.p_init_data(gposition, dir, damage)
	parent.add_child(bullet)
