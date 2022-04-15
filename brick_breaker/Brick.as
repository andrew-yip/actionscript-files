package  {
	import flash.display.MovieClip;
	
	public class Brick extends MovieClip{

		public function Brick(brickX: Number, brickY: Number) {
			// constructor code
			this.x = brickX;
			this.y = brickY;
			this.width = 50;
			this.height = 20;
		}
	
		public function selfDelete():void{
			if (parent != null){
				parent.removeChild(this);
			}
		}

	}
	
}
