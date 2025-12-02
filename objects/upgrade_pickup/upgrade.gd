extends Area2D

@export var Sprite:Texture2D
@export var TankAttributeUpgrade: ITankAttributeUpgrade


@onready var m_upgrade_label: Label = $Label

func _ready() -> void:
	body_entered.connect(on_body_entered)
	m_upgrade_label.text = TankAttributeUpgrade.UpgradeText
	

func on_body_entered(body: PhysicsBody2D) -> void:
	if !body.has_method("p_get_tank_attribute"):
		return
	var attr = body.p_get_tank_attribute()
	if attr:
		TankAttributeUpgrade._p_apply_upgrade(attr)
	
