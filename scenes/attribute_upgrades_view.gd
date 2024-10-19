class_name AttributeUpgradesView
extends Control

@export var titlelabel : Label
@export var mainviewlink : LinkButton
@export var view : UserInterface.Views
@export var user_interface : UserInterface

func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)
	visible = false

func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false

func _on_main_view_link_pressed() -> void:
	pass # Replace with function body.
