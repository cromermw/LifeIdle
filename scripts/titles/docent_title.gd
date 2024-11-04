class_name DocentTitle
extends Title

var base_education_requirement : float = 10
var base_reputation_cost : float = 10
var base_reputation_requirement : float = 2*base_reputation_cost

func cost() -> float:
	return base_reputation_cost * Game.ref.data.cost_multiplier

func reputation_requirement() -> float:
	return base_reputation_requirement * Game.ref.data.cost_multiplier
	
func education_requirement() -> float:
	return base_education_requirement * Game.ref.data.cost_multiplier

func meets_requirements() -> void:
	if HandlerResources.ref.reputation() <  reputation_requirement() or HandlerResources.ref.education() < education_requirement():
		visible = false
	else:
		visible = true

func _process(delta: float) -> void:
	meets_requirements()
