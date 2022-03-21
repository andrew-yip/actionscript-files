package  {
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;
	import flash.utils.*;
	
	public class Ball extends MovieClip{
		
		public var vx: Number;
		public var vy: Number;
		private var lastTimeStamp: uint;

		public function Ball(mx: Number, my: Number) {
			// constructor code
			this.x = mx;
			this.y = my;
			lastTimeStamp = getTimer();
		}
	
		public function movePosition (): void {
			
			if (vx != 0 && vy != 0){
				var elapsedTime: int = getTimer() - lastTimeStamp;
				lastTimeStamp += elapsedTime;
				
				vx *= Game.FRICTION;
				vy *= Game.FRICTION;
				
				this.x += this.vx * elapsedTime / 100;
				this.y += this.vy * elapsedTime / 100;
				
				var speedVecotr: Number = Math.sqrt(vx * vx + vy * vy);
				if (speedVecotr < Game.MINSPEED){
					vx = 0;
					vy = 0;
				}
			
				checkWall();
				checkPocket();
			
				//HAVE A FUNCTION HERE TO SEE IF IT GOES IN THE POCKET
				
			}
			
		}
	
		public function checkPocket (): void {
			// CHECK POCKET 1
			if (this.x == 141.45 && this.y == 100.1){
				
			}
			
			// CHECK POCKET 2
			else if (this.x == 596.35 && this.y == 100.5){
				
			}
			
			
			// CHECK POCKET 3
			else if (this.x == 142 && this.y == 335.6){
				
			}
			
			// CHECK POCKET 4
			else if (this.x == 597.35 && this.y == 333.36){
				
			}
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
