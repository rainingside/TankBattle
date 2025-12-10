class_name Enemy
extends CharacterBody2D

@export var EnemyAttribute:TankAttribute
var SpeedRestore:int
var Direction:Vector2 = Vector2(1, 0)
var EnemyDamage:Damage
@export var Weapon:IWeapon

@onready var m_body: Sprite2D = $Body
@onready var m_barrel: Sprite2D = $Barrel
@onready var m_collide_shape: CollisionShape2D = $CollisionShape2D
@onready var m_hurtbox: Hurtbox = $Hurtbox
@onready var m_health_display: CenterContainer = $HealthDisplay
@onready var m_fire_component: FireComponent = $FireComponent
@onready var m_ai_timer: Timer = $AITimer

func p_init(gposition: Vector2, dir: Vector2, attr: TankAttribute, weapon:IWeapon) -> void:
	global_position = gposition
	Direction = dir.normalized()
	EnemyAttribute = attr
	Weapon = weapon

func _ready() -> void:
	EnemyAttribute.hp_changed.connect(on_hp_changed)
	EnemyAttribute.speed_changed.connect(on_speed_changed)
	EnemyAttribute.fire_internal_changed.connect(on_fire_internal_changed)
	EnemyAttribute.bullet_attack_changed.connect(on_bullet_attack_changed)
	EnemyAttribute.bullet_speed_changed.connect(on_bullet_speed_changed)
	EnemyAttribute.bullet_pierce_changed.connect(on_bullet_pierce_changed)
	
	EnemyDamage = Damage.new()
	EnemyDamage.DamageFrom = Enums.DamageFroms.Enemy
	EnemyDamage.Attack = EnemyAttribute.BulletAttack
	m_fire_component.p_init(EnemyAttribute.FireInternal, Weapon, EnemyAttribute.BulletSpeed, EnemyAttribute.BulletPierce)
	SpeedRestore = EnemyAttribute.Speed
	
	m_hurtbox.hurt.connect(on_hurtbox_hurt)
	m_ai_timer.timeout.connect(on_ai_timer_timeout)
	
	p_change_direction(Direction);
	p_look_at_dir(Direction);
	
func _physics_process(delta: float) -> void:
	move(delta)

func move(delta: float) -> void:
	move_and_collide(Direction * EnemyAttribute.Speed * delta)

func p_stop_move() -> void:
	EnemyAttribute.Speed = 0

func p_restore_move() -> void:
	EnemyAttribute.Speed = SpeedRestore

func p_change_direction(dir: Vector2) -> void:
	Direction = dir.normalized()
	var target_dir = position + dir;
	m_body.look_at(target_dir)
	m_collide_shape.look_at(target_dir)
	m_hurtbox.look_at(target_dir)

func p_look_at_dir(dir: Vector2) -> void:
	m_barrel.look_at(position + dir.normalized())

func on_hp_changed() -> void:
	m_health_display.p_set_hp(EnemyAttribute.HP)
func on_speed_changed() -> void:
	SpeedRestore = EnemyAttribute.Speed
func on_fire_internal_changed() -> void:
	m_fire_component.FireInternal = EnemyAttribute.FireInternal
func on_bullet_attack_changed() -> void:
	EnemyDamage.Attack = EnemyAttribute.BulletAttack
func on_bullet_speed_changed() -> void:
	m_fire_component.BulletSpeed = EnemyAttribute.BulletSpeed
func on_bullet_pierce_changed() -> void:
	pass

func on_hurtbox_hurt(damage: Damage) -> void:
	if damage.DamageFrom == Enums.DamageFroms.Enemy:
		return
	EnemyAttribute.HP -= damage.Attack
	if EnemyAttribute.HP == 0:
		queue_free()

func on_ai_timer_timeout() -> void:
	randomize()
	var isOperate = randi_range(0, 1)
	if isOperate == 0:
		p_stop_move()
	else :
		p_restore_move()
		
	randomize()
	isOperate = randi_range(0, 1)
	if isOperate == 1:
		var x = randf_range(-1, 1)
		var y = randf_range(-1, 1)
		p_change_direction(Vector2(x, y))
	
	randomize()
	isOperate = randi_range(0, 1)
	if isOperate:
		var x = randf_range(-1, 1)
		var y = randf_range(-1, 1)
		p_look_at_dir(Vector2(x, y))
	
	isOperate = randi_range(0, 1)
	if isOperate:
		m_fire_component.p_fire()
