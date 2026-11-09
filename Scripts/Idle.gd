extends CharacterState

func physics_update(_delta: float) -> void:
	if actor == null:
		return
	
	if actor.boxing:
		update_state.emit("Boxing")
		return
	
	if actor.jumping:
		update_state.emit("Jumping")
		return
		
	if actor.current_speed > actor.WALKING_SPEED:
		update_state.emit("Running")
	else:
		update_state.emit("Walking")
