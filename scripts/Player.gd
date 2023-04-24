extends Area2D

signal ENEMY_FOUND

@export var team: Globals.TEAM_TYPE = Globals.TEAM_TYPE.ROCK
var enemy: Area2D

func _ready():
	set_team(team)

func set_team(newTeam: Globals.TEAM_TYPE):
	remove_from_group(str(team))
	var teamData = Globals.TEAMS_DATA[newTeam]
	name = str(get_index()) + "_" + teamData.name
	$Sprite2D.texture = teamData.image
	$Sprite2D.modulate = teamData["color"]
	team = newTeam
	add_to_group(str(team))

func _on_enemy_found(enemyFound):
	if (!enemyFound.is_in_group(str(Globals.TEAMS_DATA[team]["weak"]))): return
	emit_signal("ENEMY_FOUND", self, enemyFound)
