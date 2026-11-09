extends MovingState

func physics_update(_delta: float) -> void:
	super(_delta)
	
	if (actor.inp_dir.length() <= 0.05) or actor.jumping or actor.boxing: return
	# walking
	actor.velocity.x = actor.inp_dir.x * actor.current_speed
	actor.velocity.z = actor.inp_dir.z * actor.current_speed
	# running
	if actor.current_speed > actor.WALKING_SPEED:
		update_state.emit("Running")
