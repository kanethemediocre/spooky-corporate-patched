extends CanvasLayer

# Exposed inspector variables.
@export var credits_container : Container
@export var main_container: Container

# Go to and from the credits.
func _on_credits_button_pressed() -> void:
	if main_container != null:
		main_container.hide()
	if credits_container != null:
		credits_container.show()
func _on_back_button_pressed() -> void:
	if credits_container != null:
		credits_container.hide()
	if main_container != null:
		main_container.show()
		
# Load into the main scene for the gameplay.
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
# Quit the application.
func _on_quit_button_pressed() -> void:
	get_tree().quit()
