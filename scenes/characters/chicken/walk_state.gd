extends NodeState

@export var character :CharacterBody2D
@export var animated_sprite_2d :AnimatedSprite2D
@export var idle_state_time_interval :float = 5.0

@onready var idle_state_time :Timer = Timer.new()

func _on_process(_delta :float) -> void:
	pass

func _on_physics_process(_delta :float) -> void:
	pass
	
func _on_next_transitions() -> void:
	pass
	
func _on_enter() -> void:
	pass
	
func _on_exit() -> void:
	pass
