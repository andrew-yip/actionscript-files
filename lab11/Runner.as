package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Runner extends MovieClip{
		
		public var visited: Boolean;
		public var index: int;

		public function Runner(i, row, col: int) {
			// constructor code
			index = i;
			this.x = col * Game.SIZE + Game.OFFSET;
			this.y = row * Game.SIZE + Game.OFFSET;
			visited = false;
		}

	}
	
}
