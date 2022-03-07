package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;
	import flash.utils.*;
	
	public class Ball extends MovieClip{
		
		// DATA MEMBERS
			public var vx: Number;
			public var vy: Number;
			private var lastTimeStamp:uint;

		public function Ball(mx, my: Number) {
			// constructor code
			this.x = mx;
			this.y = my;
			lastTimeStamp = getTimer();
		}
	
		public function setColor(redColor, greenColor, blueColor: Number): void {
			var color: ColorTransform = new ColorTransform;
			
			color.redMultiplier = redColor;
			color.blueMultiplier = blueColor;
			color.greenMultiplier = greenColor;
			this.transform.colorTransform = color;
		}
	
		public function movePosition (): void {
			var elapsedTime: int = getTimer() - lastTimeStamp;
			lastTimeStamp += elapsedTime;
			
			this.x += this.vx * elapsedTime/1000;
			this.y += this.vy * elapsedTime/1000;
			checkWall();
		}
	
		public function checkWall(): void {
			// LEFT OR RIGHT BORDERS
			if (this.x < Game.LEFTBORDER){
				this.vx *= Game.REVERSE;
				this.x = Game.LEFTBORDER;
			} else if (this.x > Game.RIGHTBORDER){
				this.vx *= Game.REVERSE;
				this.x = Game.RIGHTBORDER;
			} 
		
		
			// TOP AND BOTTOM BORDERS
			if (this.y < Game.TOPBORDER){
				this.vy *= Game.REVERSE;
				this.y = Game.TOPBORDER;
			} else if (this.y > Game.BOTTOMBORDER){
				this.vy *= Game.REVERSE;
				this.y = Game.BOTTOMBORDER;
			}
		}
	
		

	}
	
}
