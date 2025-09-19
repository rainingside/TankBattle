class_name BarrelControlByMouseComponent
extends Node

@export var Target:Sprite2D

func _physics_process(delta: float) -> void:
	if !Target:
		return
		
	Target.look_at(Target.get_global_mouse_position())
