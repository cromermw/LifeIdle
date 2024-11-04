class_name Data
extends Resource
## contains data for saving and loading

## current amount of each attribute
@export var reputation : float = 0
@export var karma : float = 0
@export var fitness : float = 0
@export var wealth : float = 0
@export var education : float = 0
@export var wisdom : float = 0

##unlock status of titles
@export var acolyte_unlocked : bool = false
@export var recruit_unlocked : bool = false
@export var vendor_unlocked : bool = false
@export var docent_unlocked : bool = false
@export var postulant_unlocked : bool = false

##title experience
@export var karma_experience : int = 0
@export var fitness_experience : int = 0
@export var wealth_experience : int = 0
@export var education_experience : int = 0
@export var wisdom_experience : int = 0

##multipliers and other upgrades
@export var cost_multiplier : float = 1
