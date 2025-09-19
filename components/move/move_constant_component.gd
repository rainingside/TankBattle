class_name MoveConstantComponent
extends Node

@export var Target:Node2D
@export var Speed:int = 400
@export var Direction:Vector2 = Vector2(1, 0)

func _physics_process(delta: float) -> void:
	move_constant(delta)
	
func move_constant(delta: float) -> void:
	if !Target:
		return
	
	Target.position += Direction * Speed * delta
