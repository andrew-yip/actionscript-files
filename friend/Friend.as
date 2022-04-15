package  {
	
	import flash.display.*;
	
	public class Friend extends MovieClip{
		
		// DATA MEMBER
		public var timeToTarget:Number;

		public function Friend(positionX, positionY, t) {
			// constructor code
			this.x = positionX;
			this.y = positionY;
			timeToTarget = t;
		}
	
		public function updatePosition(targetX, targetY){
			// GET THE DIRECITON TO THE TARGET
			var steeringVelocityX:Number = targetX - this.x;
			var steeringVelocityY:Number = targetY - this.y;
		
			// MOVE TO THE TARGET USING timeToTarget Seconds
			this.x += steeringVelocityX / this.timeToTarget;
			this.y += steeringVelocityY / this.timeToTarget;
		
			// COMPUTE THE ANGLE TO THE TARGET
			var angleRadians:Number = Math.atan2(steeringVelocityY, steeringVelocityX);
			
			// CONVERT TO RADIANS
			var rotationDegrees:Number = angleRadians * 180 / Math.PI;
			this.rotation = rotationDegrees;
		}

	}
	
}
