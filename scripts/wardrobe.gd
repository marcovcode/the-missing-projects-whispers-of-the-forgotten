extends Area2D

var can_interact:
    get: return GlobalVariables.can_interact
var has_checked_diary:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_checked_diary"]
var has_found_wardrobe_piece:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_found_wardrobe_piece"]
    set(value): GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_found_wardrobe_piece"] = value

func _physics_process(delta):
    for body in get_overlapping_bodies():
        if body.is_in_group("charlotte") and Input.is_action_just_pressed("interact") and can_interact:
            if has_checked_diary:
                if has_found_wardrobe_piece:
                    Dialogic.start("just_clothes_in_wardrobe")
                else:
                    has_found_wardrobe_piece = true
                    Dialogic.start("found_wardrobe_piece")
            else:
                Dialogic.start("just_clothes_in_wardrobe")
