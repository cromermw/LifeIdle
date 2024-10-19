class_name UserInterface
extends Control

@export var reputationlabel : Label
@export var reputationvaluelabel : Label
@export var karmalabel : Label
@export var karmavaluelabel : Label
@export var fitnesslabel : Label
@export var fitnessvaluelabel : Label
@export var wealthlabel : Label
@export var wealthvaluelabel : Label
@export var educationlabel : Label
@export var educationvaluelabel : Label
@export var wisdomlabel : Label
@export var wisdomvaluelabel : Label

@export var livebutton : Button
@export var socializebutton : Button
@export var praybutton : Button

@export var activitytimer : Timer

var reputation : float = 0
var karma : float = 0
var fitness : float = 0
var wealth : float = 0
var education : float = 0
var wisdom : float = 0

func _ready() -> void:
	update_attribute_value_label_text()	
	
func begin_activity(button) -> void:
	activitytimer.wait_time = 1
	activitytimer.start()
	if button == livebutton:
		live()
	elif button == socializebutton:
		socialize()
	elif button == praybutton:
		pray()

func socialize() -> void:
	reputation+=0.2
	update_attribute_value_label_text()	
	
func pray() -> void:
	karma+=0.2
	update_attribute_value_label_text()
	
func live() -> void:
	var reward : int
	
	reward = randi_range(0, 5)
	if reward == 0:
		reputation+=0.1
	elif reward == 1:
		karma+=0.1
	elif reward == 2:
		fitness+=0.1
	elif reward == 3:
		wealth+=0.1
	elif reward == 4:
		education+=0.1
	elif reward == 5:
		wisdom+=0.1
	update_attribute_value_label_text()	
	
func update_attribute_value_label_text() -> void:
	reputationvaluelabel.text = str(reputation)
	karmavaluelabel.text = str(karma)
	fitnessvaluelabel.text = str(fitness)
	wealthvaluelabel.text = str(wealth)
	educationvaluelabel.text = str(education)
	wisdomvaluelabel.text = str(wisdom)
	
func get_activity_button() -> Button:
	var button_array : Array = [livebutton, socializebutton, praybutton]
	var resultbutton : Button 
	for button in button_array:
		if button.disabled == true:
			resultbutton = button
	return resultbutton
	
func _on_activity_timer_timeout() -> void:
	var activity : Button
	activity = get_activity_button()
	if activity == livebutton:
		live()
	elif activity == socializebutton:
		socialize()
	elif activity == praybutton:
		pray()

func _on_live_button_pressed() -> void:
	var button_array : Array = [livebutton, socializebutton, praybutton]
	for button in button_array:
		button.disabled = false
	livebutton.disabled = true
	begin_activity(livebutton)

func _on_socialize_button_pressed() -> void:
	var button_array : Array = [livebutton, socializebutton, praybutton]
	for button in button_array:
		button.disabled = false
	socializebutton.disabled = true
	begin_activity(socializebutton)

func _on_pray_button_pressed() -> void:
	var button_array : Array = [livebutton, socializebutton, praybutton]
	for button in button_array:
		button.disabled = false
	praybutton.disabled = true
	begin_activity(praybutton)
