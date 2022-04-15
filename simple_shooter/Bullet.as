package  {
	
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.events.*;
	
	public class Bullet extends MovieClip{
		
		//PUBLIC DATA MEMBERS
		public var velocity: Number;
		
		//PRIVATE DATA MEMBERS
		private var topWall: Number;

		public function Bullet() {
			// constructor code
			this.x = 500;
			this.y = 450;
			this.velocity = -10;
		}
	
		public function updateLocation (event:Event){
			this.y += this.velocity;
			
			// ITERATE THROUGH PLANE LIST
			for (var i: int = 0; i < SimpleShooter.planeList.length; i++){
				var currentPlane: Plane = SimpleShooter.planeList[i];
				if (this.y >= currentPlane.y - 50 && this.y <= currentPlane.y + 50){
					if (this.x >= currentPlane.x - 50 && this.x <= currentPlane.x + 50){
						trace("collision!");
						currentPlane.selfDelete();
						SimpleShooter.planeList.splice(i, 1);
						selfDelete();
						return;
					}
				}
			}
		
						
			if (this.y > topWall) {
				selfDelete();
			}
		}
	
		public function selfDelete(){
			if (parent != null){
				parent.removeChild(this);
			}
		}

	}
	
}
