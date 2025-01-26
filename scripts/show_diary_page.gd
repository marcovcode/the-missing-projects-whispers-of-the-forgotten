extends Node2D

var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]
    set(value): GlobalVariables.game_state["story_progress"]["current_chapter"] = value

func _on_timeline_started():
    Dialogic.Inputs.set_block_signals(true)

func _on_timeline_ended():
    Dialogic.Inputs.set_block_signals(false)

func _on_timeline_signal(argument):
    if argument == "switch_to_a_week_later":
        Transition.transition()
        await Transition.transition_finished

        current_chapter = "a_week_later"
        get_tree().change_scene_to_file("res://scenes/show_current_chapter.tscn")

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)
    Dialogic.signal_event.connect(_on_timeline_signal)

    if current_chapter == "a_day_in_december":
        Dialogic.start("the_amnesiac_dream")
