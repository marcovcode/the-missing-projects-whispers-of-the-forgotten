extends Area2D

var a_day_in_december_progress = GlobalVariables.game_state["story_progress"]["a_day_in_december"]

func _physics_process(delta):
    for body in get_overlapping_bodies():
        if body.is_in_group("charlotte") and Input.is_action_just_pressed("interact") and GlobalVariables.can_interact:
            if a_day_in_december_progress["has_checked_diary"] and not a_day_in_december_progress["knows_diary_code"]:
                a_day_in_december_progress["knows_diary_code"] = true
                Dialogic.start("found_diary_code")
            else:
                Dialogic.start("just_clothes_in_wardrobe")