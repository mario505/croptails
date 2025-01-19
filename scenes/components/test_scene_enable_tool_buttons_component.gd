extends Node

func _ready() -> void:
	call_deferred("enable_tool_buttons") 

func enable_tool_buttons() -> void:
	ToolManager.enable_tools_button(DataTypes.tools.TillGround)
	ToolManager.enable_tools_button(DataTypes.tools.WaterCrops)
	ToolManager.enable_tools_button(DataTypes.tools.PlantCorn)
	ToolManager.enable_tools_button(DataTypes.tools.PlantTomato)
