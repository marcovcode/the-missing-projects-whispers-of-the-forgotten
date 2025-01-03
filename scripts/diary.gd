extends Area2D

func _physics_process(delta):
    for body in get_overlapping_bodies():
        if body.is_in_group("charlotte") and Input.is_action_just_pressed("interact") and GlobalVariables.can_interact:
            SaveSystem.save_game()
            Dialogic.start("forgot_diary_code")
