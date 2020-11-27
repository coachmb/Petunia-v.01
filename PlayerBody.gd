extends Node2D

var walkSpeed = 1.5
var runSpeed = 4

var currentSpeed

func setCurrentSpeed():
	if Input.is_key_pressed(KEY_SHIFT):
		currentSpeed = runSpeed
	else:
		currentSpeed = walkSpeed 

func _input(Input):
	
	setCurrentSpeed()
	
	if Input.is_action_pressed("ui_left"):
		translate(-currentSpeed*Vector2(1, 0))
		print("pressed left")
	if Input.is_action_pressed("ui_right"):
		translate(currentSpeed*Vector2(1, 0))
		print("pressed right")
	if Input.is_action_pressed("ui_up"):
		translate(-currentSpeed*Vector2(0, 1))
		print("pressed up")
	if Input.is_action_pressed("ui_down"):
		translate(currentSpeed*Vector2(0, 1))
		print("pressed down")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass	
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	_input(Input)
