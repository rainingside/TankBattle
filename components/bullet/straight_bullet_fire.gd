class_name StraightBulletFire
extends IBulletFire

@export_range(1, 5) var Nums: int = 1
@export_range(10, 20) var Distance: int = 10
 
func p_fire(parent:Node, gposition: Vector2, dir: Vector2, damage: Damage) -> void:
	for i in range(Nums):
		var bullet = BulletScene.instantiate() as Bullet
		var waittime = i * float(Distance + bullet.Length) / bullet.Speed
		get_tree().create_timer(waittime).timeout.connect(func(): on_delay(parent, gposition, dir, damage, bullet))

func on_delay(parent:Node, gposition: Vector2, dir: Vector2, damage: Damage, bullet: Bullet) -> void:
	bullet.p_init_data(gposition, dir, damage)
	parent.add_child(bullet)
	
