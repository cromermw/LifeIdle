## The view where the player will buy their upgrades.
class_name AttributeUpgradesView
extends Control

@export var titlelabel : Label
@export var AcolyteActivateButton : Button 
@export var RecruitActivateButton : Button
@export var VendorActivateButton : Button
@export var DocentActivateButton : Button
@export var PostulantActivateButton : Button

func _on_recruit_activate_button_pressed() -> void:
	var button_array : Array = [AcolyteActivateButton, RecruitActivateButton, VendorActivateButton, DocentActivateButton, PostulantActivateButton]
	for button in button_array:
		button.disabled = false
	RecruitActivateButton.disabled = true

func _on_acolyte_activate_button_pressed() -> void:
	var button_array : Array = [AcolyteActivateButton, RecruitActivateButton, VendorActivateButton, DocentActivateButton, PostulantActivateButton]
	for button in button_array:
		button.disabled = false
	AcolyteActivateButton.disabled = true

func _on_vendor_activate_button_pressed() -> void:
	var button_array : Array = [AcolyteActivateButton, RecruitActivateButton, VendorActivateButton, DocentActivateButton, PostulantActivateButton]
	for button in button_array:
		button.disabled = false
	VendorActivateButton.disabled = true
	
func _on_docent_activate_button_pressed() -> void:
	var button_array : Array = [AcolyteActivateButton, RecruitActivateButton, VendorActivateButton, DocentActivateButton, PostulantActivateButton]
	for button in button_array:
		button.disabled = false
	DocentActivateButton.disabled = true

func _on_postulant_activate_button_pressed() -> void:
	var button_array : Array = [AcolyteActivateButton, RecruitActivateButton, VendorActivateButton, DocentActivateButton, PostulantActivateButton]
	for button in button_array:
		button.disabled = false
	PostulantActivateButton.disabled = true

func _ready() -> void:
	var button_array : Array = [AcolyteActivateButton, RecruitActivateButton, VendorActivateButton, DocentActivateButton, PostulantActivateButton]
	for button in button_array:
		button.disabled = false
