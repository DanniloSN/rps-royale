extends Node

var velocity = 1

func _ready():
	for i in range(Globals.instances):
		randomize()
		var newPlayer = Globals.PLAYER_NODE.instantiate()
		newPlayer.team = randi_range(0, Globals.TEAM_TYPE.size() - 1)
		newPlayer.global_position = Vector2(
			randf_range(0, 360),
			randf_range(0, 768)
		)
		newPlayer.connect("ENEMY_FOUND", transform_player)
		add_child(newPlayer)

func _process(delta):
	var active_teams = []
	for player in get_children():
		if (not active_teams.has(player.team)): active_teams.append(player.team)
		var enemyGroup = Globals.TEAMS_DATA[player.team]["weak"]
		var nearbyEnemy: Area2D = player.enemy
		for enemy in get_children():
			if (not enemy.is_in_group(str(enemyGroup))): continue
			if (!nearbyEnemy
				|| nearbyEnemy.global_position.distance_to(player.global_position)
				> enemy.global_position.distance_to(player.global_position)):
					nearbyEnemy = enemy
		if (!nearbyEnemy): continue
		player.look_at(nearbyEnemy.global_position)
		player.global_translate(
			player.global_position.direction_to(nearbyEnemy.global_position)
				* velocity
		)
	if (active_teams.size() == 2): velocity += 0.07
	elif (active_teams.size() == 1): set_process(false)

func transform_player(killer: Area2D, victim: Area2D):
	if (victim.has_method("set_team")): victim.set_team(killer.team)

func _input(event):
	if event.is_pressed(): get_tree().reload_current_scene()
