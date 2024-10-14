extends Node2D
class_name PauseMenu

signal paused
signal unpaused

@export var pause_layer: CanvasLayer
var is_paused: bool

# Call this to initiate a pause.
func pause() -> void:
	if not is_paused:
		pause_layer.show()
		is_paused = true
		paused.emit()
# Call this to unpause.
func unpause() -> void:
	if is_paused:
		pause_layer.hide()
		is_paused = false
		unpaused.emit()

# By default hide the pause menu.
func _ready() -> void:
	is_paused = false
	pause_layer.hide()
	# When the viewport loses focus, automatically pause.
	get_viewport().focus_exited.connect(pause)
	
# Go to the main menu if requested.
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
