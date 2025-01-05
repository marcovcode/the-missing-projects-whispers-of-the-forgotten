extends Area2D

var can_interact:
    get: return GlobalVariables.can_interact

func _physics_process(delta):
    for body in get_overlapping_bodies():
        if body.is_in_group("charlotte") and Input.is_action_just_pressed("interact") and can_interact:
            SaveSystem.save_game()
            Dialogic.start("game_saved")
