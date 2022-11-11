extends Node2D

export(float) var damping : float = 0.3
export(float) var speed : float = 9.0
export(float) var MAX_DISTANCE : float = 300.0

onready var spring_point = $SpringPoint

func _process(_delta):
	spring_point.damping = damping
	spring_point.speed = speed
	spring_point.MAX_DISTANCE = MAX_DISTANCE

func update_damping(new_value : float):
	damping = new_value

func update_speed(new_value : float):
	speed = new_value

func update_MAX_DISTANCE(new_value : float):
	MAX_DISTANCE = new_value
