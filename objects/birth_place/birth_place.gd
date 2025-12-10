extends Area2D
class_name BirthPlace

var _enter_nums:int = 0;

@onready var m_collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)
	
func on_body_entered(body: CharacterBody2D) -> void:
	_enter_nums += 1

func on_body_exited(body:CharacterBody2D) -> void:
	_enter_nums -= 1;
	if _enter_nums < 0:
		_enter_nums = 0

func p_is_empty() -> bool:
	if _enter_nums == 0:
		return true
	return false
