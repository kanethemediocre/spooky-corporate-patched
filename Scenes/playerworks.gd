extends CharacterBody2D


#export allows us to set the speed value in the inspector
@export var speed = 400
@export var pause_menu: PauseMenu # Pause menu to use.
var screen_size # Size of the game window.


#func start(pos):
	#position = pos
	#show()
	#$AnimatedSprite2D.play()
	#$CollisionShape2D.disabled = false


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#the above line doesn't seem to do anything.  I need to use the project settings to set the window to something reasonable.
	#position = pos
	show()
	#$AnimatedSprite2D.play()
	$CollisionShape2D.disabled = false #This might not do anything
	#hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func _physics_process(delta: float) -> void:
	if pause_menu.is_paused:
		if Input.is_action_just_pressed("pause"):
			pause_menu.unpause()
	else:
		if Input.is_action_just_pressed("pause"):
			pause_menu.pause()
		
		var velocity = Vector2.ZERO # The player's movement vector.
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1

		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			#$AnimatedSprite2D.play()
			#$AnimatedSprite2D.animation = "walk"
			#$AnimatedSprite2D.flip_h = velocity.x > 0
		#else:
			#$AnimatedSprite2D.animation = "idle"
		
		position += velocity * delta
		move_and_slide()
		#position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body):
	pass
	#hide() # Player disappears after being hit.
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)

# Pausing/unpausing functionality.
func _pause():
	# TODO pause controls/time here
	# Show the pause menu, when the menu is exited call _unpause.
	pause_menu.show_pause(_unpause)
func _unpause():
	# TODO unpause controls/time here
	pass

# Called when an area is entered by the player shape.
func _on_area_entered(area: Area2D) -> void:
	if area is HauntedProp:
		_start_death_sequence()

func _start_death_sequence() -> void:
	# TODO more elaborate death sequence
	# For now just hide the player.
	hide()
	pass
