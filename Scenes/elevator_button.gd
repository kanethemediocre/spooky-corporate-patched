extends Area2D

var on = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OnSprite2D.visible = false
	$OnSprite2D.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Gvars.ElevatorOn:
		$OffSprite2D.visible = true
		$OnSprite2D.visible = false
	
