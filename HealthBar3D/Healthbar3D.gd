tool
extends Sprite3D
class_name healthbar3D, "res://HealthBar3D/class_icon.png"


export(float, 0, 1) var value = 1 setget value_set
export(Color) var full_color = Color.white setget full_set
export(Color) var empty_color = Color.white setget empty_set

func value_set(val):
	value = val
	scale.x = value
	modulate = empty_color.linear_interpolate(full_color, value)

func full_set(val):
	full_color = val
	modulate = empty_color.linear_interpolate(full_color, value)

func empty_set(val):
	empty_color = val
	modulate = empty_color.linear_interpolate(full_color, value)
