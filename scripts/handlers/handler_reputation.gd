class_name HandlerReputation
extends Node
##Manages reputation

## singleton reference
static var ref : HandlerReputation

## singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()

signal reputation_created (amount : float)
signal reputation_consumed (amount : float)

func reputation() -> float:
	return Game.ref.data.reputation

func create_reputation(amount : float) -> void:
	Game.ref.data.reputation += amount
	reputation_created.emit(amount)
	
func consume_reputation(amount : float) -> Error:
	if amount > Game.ref.data.reputation:
		return Error.FAILED
	else:
		Game.ref.data.reputation -= amount
		reputation_consumed.emit(amount)
		return Error.OK
