extends Node2D

var balloon_scene = preload("res://dialogue/game_dialogue_balloon.tscn")
var in_range :bool

@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	interactable_label_component.hide()
	GameDialogueManager.give_crop_seeds.connect(on_give_crops_seeds)
	
func on_interactable_activated() -> void:
	interactable_label_component.show()
	in_range = true
	
func on_interactable_deactivated() -> void:
	interactable_label_component.hide()
	in_range = false

func _unhandled_input(event: InputEvent) -> void:
	if in_range:
		if event.is_action_pressed("show_dialogue"):
			var balloon :BaseGameDialogueBalloon = balloon_scene.instantiate()
			get_tree().current_scene.add_child(balloon)
			balloon.start(load("res://dialogue/conversations/guide.dialogue"), "start")
			
func on_give_crops_seeds() -> void:
	ToolManager.enable_tools_button(DataTypes.tools.TillGround)
	ToolManager.enable_tools_button(DataTypes.tools.WaterCrops)
	ToolManager.enable_tools_button(DataTypes.tools.PlantCorn)
	ToolManager.enable_tools_button(DataTypes.tools.PlantTomato)
