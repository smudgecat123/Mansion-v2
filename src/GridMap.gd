tool
extends GridMap

export var numRows = 25
export var numCols = 25
export var corridorWidth = 2
export var wallWidth = 1
export var braid = true
export var unbiased = false
export var entrances = false
export var redraw = false

func _ready() -> void:
	if redraw: draw_maze()

func _input(event) -> void:
	if event.is_action_pressed("generate_maze"):
		print("Generating Maze...")
		draw_maze()

func draw_maze() -> void:
	clear()
	randomize()
	var MazeGen = load("res://src/MazeGen.gd").new()
	var maze = MazeGen.gen_maze(numRows, numCols, corridorWidth, wallWidth, randi(), braid, unbiased, entrances)
	for rowNum in range(maze.size()):
		for colNum in range(maze[0].size()):
			if maze[rowNum][colNum]:
				set_cell_item(colNum, 0, rowNum, 0)
			else:
				set_cell_item(colNum, -1, rowNum, 1)

