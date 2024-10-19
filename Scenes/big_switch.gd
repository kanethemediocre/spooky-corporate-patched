extends Area2D

var on = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SwitchOn.visible = false
	$SwitchOff.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if on:
		$SwitchOn.visible = true
		$SwitchOff.visible = false
