package {

	import flash.display.*;
	import flash.events.*;

	public class MazeMain extends MovieClip {

		public var mazeCells: Array;

		public function MazeMain() {

			// TASK 1: INSTANTIATE THE MAZE OF CELLS AND ADD 10 X 10 CELLS
			mazeCells = new Array(100);
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

public function backtracker ():void {

			//TASK 1: CREATE BACKTRACKER VARIABLES AND INITIALIZE

			var stack:Array=new Array();



			var i:int = 0;				//Start position will be the first cell in the maze

			mazeCells[i].visited = true;//Mark this first cell as visited

			stack.push (i);				//Push the cell onto the stack;

			var visitedCells:int = 1;	//The number of cells visited so far is one.



			//TASK 2: BACKTRACKING

			//PART A: FOR EACH CELL, BUILD A STRING CONTAINING A LIST OF WALLS (N, S, E, W) THAT CAN BE ELIMINATED



			while (visitedCells < Game.N_CELLS) {

				//CONSTRAINTS:  COLLECT ALL POSSIBLE WALLS THAT CAN BE REMOVED

				var possibleWalls:Array=new Array();

				



				//NOT A CELL ON THE WESTERN-EDGE OF THE MAZE

				if (mazeCells[i].west && i % Game.COLS != 0) {

					if (! mazeCells[i - 1].visited) {

						possibleWalls.push (Game.WEST);

					}

				}

				//NOT A CELL ON THE EASTERN-EDGE OF THE MAZE

				if (mazeCells[i].east && i % Game.COLS != Game.COLS - 1) {

					if (! mazeCells[i + 1].visited) {

						possibleWalls.push (Game.EAST);

					}

				}

				//NOT A CELL ON THE SOUTHERN-EDGE OF THE MAZE

				if (mazeCells[i].south && i < Game.COLS * Game.ROWS - Game.COLS) {

					if (! mazeCells[i + Game.COLS].visited) {

						possibleWalls.push (Game.SOUTH);

					}

				}

				//NOT A CELL ON THE NORTHERN-EDGE OF THE MAZE

				if (mazeCells[i].north && i >= Game.COLS) {

					if (! mazeCells[i - Game.COLS].visited) {

						possibleWalls.push (Game.NORTH);

					}

				}

				

				//PART B: IF possibleWalls CONTAINS WALLS TO REMOVE,

				// GENERATE A RANDOM WALL FROM THE POSSIBLE WALLS, ELIMINATE THE WALL, AND MARK THE NEW CELL AS VISITED

				if (possibleWalls.length > 0) {

					var randomWall = possibleWalls[Math.floor(Math.random() * possibleWalls.length)];

					

					

					

					//OPEN THE WALL FOR THE CELL AS WELL AS THE WALL OF THE OTHER CELL

					switch (randomWall) {

						case Game.NORTH :

							mazeCells[i].north = false;

							mazeCells[i - Game.COLS].south = false;

							i -=  Game.COLS;

							break;

						case Game.SOUTH :

							mazeCells[i].south = false;

							mazeCells[i + Game.COLS].north = false;

							i +=  Game.COLS;

							break;

						case Game.EAST :

							mazeCells[i].east = false;

							mazeCells[i + 1].west = false;

							i++;

							break;

						case Game.WEST :

							mazeCells[i].west = false;

							mazeCells[i - 1].east = false;

							i--;

							break;

					}

					mazeCells[i].visited = true;

					stack.push (i);				//PUSH THE NEXT CELL ONTO THE STACK;

					visitedCells++;				//COUNT THIS NEXT CELL AS VISITED

				}

				else {

					//PART C: IF NO WALLS CAN BE REMOVED,

					// BEGIN BACKTRACKING; POP THE STACK

					var top:int = stack.pop();

					if (top==i) {

						i = stack.pop();	//POP THE STACK - REVERSE

						stack.push (i);

					}

				}

			}

		}

	}

}