package  {
	
	import flash.display.*;
	
	public class SoccerBall extends MovieClip{
		
		// PUBLIC DATA MEMBERS
		public var mX: Number;
		public var mY: Number;
		public var velocity: Number;
		
		// private data members
		private var rightWall: Number;
		private var leftWall: Number;
		

		public function SoccerBall() {
			// constructor code
			
		}
	
		public function setLocation(mX:Number, mY:Number){
			this.mX = mX;
			this.mY = mY;
		}
		public function setWallBoundaries(leftWall:Number, rightWall:Number){
			this.rightWall = rightWall;
			this.leftWall = leftWall;
		}
		public function updateLocation (){
			// 1. MOVE THE SOCCER BALL IN THE WINDOW
			mX += velocity;
			
			// 2. CHECK FOR COLLISIONS WITH WALLS
			if (mX > rightWall){
				mX = rightWall;
				velocity *= -1;
			} else if (mX < leftWall){
				mX = leftWall;
				velocity *= -1;
			}

		}

	}
	
}
