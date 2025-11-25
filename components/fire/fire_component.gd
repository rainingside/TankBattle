class_name FireComponent
extends Node

@export var Target:CharacterBody2D
@export var FireMarker:Marker2D
@export var FireInternal:float
@export var BulletFire: IBulletFire

var CanFire: bool = true
var WillFire: bool = false

var m_fire_timer: Timer = Timer.new()

func _ready() -> void:
	m_fire_timer.wait_time = FireInternal
	m_fire_timer.autostart = false
	add_child(m_fire_timer)
	m_fire_timer.timeout.connect(on_fire_timer_timeout)

func _physics_process(delta: float) -> void:
	fire()

func fire() -> void:
	if !CanFire or !WillFire:
		return
	
	m_fire_timer.stop()
	CanFire = false
	WillFire = false
	
	var damage:Damage
	if Target is Player:
		damage = Target.PlayerDamage
	elif Target is Enemy:
		damage = Target.EnemyDamage
	else :
		return
	
	BulletFire.p_fire(self, FireMarker.global_position, FireMarker.global_position - Target.global_position, damage)
	
	m_fire_timer.start()

func p_fire() -> void:
	WillFire = true

func on_fire_timer_timeout() -> void:
	CanFire = true
