extends Button

var story_progress:
    get: return GlobalVariables.game_state["story_progress"]
var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]

func _ready():
    pressed.connect(_on_button_pressed)

func _on_button_pressed():
    if story_progress[current_chapter]["has_shown_chapter_name"]:
        get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
    else:
        get_tree().change_scene_to_file("res://scenes/show_current_chapter.tscn")
