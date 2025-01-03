extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 25
var can_move = true

func _on_timeline_started():
    can_move = false

func _on_timeline_ended():
    can_move = true

func move():
    if not can_move:
        return

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

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)

func _physics_process(delta: float) -> void:
    move()
    animate()
    flip()
