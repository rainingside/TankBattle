extends Area2D
class_name Upgrade

@export var Sprite:Texture2D
@export var TankAttributeUpgrade: ITankAttributeUpgrade

@onready var m_upgrade_label: Label = $Label
@onready var m_disable_timer: Timer = $DisableTimer

func p_init(gpositon:Vector2, attr_upgrade: ITankAttributeUpgrade) -> void:
	global_position = gpositon
	TankAttributeUpgrade = attr_upgrade

func _ready() -> void:
	m_upgrade_label.text = TankAttributeUpgrade.UpgradeText
	body_entered.connect(on_body_entered)
	m_disable_timer.timeout.connect(on_disable_timer_timeout)
	

func on_body_entered(body: PhysicsBody2D) -> void:
	if !body.has_method("p_get_tank_attribute"):
		return
	var attr = body.p_get_tank_attribute()
	if attr:
		TankAttributeUpgrade.p_apply_upgrade(attr)
		queue_free()
	
func on_disable_timer_timeout() -> void:
	queue_free()
