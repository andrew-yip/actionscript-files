package  {
	import flash.display.*;
	
	public class Car extends MovieClip{
		// public data members
		public var mX: Number;
		public var mY: Number;
		public var velocity: Number;

		//private data members
		private var rightWall: Number;
		private var leftWall: Number;
		
		
		public function Car() {}
	
				// member methods
		public function setLocation(mX: Number, mY: Number) {
			this.mX = mX;
			this.mY = mY;
		}
		public function setWallBoundries(leftWall: Number, rightWall: Number) {
			this.leftWall = leftWall;
			this.rightWall = rightWall;
		}
		public function updateLocation() {
			// task 1: update soccer ball location
			mX += velocity;
			leftWheel.rotation += velocity;
			rightWheel.rotation += velocity;

			// task 2: check for impact
			if (mX > rightWall) {
				mX = leftWall;
			} 

		}

	}
	
}
