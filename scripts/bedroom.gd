extends Node2D

var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]
var has_shown_woke_up:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"]
    set(value): GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"] = value

func _ready():
    if current_chapter == "a_day_in_december":
        if not has_shown_woke_up:
            has_shown_woke_up = true
            Dialogic.start("woke_up")
