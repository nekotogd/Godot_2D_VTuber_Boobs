extends Node2D

export(NodePath) onready var base_position = get_node(base_position) as Sprite

# Set by parent
var damping : float = 0.1
var speed : float = 4.0
var MAX_DISTANCE : float = 700.0

var global_time : float
var start_position : Vector2
var spring_offset := Vector2.ZERO

func _physics_process(delta : float):
	if Input.is_action_pressed("LMB"):
		var mouse_pos : Vector2 = get_global_mouse_position()
		global_position = mouse_pos
		start_position = mouse_pos
		global_time = 0.0
		
		var dist : float = global_position.distance_to(base_position.global_position)
		if dist > MAX_DISTANCE:
			global_position = base_position.global_position.direction_to(global_position) * MAX_DISTANCE + base_position.global_position
			start_position = global_position
		
		spring_offset = spring_offset.linear_interpolate(global_position - base_position.global_position, 0.4)
		return
	
	# Offset = cos(t) * start_offset * exp(-damping * t)
	var t : float = global_time * speed
	var d := Vector2.ZERO
	var start_offset : Vector2 = start_position - base_position.global_position
	d.x = cos(t) * start_offset.x * exp(-damping * t)
	d.y = cos(t) * start_offset.y * exp(-damping * t)
	global_position = base_position.global_position + d
	
	global_time += delta
	
	spring_offset = global_position - base_position.global_position
