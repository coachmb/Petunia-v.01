extends Node
#Names the class
class_name CharMachine
#Lets class print to console
const DEBUG = true
#Creates an object variable calle "state"
var state:Object
#builds an array variable called history
var history = []
# Called when the node enters the scene tree for the first time.
func _ready():
	#Set the initial state and enter it
	state = get_child(0)
	_enter_state()

func _enter_state():
	if DEBUG:
		print("Entering state: ", state.name)
		
		state.fsm = self
		state.enter()
#The above function prints to the console what state is being entered
#Sets a reference to this control state in the new state using fsm
#It then runs the enter function in the new state

func _change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()
	
#The above code passes a newly picked state, adds it to the history array
#and runs the _enter_state function after geting the code from it.
	
func back():
	if history.size()>0:
		state = get_node(history.pop_back())
		_enter_state()
		
#This says if there is a state to go back to, state is now the code 
#from the previous node. And the _enter_state func from it is run
		
#All of these can be called by the state currently loaded by dropping 
#the underscores

func _process(delta):
	if state.has_method("process"):
		state.process(delta)

#The above will route any loops to the matching Handler func
#same with the below but for inputs
func _input(event):
	if state.has_method("input"):
		state.input(event)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
