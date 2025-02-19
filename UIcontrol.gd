extends Control

@onready var score_label = $ScoreLabel
@onready var timer_label = $TimerLabel

func _ready():
	update_score(0)
	ScoreManager.set_ui(self)
	TimerManager.set_ui(self)

func update_score(new_score):
	new_score = min(new_score, 5)

	var filled_circle = "●"
	var empty_circle = "○"

	var score_text = ""
	for i in range(5):
		if i < new_score:
			score_text += filled_circle
		else:
			score_text += empty_circle
	score_label.text = score_text
	
func update_timer(time_left):
	timer_label.text = time_left
