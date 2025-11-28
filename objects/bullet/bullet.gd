class_name Bullet
extends Area2D

@export var Length:int = 20
@export var Speed: int = 400
@export var Direction: Vector2 = Vector2(1, 0)
@export var BulletDamage: Damage = Damage.new()

@onready var m_hitbox: Hitbox = $Hitbox
@onready var m_hurtbox: Hurtbox = $Hurtbox
@onready var m_bullet_recycle_timer: Timer = $BulletRecycleTimer

func p_init_data(gposition: Vector2, dir: Vector2, damage: Damage) -> void:
	global_position = gposition
	Direction = dir.normalized()
	BulletDamage = damage

func _ready() -> void:
	body_entered.connect(on_body_entered)
	m_hitbox.HitDamage = BulletDamage
	m_hurtbox.hit.connect(on_hurtbox_hit)
	m_bullet_recycle_timer.timeout.connect(on_bullet_recycle_timer_timeout)
	
	look_at(position + Direction)

func _physics_process(delta: float) -> void:
	move(delta)
	
func move(delta: float) -> void:
	position += Speed * Direction.normalized() * delta

func on_body_entered(body: Node2D) -> void:
	if body is Player and BulletDamage.DamageFrom == Enums.DamageFroms.Enemy:
		queue_free()
		return
	if body is Enemy and BulletDamage.DamageFrom == Enums.DamageFroms.Player:
		queue_free()
		return
	if body is TileMapLayer:
		queue_free()
		return

func on_hurtbox_hit(damage: Damage) -> void:
	if BulletDamage.DamageFrom == damage.DamageFrom:
		return
	queue_free()

func on_bullet_recycle_timer_timeout() -> void:
	queue_free()
