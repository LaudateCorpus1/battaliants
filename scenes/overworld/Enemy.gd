extends Node2D

const Ant = preload("res://Ant.gd")

const Worker = preload("res://ants/Worker.gd")
const Larvae = preload("res://ants/Larvae.gd")
const Buff = preload("res://ants/Buff.gd")
const Queen = preload("res://ants/Queen.gd")
const Cant = preload("res://ants/Cant.gd")
const Neophyte = preload("res://ants/Neophyte.gd")

onready var ant = Ant.new()

func at(x, y):
	position.x = x
	position.y = y
	return self

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_ant_object():
	var result = null
	match ant.get_caste():
		ant.Caste.WORKER: result = Worker.new()
		ant.Caste.LARVAE: result = Larvae.new()
		ant.Caste.CANT: result = Cant.new()
		ant.Caste.BUFF: result = Buff.new()
		ant.Caste.QUEEN: result = Queen.new()
		ant.Caste.NEOPHYTE: result = Neophyte.new()
	result.species = ant.get_species()
	return result

# Called when the node enters the scene tree for the first time.
func _ready():
	ant.species = randi() % 5
	ant.caste = randi() % 5
	$KinematicBody2D/AnimatedSprite.animation = ant.get_animation_name()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
