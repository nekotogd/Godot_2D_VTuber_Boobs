extends Spatial

onready var spring_point = $SpringSim/SpringPoint
onready var breasts = $Body/Breasts

func _physics_process(_delta):
	var o : Vector2 = spring_point.spring_offset
	var mat : ShaderMaterial = breasts.material_override
	mat.set_shader_param("spring_offset", o)
