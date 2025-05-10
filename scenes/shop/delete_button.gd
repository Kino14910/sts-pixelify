class_name DeleteButton
extends TextureButton

var affordable = true: 
	set(value):
		affordable = value
		if not affordable:
			modulate = Color(1, 1, 1, 0.5)
		else:
			modulate = Color(1, 1, 1, 1)
