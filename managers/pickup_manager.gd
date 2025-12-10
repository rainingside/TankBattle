extends Node
class_name PickupManager

var _upgrade_scene:PackedScene = preload(GConstants.ScenePaths.UpgradePickup)

var _birth_places:Array[Vector2] = [
	Vector2(100,100),
	Vector2(400,100),
	Vector2(800,100),
	Vector2(100,400),
	Vector2(400,400),
	Vector2(800,400),
]

func p_new_pickup(gposition: Vector2, attr_upgrade:ITankAttributeUpgrade) -> void:
	var upgrade:Upgrade = _upgrade_scene.instantiate()
	upgrade.p_init(gposition, attr_upgrade)
	add_child(upgrade)
	
func p_new_pickup_random() -> void:
	var gposition:Vector2 = _birth_places[randi_range(0, _birth_places.size() - 1)]
	var upgrade:ITankAttributeUpgrade = GupgradeHelper.p_get_random_upgrade()
	p_new_pickup(gposition, upgrade)
	
