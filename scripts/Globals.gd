extends Node

var instances: int = 60

enum TEAM_TYPE { ROCK, PAPER, SCISSOR }

var TEAMS_DATA: Dictionary = {
	TEAM_TYPE.ROCK: {
		"name": "ROCK",
		"image": preload("res://sprites/rock.png"),
		"color": Color(1, 0, 0),
		"weak": TEAM_TYPE.SCISSOR
	},
	TEAM_TYPE.PAPER: {
		"id": TEAM_TYPE.PAPER,
		"name": "PAPER",
		"image": preload("res://sprites/paper.png"),
		"color": Color(0, 1, 0),
		"weak": TEAM_TYPE.ROCK
	},
	TEAM_TYPE.SCISSOR: {
		"id": TEAM_TYPE.SCISSOR,
		"name": "SCISSOR",
		"image": preload("res://sprites/scissor.png"),
		"color": Color(0, 0, 1),
		"weak": TEAM_TYPE.PAPER
	}
}

var PLAYER_NODE = preload("res://scenes/Player.tscn")

