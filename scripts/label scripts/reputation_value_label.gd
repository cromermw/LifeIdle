class_name LabelReputationValue
extends Label

func _ready() -> void:
	update_text()
	HandlerReputation.ref.reputation_created.connect(update_text)
	HandlerReputation.ref.reputation_consumed.connect(update_text)
	
func update_text(_quantity : float = -1) -> void:
	text = str(Game.ref.data.reputation)
