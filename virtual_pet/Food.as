package  {
	
	import flash.display.*;
	
	public class Food extends MovieClip{
		
		public var eaten: Boolean;

		public function Food() {
			// constructor code
			this.y = Math.random() * 100 + 600;
			this.x = Math.random() * 800 + 150;
			eaten = false;
		}

	}
	
}
