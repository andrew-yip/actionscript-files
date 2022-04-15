package {

	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;

	public class MazeMain extends MovieClip {

		public var mazeCells: Array;
		public var runner: Runner;
		public var player: Player;

		public var timer: Timer;

		public var startIndex: int;
		public var endIndex: int;

		public var startBlock: StartBlock;
		public var finishBlock: FinishBlock;

		// store path of cpu
		private var path: Array;

		public function MazeMain() {

			// TASK 1: INSTANTIATE THE MAZE OF CELLS AND ADD 10 X 10 CELLS
			mazeCells = new Array(100);
			path = new Array();
			var i: int = 0;
			for (var row: int = 0; row < Game.ROWS; row++) {
				for (var col: int = 0; col < Game.COLS; col++) {
					var cell: Cell = new Cell(row, col);
					mazeCells[i++] = cell;
				}
			}

			// TASK 2: PERFORM BACKTRACKING TO CARVE OUT A PERFECT MAZE
			backtracker();

			// TASK 3: DRAW THE MAZE
			drawMazeCells();

			// TASK 4: ADD THE PLAYER & RUNNER
			clearVisited();

			// play game (controls to play)
			startGame();
		}

		public function startGame(): void {
			startIndex = Math.floor(Math.random() * mazeCells.length);
			endIndex = Math.floor(Math.random() * mazeCells.length);

			trace("start index: ");
			trace(startIndex);

			trace("end index: ");
			trace(endIndex);

			startBlock = new StartBlock(startIndex, mazeCells[startIndex].row, mazeCells[startIndex].col);
			addChild(startBlock);

			finishBlock = new FinishBlock(endIndex, mazeCells[endIndex].row, mazeCells[endIndex].col);
			addChild(finishBlock);

			player = new Player(startIndex, mazeCells[startIndex].row, mazeCells[startIndex].col);
			runner = new Runner(endIndex, mazeCells[endIndex].row, mazeCells[endIndex].col);

			addChild(runner);
			addChild(player);

			trace("runner x and y");
			trace(runner.x);
			trace(runner.y);
			trace();

			trace("player x and y");
			trace(player.x);
			trace(player.y);
			trace();

			stage.addEventListener(KeyboardEvent.KEY_UP, playGame);
			runnerMove();
		}

		public function runnerMove(): void {
			//TASK 1: CREATE BACKTRACKER VARIABLES AND INITIALIZE
			path = new Array();
			var i: int = startBlock.index; //Start position will be the first cell in the maze
			mazeCells[i].visited = true; //Mark this first cell as visited
			path.push(i); //Push the cell onto the stack;

			//TASK 2: BACKTRACKING

			while (i != finishBlock.index) {
				//CONSTRAINTS:  COLLECT ALL POSSIBLE WALLS THAT CAN BE REMOVED
				var possibleDirections: Array = new Array();

				// NORTH
				if (!mazeCells[i].north && i >= Game.COLS) {
					if (!mazeCells[i - Game.COLS].south) {
						if (!mazeCells[i - Game.COLS].visited) {
							trace("in north");
							possibleDirections.push(Game.NORTH);
						}
					}
				}

				// SOUTH
				if (!mazeCells[i].south && i < Game.COLS * Game.ROWS - Game.COLS) {
					if (!mazeCells[i + Game.COLS].north) {
						if (!mazeCells[i + Game.COLS].visited) {
							trace("in south");
							possibleDirections.push(Game.SOUTH);
						}
					}
				}

				// EAST
				if (!mazeCells[i].east && i % Game.COLS != Game.COLS - 1) {
					if (!mazeCells[i + 1].west) {
						if (!mazeCells[i + 1].visited) {
							trace("in east");
							possibleDirections.push(Game.EAST);
						}
					}
				}

				// WEST
				if (!mazeCells[i].west && i % Game.COLS != 0) {
					if (!mazeCells[i - 1].east) {
						if (!mazeCells[i - 1].visited) {
							trace("in west");
							possibleDirections.push(Game.WEST);
						}
					}
				}

				//PART B: IF possibleWalls CONTAINS WALLS TO REMOVE,

				// GENERATE A RANDOM WALL FROM THE POSSIBLE WALLS, ELIMINATE THE WALL, AND MARK THE NEW CELL AS VISITED

				if (possibleDirections.length > 0) {
					var randomDirection = possibleDirections[Math.floor(Math.random() * possibleDirections.length)];
					//OPEN THE WALL FOR THE CELL AS WELL AS THE WALL OF THE OTHER CELL
					switch (randomDirection) {
						case Game.NORTH:
							i -= Game.COLS;
							break;
						case Game.SOUTH:
							i += Game.COLS;
							break;
						case Game.EAST:
							i++;
							break;
						case Game.WEST:
							i--;
							break;
					}

					mazeCells[i].visited = true;
					trace("i: " + i);
					path.push(i); //PUSH THE NEXT CELL ONTO THE STACK;

				} else {

					//PART C: IF NO WALLS CAN BE REMOVED,

					// BEGIN BACKTRACKING; POP THE STACK
					//trace("enter else");
					var top: int = path.pop();
					if (top == i) {
						i = path.pop();
						path.push(i);
					}
				}
			}


			// TO REPOSITION THE RUNNER
			var temp: int = path.length;

			timer = new Timer(250, temp);
			timer.addEventListener(TimerEvent.TIMER, onTick);
			timer.start();
		}

		public function onTick(event: TimerEvent) {
			var nextMove: int = path.pop();
			//trace("next move: " + nextMove);
			runner.index = nextMove; // to move the runner to another index
			runnerReposition();
			if (runner.index == startBlock.index) {
				trace("YOU LOSE");
			}
		}

		public function playGame(event: KeyboardEvent): void {

			switch (event.keyCode) {
				case Game.UPARROW:
					if (!mazeCells[player.index].north && player.index >= Game.COLS) {
						if (!mazeCells[player.index - Game.COLS].south) {
							player.index -= Game.COLS;
						}
					}
					break;
				case Game.DOWNARROW:
					if (!mazeCells[player.index].south && player.index < Game.COLS * Game.ROWS - Game.COLS) {
						if (!mazeCells[player.index + Game.COLS].north) {
							player.index += Game.COLS;
						}
					}
					break;
				case Game.LEFTARROW:
					if (!mazeCells[player.index].west && player.index % Game.COLS != 0) {
						if (!mazeCells[player.index - 1].east) {
							player.index--;
						}
					}
					break;
				case Game.RIGHTARROW:
					if (!mazeCells[player.index].east && player.index % Game.COLS != Game.COLS - 1) {
						if (!mazeCells[player.index + 1].west) {
							player.index++;
						}
					}
					break;
			}

			playerReposition();
		}

		public function drawMazeCells(): void {
			for (var i: int = 0; i < Game.N_CELLS; i++) {
				var shape: Shape = new Shape();

				shape.graphics.lineStyle(2, 0xFF0000);
				shape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos);

				// DRAW NORTH WALL
				if (mazeCells[i].north) {
					shape.graphics.lineTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos);
				}

				// DRAW EAST WALL
				if (mazeCells[i].east) {
					shape.graphics.lineTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos + Game.SIZE);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos + Game.SIZE);
				}

				// DRAW SOUTH WALL
				if (mazeCells[i].south) {
					shape.graphics.lineTo(mazeCells[i].xPos, mazeCells[i].yPos + Game.SIZE);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos + Game.SIZE);
				}

				// DRAW WEST WALL
				if (mazeCells[i].west) {
					shape.graphics.lineTo(mazeCells[i].xPos, mazeCells[i].yPos);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos);
				}

				addChild(shape);
			}
		}

		public function clearVisited(): void {
			for (var i: int = 0; i < mazeCells.length; i++) {
				mazeCells[i].visited = false;
			}
		}

		public function runnerReposition(): void {
			runner.x = mazeCells[runner.index].col * Game.SIZE + Game.OFFSET;
			runner.y = mazeCells[runner.index].row * Game.SIZE + Game.OFFSET;
		}

		public function playerReposition(): void {
			player.x = mazeCells[player.index].col * Game.SIZE + Game.OFFSET;
			player.y = mazeCells[player.index].row * Game.SIZE + Game.OFFSET;
		}

		public function backtracker(): void {
			//TASK 1: CREATE BACKTRACKER VARIABLES AND INITIALIZE
			var stack: Array = new Array();
			var i: int = 0; //Start position will be the first cell in the maze
			mazeCells[i].visited = true; //Mark this first cell as visited
			stack.push(i); //Push the cell onto the stack;
			var visitedCells: int = 1; //The number of cells visited so far is one.

			//TASK 2: BACKTRACKING

			//PART A: FOR EACH CELL, BUILD A STRING CONTAINING A LIST OF WALLS (N, S, E, W) THAT CAN BE ELIMINATED

			while (visitedCells < Game.N_CELLS) {
				//CONSTRAINTS:  COLLECT ALL POSSIBLE WALLS THAT CAN BE REMOVED
				var possibleWalls: Array = new Array();
				//NOT A CELL ON THE WESTERN-EDGE OF THE MAZE
				if (mazeCells[i].west && i % Game.COLS != 0) {
					if (!mazeCells[i - 1].visited) {
						possibleWalls.push(Game.WEST);
					}
				}

				//NOT A CELL ON THE EASTERN-EDGE OF THE MAZE
				if (mazeCells[i].east && i % Game.COLS != Game.COLS - 1) {
					if (!mazeCells[i + 1].visited) {
						possibleWalls.push(Game.EAST);
					}
				}

				//NOT A CELL ON THE SOUTHERN-EDGE OF THE MAZE

				if (mazeCells[i].south && i < Game.COLS * Game.ROWS - Game.COLS) {
					if (!mazeCells[i + Game.COLS].visited) {
						possibleWalls.push(Game.SOUTH);
					}
				}

				//NOT A CELL ON THE NORTHERN-EDGE OF THE MAZE

				if (mazeCells[i].north && i >= Game.COLS) {
					if (!mazeCells[i - Game.COLS].visited) {
						possibleWalls.push(Game.NORTH);
					}
				}

				//PART B: IF possibleWalls CONTAINS WALLS TO REMOVE,

				// GENERATE A RANDOM WALL FROM THE POSSIBLE WALLS, ELIMINATE THE WALL, AND MARK THE NEW CELL AS VISITED

				if (possibleWalls.length > 0) {
					var randomWall = possibleWalls[Math.floor(Math.random() * possibleWalls.length)];
					//OPEN THE WALL FOR THE CELL AS WELL AS THE WALL OF THE OTHER CELL
					switch (randomWall) {
						case Game.NORTH:
							mazeCells[i].north = false;
							mazeCells[i - Game.COLS].south = false;
							i -= Game.COLS;
							break;
						case Game.SOUTH:
							mazeCells[i].south = false;
							mazeCells[i + Game.COLS].north = false;
							i += Game.COLS;
							break;
						case Game.EAST:
							mazeCells[i].east = false;
							mazeCells[i + 1].west = false;
							i++;
							break;
						case Game.WEST:
							mazeCells[i].west = false;
							mazeCells[i - 1].east = false;
							i--;
							break;
					}

					mazeCells[i].visited = true;
					stack.push(i); //PUSH THE NEXT CELL ONTO THE STACK;
					visitedCells++; //COUNT THIS NEXT CELL AS VISITED
				} else {

					//PART C: IF NO WALLS CAN BE REMOVED,

					// BEGIN BACKTRACKING; POP THE STACK
					var top: int = stack.pop();
					if (top == i) {
						i = stack.pop(); //POP THE STACK - REVERSE
						stack.push(i);
					}
				}
			}
		}

	}

}