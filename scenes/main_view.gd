class_name MainView
extends Control

@export var user_interface : UserInterface
@export var view : UserInterface.Views

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
@export var worshipbutton : Button
@export var exercisebutton : Button
@export var workbutton : Button
@export var studybutton : Button
@export var meditatebutton : Button
@export var attributeupgradeslink : LinkButton

@export var activitytimer : Timer

var number_of_rewards : int = 1
var reward_multiplier : float = 1

var reputation : float = 0
var karma : float = 0
var fitness : float = 0
var wealth : float = 0
var education : float = 0
var wisdom : float = 0

func _ready() -> void:
	update_attribute_value_label_text()	
	user_interface.navigation_requested.connect(_on_navigation_request)
	visible = true
	
func begin_activity() -> void:
	activitytimer.wait_time = 1
	if activitytimer.is_stopped() == true:
		activitytimer.start()

func reward_random(number_of_rewards, reward_multiplier) -> void:
	var reward : int
	for iteration in number_of_rewards:	
		reward = randi_range(0, 5)
		if reward == 0:
			reputation+=0.1*reward_multiplier
		elif reward == 1:
			karma+=0.1*reward_multiplier
		elif reward == 2:
			fitness+=0.1*reward_multiplier
		elif reward == 3:
			wealth+=0.1*reward_multiplier
		elif reward == 4:
			education+=0.1*reward_multiplier
		elif reward == 5:
			wisdom+=0.1*reward_multiplier

func live() -> void:
	number_of_rewards = 2
	reward_random(number_of_rewards, reward_multiplier)

func socialize() -> void:
	reputation+=0.3*reward_multiplier
	
func worship() -> void:
	karma+=0.3*reward_multiplier
	
func exercise() -> void:
	fitness+=0.3*reward_multiplier
	
func work() -> void:
	wealth+=0.3*reward_multiplier
	
func study() -> void:
	education+=0.3*reward_multiplier
	
func meditate() -> void:
	wisdom+=0.3*reward_multiplier

func update_attribute_value_label_text() -> void:
	reputationvaluelabel.text = str(reputation)
	karmavaluelabel.text = str(karma)
	fitnessvaluelabel.text = str(fitness)
	wealthvaluelabel.text = str(wealth)
	educationvaluelabel.text = str(education)
	wisdomvaluelabel.text = str(wisdom)
	
func get_activity_button() -> Button:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	var resultbutton : Button 
	for button in buttonarray:
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
	update_attribute_value_label_text()	

func _on_live_button_pressed() -> void:
	var buttonarray : Array = [livebutton, socializebutton, worshipbutton, exercisebutton, workbutton, studybutton, meditatebutton]
	for button in buttonarray:
		button.disabled = false
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
