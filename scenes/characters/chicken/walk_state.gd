extends NodeState

@export var character :CharacterBody2D
@export var animated_sprite_2d :AnimatedSprite2D

func _ready() -> void:
	call_deferred("character_setup")

func character_setup() -> void:
	await get_tree().physics_frame
	set_movement_target()

func set_movement_target() -> void:
	pass

func _on_process(_delta :float) -> void:
	pass

func _on_physics_process(_delta :float) -> void:
	pass
	
func _on_next_transitions() -> void:
	pass
	
func _on_enter() -> void:
	animated_sprite_2d.play("walk")
	
func _on_exit() -> void:
	animated_sprite_2d.stop()
