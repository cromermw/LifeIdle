class_name AcolyteTitle
extends Control

@export var AcolyteActivateButton : Button

##Keys: 0 = reputation, 1 = karma, 2 = fitness, 3 = wealth, 4 = education, 5 = wisdom
var base_reputation_cost : float = 10
var cost_multiplier : float = 1

var base_reputation_requirement : float = 2*base_reputation_cost
var base_karma_requirement : float = 10

func cost() -> float:
	return base_reputation_cost * cost_multiplier

func reputation_requirement() -> float:
	return base_reputation_requirement * cost_multiplier

func karma_requirement() -> float:
	return base_karma_requirement * cost_multiplier

func meets_requirements() -> void:
	if HandlerResources.ref.reputation() <  reputation_requirement() or HandlerResources.ref.karma() < karma_requirement():
		visible = false
	else:
		visible = true

func _ready() -> void:
	AcolyteActivateButton.disabled = false

func _process(_delta: float) -> void:
	meets_requirements()

func _on_acolyte_activate_button_pressed() -> void:
	AcolyteActivateButton.disabled = true
