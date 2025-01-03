extends Area2D

func _physics_process(delta):
    for body in get_overlapping_bodies():
        if body.is_in_group("charlotte") and Input.is_action_just_pressed("interact") and GlobalVariables.can_interact:
            if GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_checked_diary"] and not GlobalVariables.game_state["story_progress"]["a_day_in_december"]["knows_diary_code"]:
                Dialogic.start("found_diary_code")
                GlobalVariables.game_state["story_progress"]["a_day_in_december"]["knows_diary_code"] = true
            else:
                Dialogic.start("just_clothes_in_wardrobe")