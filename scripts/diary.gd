extends Area2D

@onready var raycast = %Charlotte.get_node("RayCast2D")

var can_interact:
    get: return GlobalVariables.can_interact

var current_chapter:
    get: return GlobalVariables.game_state["story_progress"]["current_chapter"]

var a_day_in_december_progress:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]

var a_week_later_progress:
    get: return GlobalVariables.game_state["story_progress"]["a_week_later"]

func _physics_process(delta):
    if raycast.is_colliding() and raycast.get_collider() == self:
        if Input.is_action_just_pressed("interact") and can_interact:
            if current_chapter == "a_day_in_december":
                if a_day_in_december_progress["has_checked_diary"]:
                    if a_day_in_december_progress["knows_diary_code"]:
                        Dialogic.start("insert_diary_code")
                    else:
                        Dialogic.start("should_find_post_it")
                else:
                    a_day_in_december_progress["has_checked_diary"] = true
                    Dialogic.start("forgot_diary_code")
            elif current_chapter == "a_week_later":
                if a_week_later_progress["has_seen_colors"] and a_week_later_progress["has_listened_to_song"]:
                    Dialogic.start("insert_color_sequence")