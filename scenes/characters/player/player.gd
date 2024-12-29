class_name Player
extends CharacterBody2D

@export var current_tool: DataTypes.tools = DataTypes.tools.None
@onready var hit_component: HitComponent = $HitComponent

var player_direction: Vector2

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)

func on_tool_selected(tool :DataTypes.tools) -> void: 
	current_tool = tool
	hit_component.current_tool = tool
	print("Tool: ", tool)
