extends Node
var messagelength = 240 #4 seconds at 60fps

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Gvars.NeedToOpenSharonDoor:
		Gvars.NeedToOpenSharonDoor = false
		$SharonDoor.position.x=1000000
	if (Gvars.time - Gvars.MessageTime)<messagelength:
		$playerworks.get_node("PlayerThoughts").text = Gvars.CurrentMessage
		$playerworks.get_node("PlayerThoughts").visible = true
		$playerworks.get_node("SpeechBubble").visible = true
	else:
		$playerworks.get_node("PlayerThoughts").visible = false
		$playerworks.get_node("SpeechBubble").visible = false
func _physics_process(delta: float) -> void:
	Gvars.time = Gvars.time + 1
