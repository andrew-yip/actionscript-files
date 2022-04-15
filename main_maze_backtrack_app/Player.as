package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Player extends MovieClip{
		
		public var visited: Boolean;
		public var index: int;

		public function Player(i, row, col: int) {
			// constructor code
			index = i;
			this.x = col * Game.SIZE + Game.OFFSET;
			this.y = row * Game.SIZE + Game.OFFSET;
			visited = false;
		}

	}
	
}
