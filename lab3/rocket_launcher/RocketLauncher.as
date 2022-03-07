package  {
	
	import flash.display.*;
	
	public class RocketLauncher extends MovieClip{

		public function RocketLauncher() {
			// constructor code
			this.x = 250;
			this.y = 350;
		}
	
		public function updateAngle(targetX, targetY){
			// GET THE DIRECTION AND SITANCE TO THE TARGET
			var dX:Number = targetX - this.x;
			var dY:Number = targetY - this.y;
			
			// COMPUTE THE ANGLE TO THE TARGET
			var angleRadians:Number = Math.atan2(dY, dX);
			
			// CONVERT TO RADIANS
			var rotationDegrees:Number = angleRadians * 180 / Math.PI;
			this.rotation = rotationDegrees;
		}

	}
	
}
