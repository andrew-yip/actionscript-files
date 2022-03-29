package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class MazeMain extends MovieClip{
		
		public var mazeCells: Array;

		public function MazeMain() {
			
			// TASK 1: INSTANTIATE THE MAZE OF CELLS AND ADD 10 X 10 CELLS
			mazeCells = new Array(100);
			var i: int = 0;
			for (var row: int = 0; row < Game.ROWS; row++){
				for (var col: int = 0; col < Game.COLS; col++){
					var cell: Cell = new Cell(row, col);
					mazeCells[i++] = cell;
				}
			}
		
			// TASK 2: PERFORM BACKTRACKING TO CARVE OUT A PERFECT MAZE
			
		
			// TASK 3: DRAW THE MAZE
			drawMazeCells();
		}
	
		public function drawMazeCells(): void {
			for (var i: int = 0; i < Game.N_CELLS; i++){
				var shape: Shape = new Shape();
				
				shape.graphics.lineStyle(2, 0xFF0000);
				shape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos);
				
				// DRAW NORTH WALL
				if (mazeCells[i].north){
					shape.graphics.lineTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos);
				}
			
				// DRAW EAST WALL
				if (mazeCells[i].east){
					shape.graphics.lineTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos + Game.SIZE);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos + Game.SIZE);
				}
			
				// DRAW SOUTH WALL
				if (mazeCells[i].south){
					shape.graphics.lineTo(mazeCells[i].xPos, mazeCells[i].yPos + Game.SIZE);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos + Game.SIZE);
				}
			
				// DRAW WEST WALL
				if (mazeCells[i].west){
					shape.graphics.lineTo(mazeCells[i].xPos, mazeCells[i].yPos);
				} else {
					shape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos);
				}
			
				addChild(shape);
			}
		}

	}
	
}
