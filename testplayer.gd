extends CharacterBody2D
const gravityDirection = Vector2(0, 1)
const gravityConstant = 600; 
const jumpStrength = 600;
const baseSpeed = 1200;
const frictionConstant = 0.85;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = Vector2(0,0);
	if Input.is_action_pressed("Up"):
		direction.y = -1;
	if Input.is_action_pressed("Down"):
		direction.y = 1;
	if Input.is_action_pressed("Left"):
		direction.x = -1;
	if Input.is_action_pressed("Right"):
		direction.x = 1;
	
	velocity.x *= frictionConstant;
	velocity += direction * baseSpeed * delta;
	velocity += gravityDirection * gravityConstant * delta;
	
	if Input.is_action_pressed("Jump") && is_on_floor():
		velocity += (-gravityDirection) * jumpStrength;
	
	direction = Vector2(0,0);
	move_and_slide();
