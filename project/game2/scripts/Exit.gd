extends Sprite

	

func _on_Area2D_body_entered(body):
	if body.is_in_group('princesse'):
		print("exit")		
		GlobalGame2.chargeNiveau()
	
