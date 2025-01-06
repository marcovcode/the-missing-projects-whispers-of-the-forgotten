extends Node

var has_found_wardrobe_piece:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_found_wardrobe_piece"]
var has_found_basket_piece:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_found_basket_piece"]
var has_found_bed_piece:
    get: return GlobalVariables.game_state["story_progress"]["a_day_in_december"]["has_found_bed_piece"]
var knows_diary_code:
    set(value): GlobalVariables.game_state["story_progress"]["a_day_in_december"]["knows_diary_code"] = value

func check_pieces():
    if has_found_wardrobe_piece and has_found_basket_piece and has_found_bed_piece:
        knows_diary_code = true
        Dialogic.start("figures_out_diary_code")