package {
	import flash.display.*;
	public class SoccerBall extends MovieClip {
		//PUBLIC DATA MEMBERS
		public var mX: Number;
		public var mY: Number;
		public var velocity: Number;

		//PRIVATE DATA MEMBERS
		private var rightWall: Number;
		private var leftWall: Number;

		public function SoccerBall() {}


		public function setLocation(mX: Number, mY: Number) {
			this.mX = mX;
			this.mY = mY;
		}
		public function setWallBoundaries(leftWall: Number, rightWall: Number) {
			this.rightWall = rightWall;
			this.leftWall = leftWall;
		}
		//update location at a frame in time
		public function updateLocation() {
			//move the soccerball in the window
			mX += velocity;
			this.leftWheel.rotation += velocity;
			this.rightWheel.rotation += velocity;
			//check for collision with walls
			if (mX > rightWall - (this.width/2) ) {
				mX = rightWall - (this.width/2);
				velocity *= -1;
			} else if (mX < leftWall + (this.width/2) ) {
				mX = leftWall + (this.width/2) ;
				velocity *= -1;
			}
		}
	}
}