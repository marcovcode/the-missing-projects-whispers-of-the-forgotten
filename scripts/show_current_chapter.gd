extends Node2D

var story_progress:
    get: return GlobalVariables.game_state["story_progress"]
var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]

func _on_timeline_started():
    Dialogic.Inputs.set_block_signals(true)

func _on_timeline_ended():
    Dialogic.Inputs.set_block_signals(false)

    Transition.transition()
    await Transition.transition_finished
    get_tree().change_scene_to_file("res://scenes/bedroom.tscn")

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)

    Dialogic.start(current_chapter)

    story_progress[current_chapter]["has_shown_chapter_name"] = true