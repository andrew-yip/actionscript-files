package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class SoccerGame extends MovieClip{
		
		// GAME ELEMENTS
		var soccerBall: SoccerBall;

		public function SoccerGame() {
			// constructor code
			soccerBall = new SoccerBall();
			soccerBall.setLocation(200, 200);
			soccerBall.x = soccerBall.mX;
			soccerBall.y = 100;
			soccerBall.velocity = 10;
			soccerBall.setWallBoundaries(0, 550);
			addChild(soccerBall);
		}

	}
	
}
