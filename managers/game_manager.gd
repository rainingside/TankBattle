extends Node
class_name GameManager

@export var EnemyMgr:EnemyManager
@export var PickupMgr:PickupManager
@export var BirthPlaces:Array[BirthPlace] = []
@export var EnemyMinCount:int = 2
@export var EnemyMaxCount:int = 5
var _left_generate_enemy_count:int

func _init() -> void:
	_left_generate_enemy_count = EnemyMaxCount;

func _ready() -> void:
	EnemyMgr.enemy_killed.connect(on_enemy_killed)

func _physics_process(delta: float) -> void:
	if _left_generate_enemy_count > 0:
		var bplace_indexs:Array[int] = _get_empty_birth_place_indexs()
		_left_generate_enemy_count -= bplace_indexs.size()
		for i in bplace_indexs:
			EnemyMgr.p_new_enemy(BirthPlaces[i])
		return
	if EnemyMgr.p_get_enemys_count() <= EnemyMinCount:
		_left_generate_enemy_count = EnemyMaxCount -  EnemyMgr.p_get_enemys_count()
		
		
func _get_empty_birth_place_indexs() -> Array[int]:
	var empty_bplaces: Array[int] = []
	var index:int = 0
	for bplace in BirthPlaces:
		if bplace.p_is_empty():
			empty_bplaces.append(index)
		index += 1
	return empty_bplaces

func on_enemy_killed() -> void:
	PickupMgr.p_new_pickup_random()
