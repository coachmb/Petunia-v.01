extends Node

var fsm: CharMachine

func enter():
	print("Hello from the HandlerState")
	
	yield(get_tree().create_timer(2.0), "timeout")
	exit()
	
func exit():
	fsm.back()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
