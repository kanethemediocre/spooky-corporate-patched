extends StaticBody2D
var closedx = 0
var closedy = 0
var openx = -125
var openy = 128
var unlocked = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$image.animation = "closed"




# macro's to open and close a door	
func close_door():
	$image.animation = "closed"
	$opencollide.disabled = true #This way is smart and makes sense
	$closedcollide.disabled = false #It appears to do nothing
	$opencollide.position.x = 1000000 #This is a dumb hack but it works
	$closedcollide.position.x = closedx



func open_door():
	$image.animation = "open"
	$opencollide.disabled = false
	$closedcollide.disabled = true
	$opencollide.position.x = openx
	$closedcollide.position.x = 1000000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact_area_body_entered(body: Node2D) -> void:
	if body is player and unlocked:
		open_door()


func _on_interact_area_body_exited(body: Node2D) -> void:
	if body is player and unlocked:
		close_door() 
