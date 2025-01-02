extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 40

func move():
    var direction := Input.get_axis("move_left", "move_right")

    if direction:
        velocity.x = direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()

func animate():
    if velocity.x != 0:
        animated_sprite.play("walk")
    else:
        animated_sprite.play("idle")

func flip():
    if velocity.x < 0:
        animated_sprite.flip_h = true
    elif velocity.x > 0:
        animated_sprite.flip_h = false

func _physics_process(delta: float) -> void:
    move()
    animate()
    flip()
