extends Node

var points = 0;
@onready var label = $"../UI/Panel/Points"

func add_point():
	points += 1;
	label.text = str(points);
