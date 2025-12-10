extends Node

func p_get_random_upgrade() -> ITankAttributeUpgrade:
	var upgrade:ITankAttributeUpgrade
	var i:int = randi_range(0, 5)
	match i:
		0: upgrade = HPUpgrade.new()
		1: upgrade = SpeedUpgrage.new()
		2: upgrade = FireInternalUpGrade.new()
		3: upgrade = BulletAttackUpgrade.new()
		4: upgrade = BulletSpeedUpgrade.new()
		5: upgrade = BulletPierceUpgrade.new()
	return upgrade
