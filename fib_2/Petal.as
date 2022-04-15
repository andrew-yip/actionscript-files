package {
	import flash.display.*;
	
	
	//THE PETAL CLASS IS AN EXTENSION OF THE MOVIECLIP CLASS
	public class Petal extends MovieClip {
		trace("petal");
		//CONSTRUCTOR
		public function Petal(angle: Number, scaleWidth: Number, scaleHeight: Number) {
			//TASK 1: POSITION PETAL IN THE CENTER
			this.x = 350;
			this.y = 350;

			//TASK 2: APPLY ROTATION, WIDTH, AND  HEIGHT
			this.rotation = angle;
			this.scaleX = scaleWidth;
			this.scaleY = scaleHeight;
		}
	}
}