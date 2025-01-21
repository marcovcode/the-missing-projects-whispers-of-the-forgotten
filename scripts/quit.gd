extends Button

func _ready():
    pressed.connect(_on_button_pressed)

func _on_button_pressed():
    Transition.transition()
    await Transition.transition_finished
    get_tree().quit()