class_name Game
extends Node

## singleton reference
static var ref : Game

## singleton check
func _singleton_check() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()
	
## contains data for saving and loading
var data : Data

## singleton check and data initialization
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
