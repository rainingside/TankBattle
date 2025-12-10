extends Area2D
class_name WeaponPickup

@export var Weapon:IWeapon
@export var BulletFiredText:String

@onready var m_bullet_fire_text: Label = $Label

func _ready() -> void:
	m_bullet_fire_text.text = BulletFiredText
	body_entered.connect(on_body_entered)
	
func on_body_entered(body: Node2D) -> void:
	if not (body is Player) or Weapon == null:
		return
	body.p_pickup_weapon(Weapon)
	queue_free()
