extends CanvasLayer

signal transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

var is_transitioning:
    set(value): GlobalVariables.is_transitioning = value

func _ready():
    color_rect.visible = false
    animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(animation_name):
    if animation_name == "fade_in":
        timer.start()
        await timer.timeout

        transition_finished.emit()
        animation_player.play("fade_out")
    elif animation_name == "fade_out":
        color_rect.visible = false
        is_transitioning = false

func transition():
    is_transitioning = true
    color_rect.visible = true
    animation_player.play("fade_in")
