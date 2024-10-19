## The view where the player will buy their upgrades.
class_name AttributeUpgradesView
extends Control

@export var titlelabel : Label
@export var mainviewlink : LinkButton
@export var view : UserInterface.Views
@export var user_interface : UserInterface

## navigation
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)
	visible = false

func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
