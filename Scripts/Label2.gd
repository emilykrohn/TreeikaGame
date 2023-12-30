extends Label

var score := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score < 9999999999:
		text = str(score)
	else:
		text = str(9999999999)
