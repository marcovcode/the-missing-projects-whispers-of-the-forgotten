extends Button

@onready var hover_sound = $HoverSound
@onready var pressed_sound = $PressedSound

func _ready():
    mouse_entered.connect(_on_button_mouse_entered)
    pressed.connect(_on_button_pressed)

func _on_button_mouse_entered():
    hover_sound.play()

func _on_button_pressed():
    pressed_sound.play()

    Transition.transition()
    await Transition.transition_finished
    get_tree().quit()