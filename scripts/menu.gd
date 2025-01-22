extends Node2D

@onready var song = $Song

func _ready():
    song.play()