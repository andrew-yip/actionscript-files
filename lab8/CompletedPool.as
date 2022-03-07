package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class CompletedPool extends MovieClip{
		
		private var cueBall: WhiteBall;
		private var stick: Stick;

		public function CompletedPool () {
			// constructor code
			cueBall = new WhiteBall(400, 300);
			cueBall.vx = 0;
			cueBall.vy = 0;
			addChild(cueBall);
			
			stick = new Stick();
			stick.x = mouseX;
			stick.y = mouseY;
			addChild(stick);
			
			addEventListener(Event.ENTER_FRAME, updateObjects);
			stick.addEventListener(MouseEvent.MOUSE_DOWN, startToShoot);
			
		}
	
		public function updateObjects(event: Event){
			cueBall.movePosition();
			
			var dx: Number = cueBall.x - mouseX;
			var dy: Number = cueBall.y - mouseY;
			var angle: Number = Math.atan2(dy, dx);
			stick.rotation = angle * 180 / Math.PI;
			
			stick.x = mouseX;
			stick.y = mouseY;
		}
	
		public function startToShoot(event: MouseEvent){
			var dx: Number = cueBall.x - mouseX;
			var dy: Number = cueBall.y - mouseY;
			var dist: Number = Math.sqrt(dx * dx + dy * dy);
			
			if (dist > 110){
				stick.startx = stick.x;
				stick.starty = stick.y;
				stick.addEventListener(MouseEvent.MOUSE_UP, finishShoot);
			}
		}
	
		public function finishShoot(event: Event) {
			cueBall.vx = (stick.x - stick.startx) * .6;
			cueBall.vy = (stick.y - stick.starty) * .6;
			stick.removeEventListener(MouseEvent.MOUSE_UP, finishShoot);
		}

	}
	
}
