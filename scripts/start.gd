extends Button

var story_progress:
    get: return GlobalVariables.game_state["story_progress"]
var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]

func _ready():
    pressed.connect(_on_button_pressed)

func _on_button_pressed():
    var target_scene = "res://scenes/show_current_chapter.tscn"

    if story_progress[current_chapter]["has_shown_chapter_name"]:
        target_scene = "res://scenes/bedroom.tscn"

    Transition.transition()
    await Transition.transition_finished
    get_tree().change_scene_to_file(target_scene)
