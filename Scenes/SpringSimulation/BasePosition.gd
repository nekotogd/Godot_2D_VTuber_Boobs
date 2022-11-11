extends Sprite

func _physics_process(_delta):
	var screen_size : Vector2
	screen_size.x = ProjectSettings.get("display/window/size/width")
	screen_size.y = ProjectSettings.get("display/window/size/height")
	
	global_position = screen_size / 2.0
