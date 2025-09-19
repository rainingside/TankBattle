class_name Player
extends CharacterBody2D

@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	hitbox.hit.connect(on_hit)

func on_hit(damage: Damage) -> void:
	pass
