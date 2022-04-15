package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Cell extends MovieClip{
		
		// PROPERTIES FOR A CELL IN A MAZE
		public var xPos: int;
		public var yPos: int;
		public var visited: Boolean;
		public var north: Boolean;
		public var south: Boolean;
		public var east: Boolean;
		public var west: Boolean;
		public var row: int;
		public var col: int;

		public function Cell(row, col: int) {
			// constructor code
			// SET THE UPPER LEFT X AND Y POSITION OF THE CELL
			xPos = col * Game.SIZE + Game.OFFSET;
			yPos = row * Game.SIZE + Game.OFFSET;
			this.row = row;
			this.col = col;
			
			visited = false;
			north = true;
			south = true;
			east = true;
			west = true;
		}

	}
	
}
