class_name Player
extends CharacterBody2D

@export var MoveLeftAction:String
@export var MoveRightAction:String
@export var MoveUpAction:String
@export var MoveDownAction:String
@export var FireAction:String

@export var PlayerAttribute:TankAttribute
var Direction:Vector2 = Vector2(1, 0)
var PlayerDamage:Damage

@onready var m_body: Sprite2D = $Body
@onready var m_collide_shape: CollisionShape2D = $CollisionShape2D
@onready var m_hurtbox: Hurtbox = $Hurtbox
@onready var m_barrel: Sprite2D = $Barrel
@onready var m_fire_component: FireComponent = $FireComponent
@onready var m_health_display: CenterContainer = $HealthDisplay

func p_init_data(gpositon: Vector2, dir: Vector2, attr:TankAttribute) -> void:
	global_position = gpositon
	Direction = dir
	PlayerAttribute = attr

func _ready() -> void:
	PlayerAttribute.hp_changed.connect(on_hp_changed)
	PlayerAttribute.speed_changed.connect(on_speed_changed)
	PlayerAttribute.fire_internal_changed.connect(on_fire_internal_changed)
	PlayerAttribute.bullet_attack_changed.connect(on_bullet_attack_changed)
	PlayerAttribute.bullet_speed_changed.connect(on_bullet_speed_changed)
	PlayerAttribute.bullet_pierce_changed.connect(on_bullet_pierce_changed)
	
	PlayerDamage = Damage.new()
	PlayerDamage.p_init(Enums.DamageFroms.Player, PlayerAttribute.BulletAttack)
	m_fire_component.p_init(PlayerAttribute.FireInternal, GweaponHelper.p_get_random_weapon(), PlayerAttribute.BulletSpeed, PlayerAttribute.BulletPierce)
	m_hurtbox.hurt.connect(on_hurtbox_hurt)
	change_direction(Direction);

func _physics_process(delta: float) -> void:
	move(delta)
	look_at_mouse()
	fire()

func move(delta: float) -> void:
	change_direction(Input.get_vector(MoveLeftAction, MoveRightAction, MoveUpAction, MoveDownAction).normalized())
	move_and_collide(Direction * PlayerAttribute.Speed * delta)

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
		PlayerDamage.Attack = PlayerAttribute.BulletAttack
		m_fire_component.p_fire()

func on_hurtbox_hurt(damage: Damage) -> void:
	if damage.DamageFrom == Enums.DamageFroms.Player:
		return
	PlayerAttribute.HP -= damage.Attack
	if PlayerAttribute.HP <= 0:
		queue_free()

func p_pickup_weapon(weapon: IWeapon) -> void:
	m_fire_component.p_pickup_weapon(weapon)


func p_get_tank_attribute() -> TankAttribute:
	return PlayerAttribute
func on_hp_changed() -> void:
	m_health_display.p_set_hp(PlayerAttribute.HP)
func on_speed_changed() -> void:
	pass
func on_fire_internal_changed() -> void:
	m_fire_component.FireInternal = PlayerAttribute.FireInternal
func on_bullet_attack_changed() -> void:
	PlayerDamage.Attack = PlayerAttribute.BulletAttack
func on_bullet_speed_changed() -> void:
	m_fire_component.BulletSpeed = PlayerAttribute.BulletSpeed
func on_bullet_pierce_changed() -> void:
	m_fire_component.BulletPierce = PlayerAttribute.BulletPierce
