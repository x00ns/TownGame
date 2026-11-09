extends CharacterState
class_name MovingState

func physics_update(_delta: float) -> void:
	if actor.jumping:
		update_state.emit("Jumping")
		return
	
	if actor.boxing:
		update_state.emit("Boxing")
		return
	
	if (actor.inp_dir.length() <= 0.05):
		actor.velocity.x = 0.0
		actor.velocity.z = 0.0
		update_state.emit("Idle")
		return
