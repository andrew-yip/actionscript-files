package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getTimer;
    import flash.display.Sprite;
	
	public class Plane extends MovieClip{
		
		private var lastTime:int;
		private var vx:int;

		public function Plane(velocity:Number, altitude:Number) {
			// constructor code
			this.x = -10; // start to the left
			vx = velocity; // fly left to right
			this.scaleX = -1; // reverse orientation
			this.y = altitude
			addEventListener(Event.ENTER_FRAME, flyPlane);
			lastTime = getTimer();
		}
	
		public function flyPlane(event: Event) {
			var timePassed:int = getTimer() - lastTime;
			lastTime += timePassed;
			
			this.x += vx * timePassed/1000;
			
			// REVERSE PLANE IF IT FLIES OFF THE SCREEN
			
			// OFF THE LEFT SCREEN
			if (this.x < -50){
				vx = Math.abs(vx);
				this.scaleX = -1;
			} 
			
			// OFF THE RIGHT OF THE SCREEN
			else if (this.x > 650){
				vx = Math.abs(vx) * -1;
				this.scaleX *= -1;
			}
			
		}

	}
	
}
