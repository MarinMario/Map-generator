extends Node2D

var velocity = Vector2(0,0)
var speed = 250
var step: int

var step_timer = 0

func _process(delta):
	velocity = Vector2(0,0)
	
	step_timer += delta
	if step_timer > 0.001 and get_parent().can_generate:
		randomize()
		step = rand_range(0,5)
		generate()
		step_timer = 0
	
	self.position += velocity * speed #* delta

func generate():
	if step == 0:
		velocity.x += 1
	elif step == 1:
		velocity.x -= 1
	elif step == 2:
		velocity.y += 1
	elif step == 4:
		velocity.y -= 1
