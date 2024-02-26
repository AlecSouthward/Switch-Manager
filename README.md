# Switch Manager

This is a simple tool used for helping manage small one-time events. For example, enemy encounters, dialogue that disappears after interaction, etc.

## Usage

> [!WARNING]
> The Switch Manager will not work unless you [autoload](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html) it!<br/>
> As it will only work if it is a `Singleton`.

To use the Switch Manager is quite easy, there are easy to use and expand upon functions inside `state_machine.gd`.

Here is a list of functions and their use...

| Function | Usage | Arguments |
|----------|-------|------------|
| `save_switches()` | Saves the current list of switches to a file specified in **SAVE_PATH**. | None. |
| `load_switches()` | Loads a list of switches from a file specified in **SAVE_PATH**. | None. |
| `erase_switches()` | Erases the current list of switches and clear the file specified in **SAVE_PATH**. | None. |
| `create_switch(..)` | Adds a new switch to the switches list with the specified name and state. | Switch Name, and Switch State (default state is false) |
| `toggle_switch(.)` | Toggles a switch's state. (Flips a `False` state into a `True` one) | Switch Name |
| `set_switch_state(..)` | Sets a switch's state to the one specifed.  | Switch Name, and Switch State (default state is false) |
| `get_switch(.)` | Returns a switch's current state, if the switch is unable to be found it will return `null`. | Switch Name |
| `delete_switch(.)` | Deletes a switch from the switches list. | Switch Name |
| `get_switches()` | Returns an Array containing the switches. | None. |

> [!WARNING]
> If the `create_switch(..)` recieves a switch name that *already* exists, it will instead set the switch's state to the one specified.

# Support

If you have any issues, create an [Issue](https://github.com/AlecSouthward/Switch-Manager/issues/new) or message me on Discord at `itsmealec`.
