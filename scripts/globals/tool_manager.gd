extends Node

var selected_tool :DataTypes.tools = DataTypes.tools.None 

signal tool_selected(tool :DataTypes.tools)

func select_tool(tool : DataTypes.tools) -> void:
	tool_selected.emit(tool)
	selected_tool = tool
