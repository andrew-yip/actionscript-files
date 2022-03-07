package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class rotateArrow extends MovieClip{
		
		// DATA MEMBERS
		private var target: Target;
		private var arrow: Arrow;

		public function rotateArrow() {
			// TASK 1: CREATE AND ADD THE TARGET AND ARROW TO THE STATE
			target = new Target();
			arrow = new Arrow();
			
			addChild(target);
			addChild(arrow);
			
			// TASK 2: REGISTER A LISTENER EVENT TO ACTIVATE MOTION
			addEventListener(Event.ENTER_FRAME, activeMotion);
		}
	
		function activeMotion(event:Event){
			// TASK 1: POSITION THE TARGET AT THE MOUSE LOCATION
			target.x = mouseX;
			target.y = mouseY;
			
			// TASK 2: GET THE ARROW TO TURN TOWARDS THE TARGET
			arrow.turn(target.x, target.y);
		}

	}
	
}
