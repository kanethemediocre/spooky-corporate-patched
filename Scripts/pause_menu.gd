extends Node2D
class_name PauseMenu

@export var pause_layer: CanvasLayer
@export var is_paused: bool
var unpause_callback : Callable

# By default hide the pause menu.
func _ready() -> void:
	is_paused = false
	pause_layer.hide()

# Call this to bring up the pause screen. `on_unpause` is a function ran when the game is unpaused.
func show_pause(on_unpause: Callable) -> void:
	unpause_callback = on_unpause
	if on_unpause == null:
		push_warning("Calling show_pause with no unpause callback!")
	pause_layer.show()
	is_paused = true
# When unpausing call the bound callback to resume game state.
func _on_continue_button_pressed() -> void:
	pause_layer.hide()
	is_paused = false
	if unpause_callback != null:
		unpause_callback.call()

# Go to the main menu if requested.
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
