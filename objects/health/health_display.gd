extends CenterContainer

@onready var m_healthBar: TextureProgressBar = $HealthBar
@onready var m_healthLable: Label = $HealthLable

@export var HP:int = 100

func _ready() -> void:
	p_set_hp(HP)

func p_set_hp(hp: int):
	HP = hp
	m_healthBar.value = HP
	m_healthLable.text = str(HP)
