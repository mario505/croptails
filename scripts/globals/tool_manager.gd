extends Node

var selected_tool :DataTypes.tools = DataTypes.tools.None 

signal tool_selected(tool :DataTypes.tools)
signal enable_tool(tool :DataTypes.tools)

func select_tool(tool : DataTypes.tools) -> void:
	tool_selected.emit(tool)
	selected_tool = tool

func enable_tools_button(tool :DataTypes.tools) -> void:
	enable_tool.emit(tool)
