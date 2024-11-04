class_name HandlerResources
extends Node
##Manages reputation

## singleton reference
static var ref : HandlerResources

## singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()

func create_attribute(attribute : int, amount : float):
	if attribute == 0:
		Game.ref.data.reputation += amount
		attribute_created.emit(attribute, amount)
	elif attribute == 1:
		Game.ref.data.karma += amount
		attribute_created.emit(attribute, amount)
	elif attribute == 2:
		Game.ref.data.fitness += amount
		attribute_created.emit(attribute, amount)
	elif attribute == 3:
		Game.ref.data.wealth += amount
		attribute_created.emit(attribute, amount)
	elif attribute == 4:
		Game.ref.data.education += amount
		attribute_created.emit(attribute, amount)
	elif attribute == 5:
		Game.ref.data.wisdom += amount
		attribute_created.emit(attribute, amount)

func consume_attribute(attribute : int, amount : float):
	if attribute == 0:
		if amount > Game.ref.data.reputation:
			return Error.FAILED
		else:
			Game.ref.data.reputation -= amount
			attribute_consumed.emit(attribute, amount)
			return Error.OK
	if attribute == 1:
		if amount > Game.ref.data.karma:
			return Error.FAILED
		else:
			Game.ref.data.karma -= amount
			attribute_consumed.emit(attribute, amount)
			return Error.OK
	if attribute == 2:
		if amount > Game.ref.data.fitness:
			return Error.FAILED
		else:
			Game.ref.data.fitness -= amount
			attribute_consumed.emit(attribute, amount)
			return Error.OK
	if attribute == 3:
		if amount > Game.ref.data.wealth:
			return Error.FAILED
		else:
			Game.ref.data.wealth -= amount
			attribute_consumed.emit(attribute, amount)
			return Error.OK
	if attribute == 4:
		if amount > Game.ref.data.education:
			return Error.FAILED
		else:
			Game.ref.data.education -= amount
			attribute_consumed.emit(attribute, amount)
			return Error.OK
	if attribute == 5:
		if amount > Game.ref.data.reputation:
			return Error.FAILED
		else:
			Game.ref.data.wisdom -= amount
			attribute_consumed.emit(attribute, amount)
			return Error.OK

signal attribute_created(attribute : int, amount : float)
signal attribute_consumed(attribute : int, amount : float)

func reputation() -> float:
	return Game.ref.data.reputation

func karma() -> float:
	return Game.ref.data.karma

func fitness() -> float:
	return Game.ref.data.fitness

func wealth() -> float:
	return Game.ref.data.wealth

func education() -> float:
	return Game.ref.data.education

func wisdom() -> float:
	return Game.ref.data.wisdom
