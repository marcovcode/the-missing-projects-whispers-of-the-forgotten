extends Node2D

var story_progress:
    get: return GlobalVariables.game_state["story_progress"]
var a_day_in_december_progress:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]

func _ready():
    if story_progress["current_chapter"] == "a_day_in_december":
        if not a_day_in_december_progress["has_shown_woke_up"]:
            a_day_in_december_progress["has_shown_woke_up"] = true
            Dialogic.start("woke_up")