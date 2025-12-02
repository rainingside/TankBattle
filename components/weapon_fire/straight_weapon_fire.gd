class_name StraightWeaponFire
extends IWeaponFire

func p_fire(parent:Node, gposition: Vector2, dir: Vector2, bullet_speed:int, bullet_pierce:int, damage: Damage, weapon:IWeapon) -> void:
	if not (weapon is StraightWeapon):
		return
	for i in range(weapon.Nums):
		var bullet = weapon.BulletScene.instantiate() as Bullet
		var new_gposition = gposition - i * dir.normalized() * (weapon.Distance + bullet.Length)
		bullet.p_init_data(new_gposition, dir, bullet_speed, bullet_pierce, damage)
		var waittime:float = i * float(weapon.Distance + bullet.Length) / bullet.Speed
		bullet.visible = false
		bullet.monitoring = false
		bullet.monitorable = false
		parent.add_child(bullet)
		parent.get_tree().create_timer(waittime).timeout.connect(func(): on_delay(bullet))

func on_delay(bullet: Bullet) -> void:
	if !bullet:
		return
	bullet.visible = true
	bullet.monitoring = true
	bullet.monitorable = true
