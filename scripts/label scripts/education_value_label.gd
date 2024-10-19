class_name LabelEducationValue
extends Label

func _process(_delta: float) -> void:
	update_text()	
	
func update_text() -> void:
	text = str(Game.ref.data.education)
