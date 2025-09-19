class_name MoveByPlayerComponent
extends Node

@export var Target:CharacterBody2D
@export var Speed:int = 400
@export var LeftAction:String
@export var RightAction:String
@export var UpAction:String
@export var DownAction:String

func _physics_process(delta: float) -> void:
	move_by_player(delta)
	
func move_by_player(delta: float) -> void:
	if !Target:
		return
	
	var dir = Input.get_vector(LeftAction, RightAction, UpAction, DownAction).normalized()
	Target.move_and_collide(dir * Speed * delta)
	Target.look_at(Target.position + dir)
