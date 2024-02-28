## Class for managing booleans (switches).
## Helps manage encounters, spawns, special dialogue, etc.

## For example, a one-off dialogue option could toggle a switch,
## so that it is not able to be triggered again.
extends Object
class_name SwitchManagerClass

## List of a Name and Type (AKA. Switches).
@export var switches : Array[Switch] = []

## Adds a switch to the switches list
func create_switch(switch_name : String, switch_state := false) -> void:
	for switch : Switch in switches:
		if (switch.name == switch_name):
			print("Switch name already exists, assigning state instead.")
			set_switch_state(switch_name, switch_state)
			return
	
	var new_switch : Switch = Switch.new()
	
	new_switch.name = switch_name
	new_switch.state = switch_state
	
	switches.append(new_switch)

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
