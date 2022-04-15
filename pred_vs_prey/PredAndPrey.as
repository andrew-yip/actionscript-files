package {
	import flash.display.*;
	import flash.events.*;
	public class PredAndPrey extends MovieClip {

		public var board: Array;
		public var boardOfObjects: Array;
		public var predator: Predator;
		public var prey: Prey;

		public var preyRow: Number;
		public var preyCol: Number;

		public var predatorRow: Number;
		public var predatorCol: Number;


		public function PredAndPrey() {
			trace("inside document class");

			board = new Array();
			boardOfObjects = new Array();
			predator = new Predator();
			prey = new Prey();

			makeBoard();
			displayBoard();

			// SET PREDATOR AND PREY X, Y
			preyRow = 1;
			preyCol = 1;
			predatorRow = 9;
			predatorCol = 9;

			stage.addEventListener(KeyboardEvent.KEY_UP, playGame);

		}

		public function playGame(event: KeyboardEvent): void {

			switch (event.keyCode) {
				case Game.UPARROW:

					// to move the prey
					if (board[preyRow - 1][preyCol] == Game.FREE) {
						prey.y -= Game.WIDTH;
						preyRow--;
					}

					break;
				case Game.DOWNARROW:

					// to move the prey
					if (board[preyRow + 1][preyCol] == Game.FREE) {
						prey.y += Game.WIDTH;
						preyRow++;
					}

					break;
				case Game.RIGHTARROW:

					// to move the prey
					if (board[preyRow][preyCol + 1] == Game.FREE) {
						prey.x += Game.WIDTH;
						preyCol++;

					} else if (board[preyRow][preyCol + 1] == Game.EXIT) {
						prey.x += Game.WIDTH;
						trace("YOU WIN!");
						return;
					}
					break;
				case Game.LEFTARROW:
					if (board[preyRow][preyCol - 1] == Game.FREE) {
						prey.x -= Game.WIDTH;
						preyCol--;
					}

					break;
			}



			// to move the predator
			// calculating distance
			var x_dist = Math.abs(predatorCol - preyCol);
			var y_dist = Math.abs(predatorRow - preyRow);
			if (x_dist > y_dist) {
				var leftOne = predatorCol - 1;
				var rightOne = predatorCol + 1;

				// RECALCULATE DISTANCE
				var leftDist = Math.abs(leftOne - preyCol);
				var rightDist = Math.abs(rightOne - preyCol);

				// determine which way would be better to go

				// move to the left because left is closer
				if (leftDist < rightDist) {
					if (board[predatorRow][leftOne] == Game.FREE) {
						predator.x -= Game.WIDTH;
						predatorCol = leftOne;
					} else if (board[predatorRow][rightOne] == Game.FREE) {
						predator.x += Game.WIDTH;
						predatorCol = rightOne;
					} else if (board[predatorRow][leftOne] != Game.FREE && board[predatorRow][rightOne] != Game.FREE) {
						trace("PREDATOR IS STUCK! PREDATOR NEEDS TO MOVE UP OR DOWN!");
					}
				} else {
					if (board[predatorRow][rightOne] == Game.FREE) {
						predator.x += Game.WIDTH;
						predatorRow = rightOne;
					} else if (board[predatorRow][leftOne] == Game.FREE) {
						predator.x -= Game.WIDTH;
						predatorRow = leftOne;
					} else if (board[predatorRow][leftOne] != Game.FREE && board[predatorRow][rightOne] != Game.FREE) {
						trace("PREDATOR IS STUCK! PREDATOR NEEDS TO MOVE UP OR DOWN!");
					}
				}

			} else {
				var upOne = predatorRow - 1;
				var downOne = predatorRow + 1;

				// RECALCULATE DISTANCE
				var upDist = Math.abs(upOne - preyRow);
				var downDist = Math.abs(downOne - preyRow);

				// move to the up because up is closer
				if (upDist < downDist) {
					if (board[upOne][predatorCol] == Game.FREE) {
						predator.y -= Game.WIDTH;
						predatorRow = upOne;
					} else if (board[downOne][predatorCol] == Game.FREE) {
						predator.y += Game.WIDTH;
						predatorRow = downOne;
					} else if (board[upOne][predatorCol] != Game.FREE && board[downOne][predatorCol] != Game.FREE) {
						trace("PREDATOR IS STUCK! PREDATOR NEEDS TO MOVE LEFT OR RIGHT!");
					}
				} else {
					if (board[downOne][predatorCol] == Game.FREE) {
						predator.y += Game.WIDTH;
						predatorRow = downOne;
					} else if (board[upOne][predatorCol]) {
						predator.y -= Game.WIDTH;
						predatorRow = downOne;
					} else if (board[upOne][predatorCol] != Game.FREE && board[downOne][predatorCol] != Game.FREE){
						trace("PREDATOR IS STUCK! PREDATOR NEEDS TO MOVE LEFT OR RIGHT!");
					}
				}
			}

			// GAME OVER STATEMENT
			if (preyRow == predatorRow && preyCol == predatorCol) {
				trace("GAME OVER YOU LOSE!");
				return;
			}
		}

		public function makeBoard(): void {
			for (var r: int = 0; r < Game.ROWS; r++) {
				board[r] = new Array();

				for (var c: int = 0; c < Game.COlS; c++) {
					if (r == 0 || r == Game.ROWS - 1 || c == 0 || c == Game.COlS - 1) {
						board[r][c] = Game.BLOCK;
					} else {
						var percent: Number = Math.random();
						if (percent < .85) {
							board[r][c] = Game.FREE;
						} else {
							board[r][c] = Game.BLOCK;
						}
					}
				}
			}
			board[Game.ROWS - 2][Game.COlS - 1] = Game.EXIT;
			board[1][1] = Game.FREE;
			board[Game.ROWS - 2][Game.COlS - 2] = Game.FREE;
			board[Game.ROWS - 2][Game.COlS - 2] = Game.FREE;
		}

		public function displayBoard(): void {
			for (var r: int = 0; r < Game.ROWS; r++) {
				for (var c: int = 0; c < Game.COlS; c++) {

					var cell: DisplayObject;

					if (board[r][c] == Game.FREE) {
						cell = new FreeSpace();
					} else if (board[r][c] == Game.EXIT) {
						cell = new ExitDOOR();
					} else {
						cell = new Obstical();
					}
					cell.x = c * Game.WIDTH + Game.OFFSET;
					cell.y = r * Game.WIDTH + Game.OFFSET;
					cell.alpha = .7;
					boardOfObjects.push(cell);
					addChild(cell);
				}
			}

			predator.x = (Game.ROWS - 2) * Game.WIDTH + Game.OFFSET;
			predator.y = (Game.COlS - 2) * Game.WIDTH + Game.OFFSET;
			addChild(predator);

			prey.x = Game.WIDTH + Game.OFFSET;
			prey.y = Game.WIDTH + Game.OFFSET;
			addChild(prey);
		}

	}
}