extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
var charlotte:
    get: return GlobalVariables.game_state["charlotte"]
var can_interact:
    get: return GlobalVariables.can_interact
var is_transitioning:
    get: return GlobalVariables.is_transitioning

const SPEED = 30
var can_move = true

func load_position():
    position.x = charlotte["x"]
    position.y = charlotte["y"]

func connect_timeline_signals():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_started():
    can_move = false

func _on_timeline_ended():
    can_move = true

func save_position():
    charlotte["x"] = position.x
    charlotte["y"] = position.y

func move():
    if not can_move or is_transitioning:
        return

    var direction := Input.get_axis("move_left", "move_right")

    if direction:
        velocity.x = direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()
    save_position()

func animate():
    if not can_interact or is_transitioning:
        animated_sprite.play("idle")
        return

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
    load_position()
    connect_timeline_signals()

func _physics_process(delta: float) -> void:
    move()
    animate()
    flip()
