extends Node2D

var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]

func _on_timeline_started():
    Dialogic.Inputs.set_block_signals(true)

func _on_timeline_ended():
    Dialogic.Inputs.set_block_signals(false)

func _ready():
    Dialogic.timeline_started.connect(_on_timeline_started)
    Dialogic.timeline_ended.connect(_on_timeline_ended)

    if current_chapter == "a_day_in_december":
        Dialogic.start("the_amnesiac_dream")