class_name Enemy
extends CharacterBody2D

@export var EnemyHealth:Health
var SpeedRestore:int = 300
@export var Speed:int = 300
var Direction:Vector2 = Vector2(1, 0)
@export var EnemyDamage:Damage

@onready var m_body: Sprite2D = $Body
@onready var m_barrel: Sprite2D = $Barrel
@onready var m_collide_shape: CollisionShape2D = $CollisionShape2D
@onready var m_hurtbox: Hurtbox = $Hurtbox
@onready var m_health_display: CenterContainer = $HealthDisplay
@onready var m_fire_component: FireComponent = $FireComponent
@onready var m_ai_timer: Timer = $AITimer

func p_init_data(gposition: Vector2, dir: Vector2, speed: int, health: Health, damage: Damage) -> void:
	global_position = gposition
	Direction = dir.normalized()
	SpeedRestore = speed
	Speed = speed
	EnemyHealth = health
	EnemyDamage = damage
	EnemyDamage.DamageFrom = Enums.DamageFroms.Enemy

func _ready() -> void:
	EnemyHealth = EnemyHealth.duplicate()
	EnemyDamage = EnemyDamage.duplicate()
	m_hurtbox.hit.connect(on_hurtbox_hit)
	m_ai_timer.timeout.connect(on_ai_timer_timeout)
	p_change_direction(Direction);
	p_look_at_dir(Direction);
	
func _physics_process(delta: float) -> void:
	move(delta)

func move(delta: float) -> void:
	move_and_collide(Direction * Speed * delta)

func p_stop_move() -> void:
	Speed = 0

func p_restore_move() -> void:
	Speed = SpeedRestore

func p_change_direction(dir: Vector2) -> void:
	Direction = dir.normalized()
	var target_dir = position + dir;
	m_body.look_at(target_dir)
	m_collide_shape.look_at(target_dir)
	m_hurtbox.look_at(target_dir)

func p_look_at_dir(dir: Vector2) -> void:
	m_barrel.look_at(position + dir.normalized())

func on_hurtbox_hit(damage: Damage) -> void:
	if damage.DamageFrom == Enums.DamageFroms.Enemy:
		return
	EnemyHealth.p_in_or_decrease_hp(damage.Attack)
	m_health_display.p_set_hp(EnemyHealth.HP)
	if EnemyHealth.HP == 0:
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
		var x = randf_range(0, 1)
		var y = randf_range(0, 1)
		p_change_direction(Vector2(x, y))
	
	randomize()
	isOperate = randi_range(0, 1)
	if isOperate:
		var x = randf_range(0, 1)
		var y = randf_range(0, 1)
		p_look_at_dir(Vector2(x, y))
	
	isOperate = randi_range(0, 1)
	if isOperate:
		m_fire_component.p_fire()
	
	
	
