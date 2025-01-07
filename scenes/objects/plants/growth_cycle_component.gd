class_name GrowthCycleComponent
extends Node

@export var current_growth_state :DataTypes.growthStates = DataTypes.growthStates.Germination
@export_range(5, 365) var days_until_harvest :int = 7

signal crop_maturity
signal crop_harvesting

var is_watered :bool
var starting_day :int
var current_day :int

func _ready() -> void:
	DayAndNightCycleManager.time_tick_day.connect(on_time_tick_day)

func on_time_tick_day(day :int) -> void:
	if is_watered:
		if starting_day == 0:
			starting_day = day	
			
		growth_states(starting_day, day)
		harvest_states(starting_day, day)

func growth_states(starting_day :int, current_day :int) -> void:
	if current_growth_state == DataTypes.growthStates.Maturity:
		return
		
	var num_states = 5
	var growth_days_passed = (current_day - starting_day) % num_states
	var state_index = growth_days_passed % num_states + 1
	
	current_growth_state = state_index
	
	var name = DataTypes.growthStates.keys()[current_growth_state]
	print("Current growth state: " , name, ". State index: ", state_index)
	
	if current_growth_state == DataTypes.growthStates.Maturity:
		crop_maturity.emit()

func harvest_states(starting_day :int, current_day :int) -> void:
	if current_growth_state == DataTypes.growthStates.Harvesting:
		return
		
	var days_passed = (current_day - starting_day) % days_until_harvest
	
	if days_passed == days_until_harvest -1 :
		current_growth_state = DataTypes.growthStates.Harvesting
		crop_harvesting.emit()

func get_current_growth_state() -> DataTypes.growthStates:
	return current_growth_state
