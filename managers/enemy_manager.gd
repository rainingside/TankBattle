extends Node
class_name EnemyManager

signal enemy_killed

var _enemy_secene:PackedScene = preload(GConstants.ScenePaths.Enenmy)
var _enemy_attr:TankAttribute = preload("res://datas/enemy.tres")
var EnemyCount:int = 0

func p_new_enemy(birth_place:BirthPlace) -> void:
	var iweapon:IWeapon = GweaponHelper.p_get_random_weapon()
	var enemy:Enemy = _enemy_secene.instantiate() as Enemy
	enemy.p_init(birth_place.global_position, Vector2(0, 1), _enemy_attr.duplicate(), iweapon)
	EnemyCount += 1
	add_child(enemy)
	enemy.tree_exited.connect(on_enemy_killed, ConnectFlags.CONNECT_DEFERRED)

func on_enemy_killed() -> void:
	EnemyCount -= 1
	enemy_killed.emit()
	
func p_get_enemys_count() -> int:
	return EnemyCount
