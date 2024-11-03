class_name LabelReputationValue
extends Label

##func _ready() -> void:
##	update_text()
##	HandlerResources.ref.attribute_created.connect(update_text)
##	HandlerResources.ref.attribute_consumed.connect(update_text)

func _process(_delta: float) -> void:
	update_text()	
	
func update_text() -> void:
	text = str(Game.ref.data.reputation)
