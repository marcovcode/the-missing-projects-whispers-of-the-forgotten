extends Area2D

func _physics_process(delta):
    for body in get_overlapping_bodies():
        if body.is_in_group("charlotte") and Input.is_action_just_pressed("interact") and GlobalVariables.can_interact:
            if GlobalVariables.game_state["story_progress"]["a_day_in_december"]["knows_diary_code"]:
                Dialogic.start("insert_diary_code")
            else:
                GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_checked_diary"] = true
                Dialogic.start("forgot_diary_code")
