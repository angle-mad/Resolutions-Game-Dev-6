extends CharacterBody2D

@onready var animated_sprite = $Sprite2D
var can_move = true

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	
	if !is_on_floor():
		velocity += get_gravity() * delta
		
	if can_move:
		if Input.is_action_just_pressed("up2") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
		var direction := Input.get_axis("left2","right2")
		if direction:
			velocity.x = direction * SPEED
			animated_sprite.flip_h = (direction < 0)
		else:
			velocity.x = move_toward(velocity.x,0,SPEED)
		
		
	move_and_slide()
	
func die():
	
	can_move = false
	velocity.x = move_toward(velocity.x,5,SPEED)
	
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("rigidbody"):
		body.collision_layer = 1
		body.collision_mask = 1


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("rigidbody"):
		body.collision_layer = 2
		body.collision_mask = 2
