extends Area2D

var can_interact:
    get: return GlobalVariables.can_interact

var a_day_in_december_progress:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]

func _physics_process(delta):
    for body in get_overlapping_bodies():
        if body.is_in_group("charlotte") and Input.is_action_just_pressed("interact") and can_interact:
            if a_day_in_december_progress["has_checked_diary"]:
                if a_day_in_december_progress["knows_diary_code"]:
                    Dialogic.start("insert_diary_code")
                else:
                    Dialogic.start("should_find_post_it")
            else:
                a_day_in_december_progress["has_checked_diary"] = true
                Dialogic.start("forgot_diary_code")