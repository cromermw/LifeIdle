class_name MainView
extends Control

## buttons for each activity and navigation
@export var livebutton : Button
@export var socializebutton : Button
@export var worshipbutton : Button
@export var exercisebutton : Button
@export var workbutton : Button
@export var studybutton : Button
@export var meditatebutton : Button

## when this timer ends, the player gains some attributes depending on their activity
@export var activitytimer : Timer

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
		HandlerResources.ref.create_attribute(reward, 0.1)

## generic activity that gives random increases
func live() -> void:
	reward_random(2, 1)

func perform_activity(activity) -> void:
	HandlerResources.ref.create_attribute(activity, 0.3)

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
		perform_activity(0)
	elif activity == worshipbutton:
		perform_activity(1)
	elif activity == exercisebutton:
		perform_activity(2)
	elif activity == workbutton:
		perform_activity(3)
	elif activity == studybutton:
		perform_activity(4)
	elif activity == meditatebutton:
		perform_activity(5)

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
