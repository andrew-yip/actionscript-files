package {
	import flash.display.*;
	import flash.events.*;
	public class FibApp extends MovieClip { 
			trace("fib");
		//GOLDEN RATIO CONSTANTS
		private const GOLDEN_RATIO: Number = .618;
		private const GOLDEN_ANGLE: Number = 360 * GOLDEN_RATIO;

		//CONSTANTS FOR RATIO GROWTH
		private const GROW_WIDTH: Number = GOLDEN_RATIO * .01
		private const GROW_HEIGHT: Number = GOLDEN_RATIO * .01;

		//VARIABLES FOR PETALS
		private var count: Number;
		private var angle: Number;
		private var scaleWidth: Number;
		private var scaleHeight: Number; 
		
		
		public function FibApp() {
				trace("constructor");
			//TASK 1: INITIALIZE VARIABLES
			count = 0;
			angle = 0;
			scaleWidth = 1;
			scaleHeight = 1;

			//TASK 2: SET THE FPS AND CREATE A GAMELOOP
			stage.frameRate = 15;
			addEventListener(Event.ENTER_FRAME, addPetal);
		}

		//GAME LOOP HANDLER
		public function addPetal(event: Event) {
			count++;
			//CREATE 150 PETALS
			if (count < 250) {
				//TASK 1: CREATE THE NEW PETAL AND ADD IT TO THE STAGE
				var petal: Petal = new Petal(angle, scaleWidth, scaleHeight);
				addChild(petal);
				setChildIndex(petal, 0);
				
				
				//TAKS 2: UPDATE FOR THE NEXT PETAL
				scaleWidth += scaleWidth * GROW_WIDTH;
				scaleHeight += scaleHeight * GROW_HEIGHT;
				angle = (angle + GOLDEN_ANGLE) % 360;
			}
		}
	}
}