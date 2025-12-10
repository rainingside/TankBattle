class_name TankAttribute
extends Resource

signal hp_changed
signal speed_changed
signal fire_internal_changed
signal bullet_attack_changed
signal bullet_speed_changed
signal bullet_pierce_changed

@export var HP:int = 100:
	set(value):
		var new_value = clampi(value, 0, 100)
		if HP == new_value:
			return
		HP = new_value
		hp_changed.emit()
		
@export var Speed:int = 200:
	set(value):
		var new_value = clampi(value, 0, 400)
		if Speed == new_value:
			return
		Speed = new_value
		speed_changed.emit()

@export var FireInternal:float = 0.5:
	set(value):
		var new_value = clampf(value, 0.2, 1)
		if FireInternal == new_value:
			return
		FireInternal = new_value
		fire_internal_changed.emit()
		
@export var BulletAttack:int = 10:
	set(value):
		var new_value = clampi(value, 0, 50)
		if BulletAttack == new_value:
			return
		BulletAttack = new_value
		bullet_attack_changed.emit()
		
@export var BulletSpeed:int = 400:
	set(value):
		var new_value = clampi(value, 400, 800)
		if BulletSpeed == new_value:
			return
		BulletSpeed = new_value
		bullet_speed_changed.emit()
		
@export var BulletPierce:int = 0:
	set(value):
		var new_value = clampi(value, 0, 10)
		if BulletPierce == new_value:
			return
		BulletPierce = new_value
		bullet_pierce_changed.emit()


func p_init(hp:int, speed:int, fire_internal:float, bullet_attack:int, bullet_speed:int, bullet_pierce:int) -> void:
	HP = hp
	Speed = speed
	FireInternal = fire_internal
	BulletAttack = bullet_attack
	BulletSpeed = bullet_speed
	BulletPierce = bullet_pierce
