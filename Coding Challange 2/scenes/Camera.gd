extends Camera2D

var velocity = Vector2(0,0)
var speed = 1000

func _process(delta):
	if Input.is_action_pressed("zoom_in") and self.zoom > Vector2(1,1):
		self.zoom -= Vector2(0.1,0.1)
	if Input.is_action_pressed("zoom_out") and self.zoom < Vector2(10,10):
		self.zoom += Vector2(0.1,0.1)
	
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -=1
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
	if Input.is_action_pressed("ui_down"):
		velocity.y +=1
	
	velocity = velocity.normalized()
	position += velocity * speed * delta

