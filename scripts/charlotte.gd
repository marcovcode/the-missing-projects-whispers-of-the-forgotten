extends CharacterBody2D

var speed = 50
var can_move = true

@onready var animated_sprite = $AnimatedSprite2D
@onready var raycast = $RayCast2D

var charlotte:
    get: return GlobalVariables.game_state["charlotte"]
var can_interact:
    get: return GlobalVariables.can_interact
var is_transitioning:
    get: return GlobalVariables.is_transitioning

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

func get_input():
    if not can_move or is_transitioning:
        return Vector2.ZERO

    var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

    return input_direction

func move(input_direction):
    velocity = input_direction * speed
    move_and_slide()
    
func animate(input_direction):
    if input_direction.x < 0:
        animated_sprite.flip_h = false
        animated_sprite.play("walk_left")
    elif input_direction.x > 0:
        animated_sprite.play("walk_left")
        animated_sprite.flip_h = true
    elif input_direction.y < 0:
        animated_sprite.play("walk_up")
    elif input_direction.y > 0:
        animated_sprite.play("walk_down")
    
    if velocity == Vector2.ZERO:
        if animated_sprite.animation in ["walk_up", "walk_down"]:
            animated_sprite.stop()
            animated_sprite.frame = 1
        else:
            animated_sprite.stop()
            animated_sprite.frame = 0

func rotate_raycast(input_direction):
    if input_direction.x < 0:
        raycast.rotation = deg_to_rad(90)
    elif input_direction.x > 0:
        raycast.rotation = deg_to_rad(270)

    if input_direction.y < 0:
        raycast.rotation = deg_to_rad(180)
    elif input_direction.y > 0:
        raycast.rotation = deg_to_rad(0)

func _ready():
    load_position()
    connect_timeline_signals()

func _physics_process(delta):
    var input_direction = get_input()
    move(input_direction)
    rotate_raycast(input_direction)
    animate(input_direction)
    save_position()
