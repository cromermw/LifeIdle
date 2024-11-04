class_name RecruitTitle
extends Control

var base_reputation_cost : float = 10
var cost_multiplier : float = 1

var base_reputation_requirement : float = 2*base_reputation_cost
var base_fitness_requirement : float = 10

func cost() -> float:
	return base_reputation_cost * cost_multiplier

func reputation_requirement() -> float:
	return base_reputation_requirement * cost_multiplier

func fitness_requirement() -> float:
	return base_fitness_requirement * cost_multiplier

func meets_requirements() -> void:
	if HandlerResources.ref.reputation() <  reputation_requirement() or HandlerResources.ref.fitness() < fitness_requirement():
		visible = false
	else:
		visible = true

func _process(_delta: float) -> void:
	meets_requirements()
