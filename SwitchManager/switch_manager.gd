## Class for managing booleans (switches).
## Helps manage encounters, spawns, special dialogue, etc.

## For example, a one-off dialogue option could toggle a switch,
## so that it is not able to be triggered again.
extends Node
class_name SwitchManagerClass

## Save path to save/load switches
@export_dir var SAVE_PATH := "res://switches.SAVE"

## List of a Name and Type (AKA. Switches).
@export var switches : Array[Switch] = []

## Saves switches to the file specified in SAVE_PATH
func save_switches() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	file.store_var(switches)
	file.close()

## Loads switches from the file specified in SAVE_PATH
func load_switches() -> void:
	if (FileAccess.file_exists(SAVE_PATH)):
		var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
		
		switches = file.get_var()
		file.close()
	else: print("Unable to find switches file to load")

## Deletes all switches from the file specified in SAVE_PATH
func erase_switches() -> void:
	if (FileAccess.file_exists(SAVE_PATH)):
		var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
		
		switches = []
		file.store_var(switches)
		file.close()
	else: print("Unable to find switches file to erase")

## Adds a switch to the switches list
func create_switch(switch_name : String, switch_state := false) -> void:
	for switch : Switch in switches:
		if (switch.name == switch_name):
			print("Switch name already exists, assigning state instead.")
			set_switch_state(switch_name, switch_state)
			return
	
	switches.append({"name": switch_name, "state": switch_state})

## Toggles a switch's state
func toggle_switch(switch_name : String) -> void:
	for switch : Switch in switches:
		if switch.name == switch_name:
			switch.state = !switch.state
			return
	
	printerr("Unable to toggle switch")

## Sets a switch's state to the one specified
func set_switch_state(switch_name : String, switch_state := false) -> void:
	for switch : Switch in switches:
		if switch.name == switch_name:
			switch.state = switch_state
			return
	
	printerr("Unable to set switch state")

## Returns the current state of the switch.
## If no switch is found, will return null by default.
func get_switch(switch_name : String) -> Variant:
	for switch : Switch in switches:
		if switch.name == switch_name:
			return switch.state
	
	printerr("Unable to find switch and return its state")
	return null

## Deletes a switch by name
func delete_switch(switch_name : String) -> void:
	if (switches.find(switch_name) == -1):
		printerr("Unable to find switch to remove")
		return
	
	switches.remove_at(switches.find(switch_name))

## Returns all switches inside the `switches` list
func get_switches() -> Array: return switches
