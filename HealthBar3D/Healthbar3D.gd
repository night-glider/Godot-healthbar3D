tool
extends Spatial

export(Texture) var texture setget texture_set
export(float, 0, 1) var value = 1 setget value_set
export(int, "Disabled", "Enabled", "Fixed-Y") var billboard_mode = 1 setget billboard_set
export(Color) var full_color = Color.white setget full_set
export(Color) var empty_color = Color.white setget empty_set
export(float, 0, 1) var opacity = 1 setget opacity_set
export(float, 0.0001, 128) var pixel_size = 0.01 setget pixel_set


func texture_set(val):
	texture = val
	$bar.texture = texture

func billboard_set(val):
	billboard_mode = val
	if billboard_mode == 0:
		$bar.billboard = SpatialMaterial.BILLBOARD_DISABLED
	if billboard_mode == 1:
		$bar.billboard = SpatialMaterial.BILLBOARD_ENABLED
	if billboard_mode == 2:
		$bar.billboard = SpatialMaterial.BILLBOARD_FIXED_Y

func value_set(val):
	value = val
	$bar.scale.x = value
	$bar.modulate = empty_color.linear_interpolate(full_color, value)

func full_set(val):
	full_color = val
	$bar.modulate = empty_color.linear_interpolate(full_color, value)

func empty_set(val):
	empty_color = val
	$bar.modulate = empty_color.linear_interpolate(full_color, value)

func opacity_set(val):
	opacity = val
	$bar.opacity = val

func pixel_set(val):
	pixel_size = val
	$bar.pixel_size = pixel_size
