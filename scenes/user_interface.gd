class_name UserInterface
extends Control

enum Views {
	MAIN_VIEW,
	ATTRIBUTE_UPGRADES_VIEW,
}

signal navigation_requested(view : Views)

func _on_attribute_upgrades_link_pressed() -> void:
	navigation_requested.emit(Views.ATTRIBUTE_UPGRADES_VIEW)


func _on_main_view_link_pressed() -> void:
	navigation_requested.emit(Views.MAIN_VIEW)
