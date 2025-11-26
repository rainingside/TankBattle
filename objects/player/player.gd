class_name Player
extends CharacterBody2D

@export var MoveLeftAction:String
@export var MoveRightAction:String
@export var MoveUpAction:String
@export var MoveDownAction:String
@export var FireAction:String

@export var PlayerHealth:Health
@export var Speed:int = 400
var Direction:Vector2 = Vector2(1, 0)
@export var PlayerDamage:Damage = Damage.new()

@onready var m_body: Sprite2D = $Body
@onready var m_collide_shape: CollisionShape2D = $CollisionShape2D
@onready var m_hurtbox: Hurtbox = $Hurtbox
@onready var m_barrel: Sprite2D = $Barrel
@onready var m_fire_component: FireComponent = $FireComponent
@onready var m_health_display: CenterContainer = $HealthDisplay

func p_init_data(gpositon: Vector2, speed: int, dir: Vector2, health: Health, damage: Damage) -> void:
	global_position = gpositon
	Speed = speed
	Direction = dir
	PlayerHealth = health
	PlayerDamage = damage
	PlayerDamage.DamageFrom = Enums.DamageFroms.Player

func _ready() -> void:
	m_hurtbox.hit.connect(on_hurtbox_hit)
	change_direction(Direction);

func _physics_process(delta: float) -> void:
	move(delta)
	look_at_mouse()
	fire()

func move(delta: float) -> void:
	change_direction(Input.get_vector(MoveLeftAction, MoveRightAction, MoveUpAction, MoveDownAction).normalized())
	move_and_collide(Direction * Speed * delta)

func change_direction(dir: Vector2) -> void:
	Direction = dir
	var target_dir = position + dir;
	m_body.look_at(target_dir)
	m_collide_shape.look_at(target_dir)
	m_hurtbox.look_at(target_dir)

func look_at_mouse() -> void:
	m_barrel.look_at(get_global_mouse_position())

func fire() -> void:
	if Input.is_action_just_pressed("fire"):
		m_fire_component.p_fire()

func on_hurtbox_hit(damage: Damage) -> void:
	if damage.DamageFrom == Enums.DamageFroms.Player:
		return
	PlayerHealth.p_in_or_decrease_hp(damage.Attack)
	m_health_display.p_set_hp(PlayerHealth.HP)
	if PlayerHealth.HP == 0:
		queue_free()

func p_pickup_weapon(weapon: IWeapon) -> void:
	m_fire_component.p_pickup_weapon(weapon)
