class_name GameOverUI
extends CanvasLayer

@onready var time_label: Label = %TimeLabel
@onready var monsters_label: Label = %MonstersLabel
@onready var game_over_sound: AudioStreamPlayer2D = %GameOverSound

@export var restart_delay: float = 5.0

var restart_cooldown: float


func _ready():
	time_label.text = GameManager.time_elapsed_string
	monsters_label.text = str(GameManager.monsters_defeated_counter)
	restart_cooldown = restart_delay
	play_sound()
	

func _process(delta):
	restart_cooldown -= delta
	if restart_cooldown <= 0.0:
		restart_game()
		
		
func play_sound():
	game_over_sound.play()
		
		
func restart_game():
	GameManager.reset()
	get_tree().reload_current_scene()
