extends CharacterBody2D

@onready var animated_sprite = $Sprite2D
var can_move = true

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	
	if !is_on_floor():
		velocity += get_gravity() * delta
		
	if can_move:
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
		var direction := Input.get_axis("left","right")
		if direction:
			velocity.x = direction * SPEED
			animated_sprite.flip_h = (direction < 0)
		else:
			velocity.x = move_toward(velocity.x,0,SPEED)
		
		
	move_and_slide()
	
func die():
	
	can_move = false
	velocity.x = move_toward(velocity.x,5,SPEED)
	
