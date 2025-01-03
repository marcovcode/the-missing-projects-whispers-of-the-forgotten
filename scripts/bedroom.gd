extends Node2D

func _ready():
    if GlobalVariables.game_state["story_progress"]["current_chapter"] == "a_day_in_december":
        if not GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"]:
            Dialogic.start("woke_up")
            GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_shown_woke_up"] = true