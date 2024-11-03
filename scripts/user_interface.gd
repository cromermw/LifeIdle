class_name UserInterface
extends TabContainer

signal navigation_requested(tab_index : int)

func navigate_to(tab_index : int) -> Error:
	if tab_index < 0: 
		return FAILED
	if tab_index > get_tab_count():
		return FAILED
		
	current_tab = tab_index
	navigation_requested.emit(tab_index)
	
	return OK
