package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.geom.ColorTransform;
	import flash.ui.Keyboard;
	import flash.geom.Rectangle;
	
	public class Pong extends MovieClip{
		
		public var colorTransform:ColorTransform;

		public function Pong() {
			// constructor code
			
			// TASK 1. INIT COLOR AND SET UP THE LISTENER
			colorTransform = new ColorTransform();
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpFunction);
		}
	
		public function keyUpFunction(event: KeyboardEvent){
			// LEFT ARROW
			if (event.keyCode == 37){
				brickB.x = brickB.x - 2;
			}
		
			// RIGHT ARROW
			else if (event.keyCode == 39){
				brickB.x = brickB.x + 2;
			}
		
			// CHECK FOR A COLLISION
			var rect1 = new Rectangle(brickA.x, brickA.y, brickA.width, brickA.height);
			var rect2 = new Rectangle(brickB.x, brickB.y, brickB.width, brickB.height);
		
			if (rect1.x < rect2.x + rect2.width && rect1.x + rect1.width > rect2.x && rect1.height + rect1.y > rect2.y){
				colorTransform.color = 0xFF0000;
				brickB.transform.colorTransform = colorTransform;
			} else {
				colorTransform.color = 0x000000;
				brickB.transform.colorTransform = colorTransform;
			}
		}

	}
	
}
