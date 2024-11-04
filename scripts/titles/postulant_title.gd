class_name PostulantTitle
extends Title

var base_wisdom_requirement : float = 10
var base_reputation_cost : float = 10
var base_reputation_requirement : float = 2*base_reputation_cost

func cost() -> float:
	return base_reputation_cost * Game.ref.data.cost_multiplier

func reputation_requirement() -> float:
	return base_reputation_requirement * Game.ref.data.cost_multiplier
	
func wisdom_requirement() -> float:
	return base_wisdom_requirement * Game.ref.data.cost_multiplier

func meets_requirements() -> void:
	if HandlerResources.ref.reputation() <  reputation_requirement() or HandlerResources.ref.wisdom() < wisdom_requirement():
		visible = false
	else:
		visible = true

func _process(delta: float) -> void:
	meets_requirements()
