class_name Health
extends Resource

@export_range(0, 100, 1) var HP:int = 100

func p_in_or_decrease_hp(hp: int) -> void:
	HP -= hp;
	if HP < 0:
		HP = 0
	if HP > 100:
		HP = 100
