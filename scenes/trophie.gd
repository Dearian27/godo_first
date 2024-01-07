extends Area2D
@onready var sprite = $AnimatedSprite2D


func _on_body_entered(body):
	if body.name == "Player":
		print(body.name);
		#sprite.animation = "pressed";
		sprite.animation = "pressed";
		#queue_free();
