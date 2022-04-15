package  {
	
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.events.*;
	
	public class shootPlane extends MovieClip{
		
		// data members
		var plane: Plane;
		var rocketLauncher: RocketLauncher;

		public function shootPlane() {
			// constructor code
			
			// HAS DEFAULT COORDINATES
			plane = new Plane(80, 30);
			rocketLauncher = new RocketLauncher();
			
			// ADD THE CHILD
			addChild(plane);
			addChild(rocketLauncher);
			
			// ADD THE LISTENER
			addEventListener(Event.ENTER_FRAME, move);
		}
	
		public function move(event: Event) {
			// CHANGING THE POSITION OF ROCKET LAUNCHER X AND Y TO WHERE THE MOUSE IS
			rocketLauncher.updateAngle(plane.x,plane.y);
		}

	}
	
}
