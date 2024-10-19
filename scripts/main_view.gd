class_name MainView
extends Control

@export var user_interface : UserInterface
@export var view : UserInterface.Views

## labels for the attributes and their values
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

## buttons for each activity and navigation
@export var livebutton : Button
@export var socializebutton : Button
@export var worshipbutton : Button
@export var exercisebutton : Button
@export var workbutton : Button
@export var studybutton : Button
@export var meditatebutton : Button
@export var attributeupgradeslink : LinkButton

## when this timer ends, the player gains some attributes depending on their activity
@export var activitytimer : Timer

## value multipliers to allow the player to scale
var number_of_rewards : int = 1
var reward_multiplier : float = 1

func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)
	visible = true

## starts the timer if the timer is stopped	
func begin_activity() -> void:
	activitytimer.wait_time = 1
	if activitytimer.is_stopped() == true:
		activitytimer.start()

## rewards random attributes for player activities that don't increase a specific attribute
func reward_random(number_of_rewards, reward_multiplier) -> void:
	var reward : int
	for iteration in number_of_rewards:	
		reward = randi_range(0, 5)
		if reward == 0:
			Game.ref.data.reputation+=0.1*reward_multiplier
			print("Rewarding reputation. Reputation value: ", Game.ref.data.reputation)
		elif reward == 1:
			Game.ref.data.karma+=0.1*reward_multiplier
		elif reward == 2:
			Game.ref.data.fitness+=0.1*reward_multiplier
		elif reward == 3:
			Game.ref.data.wealth+=0.1*reward_multiplier
		elif reward == 4:
			Game.ref.data.education+=0.1*reward_multiplier
		elif reward == 5:
			Game.ref.data.wisdom+=0.1*reward_multiplier

## generic activity that gives random increases
func live() -> void:
	number_of_rewards = 2
	reward_random(number_of_rewards, reward_multiplier)

## activities that raise a specific attribute
func socialize() -> void:
	Game.ref.data.reputation+=0.3*reward_multiplier
	print("Rewarding reputation. Reputation value: ", Game.ref.data.reputation)
	
func worship() -> void:
	Game.ref.data.karma+=0.3*reward_multiplier
	
func exercise() -> void:
	Game.ref.data.fitness+=0.3*reward_multiplier
	
func work() -> void:
	Game.ref.data.wealth+=0.3*reward_multiplier
	
func study() -> void:
	Game.ref.data.education+=0.3*reward_multiplier
	
func meditate() -> void:
	Game.ref.data.wisdom+=0.3*reward_multiplier

## updates attribute value labels
##func update_attribute_value_label_text() -> void:
##	reputationvaluelabel.text = str(Game.ref.data.reputation)
##	karmavaluelabel.text = str(Game.ref.data.karma)
##	fitnessvaluelabel.text = str(Game.ref.data.fitness)
##	wealthvaluelabel.text = str(Game.ref.data.wealth)
##	educationvaluelabel.text = str(Game.ref.data.education)
##	wisdomvaluelabel.text = str(Game.ref.data.wisdom)

## determine which activity the player is performing by checking to see which button is disabled
func get_activity_button() -> Button:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	var resultbutton : Button 
	for button in buttonarray:
		if button.disabled == true:
			resultbutton = button
	return resultbutton
	
## determine which reward to give
func _on_activity_timer_timeout() -> void:
	var activity : Button
	activity = get_activity_button()
	if activity == livebutton:
		live()
	elif activity == socializebutton:
		socialize()
	elif activity == worshipbutton:
		worship()
	elif activity == exercisebutton:
		exercise()
	elif activity == workbutton:
		work()
	elif activity == studybutton:
		study()
	elif activity == meditatebutton:
		meditate()

func _on_live_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	## iterate through each button, enabling them all
	for button in buttonarray:
		button.disabled = false
	## disable the button of the current activity
	livebutton.disabled = true
	begin_activity()

func _on_socialize_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	for button in buttonarray:
		button.disabled = false
	socializebutton.disabled = true
	begin_activity()

func _on_worship_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	for button in buttonarray:
		button.disabled = false
	worshipbutton.disabled = true
	begin_activity()

func _on_exercise_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	for button in buttonarray:
		button.disabled = false
	exercisebutton.disabled = true
	begin_activity()

func _on_work_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	for button in buttonarray:
		button.disabled = false
	workbutton.disabled = true
	begin_activity()

func _on_study_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	for button in buttonarray:
		button.disabled = false
	studybutton.disabled = true
	begin_activity()

func _on_meditate_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	for button in buttonarray:
		button.disabled = false
	meditatebutton.disabled = true
	begin_activity()
	
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false

## update labels each frame
##func _process(_delta: float) -> void:
##	update_attribute_value_label_text()	
