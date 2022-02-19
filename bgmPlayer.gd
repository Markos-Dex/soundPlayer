extends AudioStreamPlayer

onready var animation = $AnimationPlayer

func fadeIn():
	animation.play('fadeIn')
func fadeOut():
	animation.play('fadeOut')
