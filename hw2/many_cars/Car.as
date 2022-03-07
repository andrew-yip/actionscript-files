package  {
	import flash.display.*;
	
	public class Car extends MovieClip{
		
		//PUBLIC DATA MEMBERS
		public var mX: Number;
		public var mY: Number;
		public var velocity: Number;
		
		//PRIVATE DATA MEMBERS
		private var rightWall: Number;
		private var leftWall: Number;

		public function Car() {
			// constructor code
			this.mX = mX;
			this.mY = mY;
		}
	
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
			// when you hit the right wall
			if (mX > rightWall - (this.width/2) ) {
				mX = rightWall - (this.width/2);
				this.velocity = Math.floor(Math.random()*20 + 5) * -1;
				this.scaleX = -1;
				//velocity *= -1;
			} 
		
			// when you hit the left wall
			else if (mX < leftWall + (this.width/2) ) {
				mX = leftWall + (this.width/2) ;
				this.scaleX = 1;
				this.velocity = Math.floor(Math.random()*20 + 5);
				//this.velocity = Math.random()*20;
				//velocity *= -1;
			}
		}
	}

	}
	

