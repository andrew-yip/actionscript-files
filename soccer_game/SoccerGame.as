package {
	import flash.display.*;
	import flash.events.*;
	public class SoccerGame extends MovieClip{
		//GAME ELEMENTS
		var soccerBall: SoccerBall;
		public function SoccerGame() {
				trace("inside soccer game");
			// constructor code
			soccerBall = new SoccerBall();
			soccerBall.setLocation(200, 200);
			soccerBall.x = soccerBall.mX;
			soccerBall.y = soccerBall.mY;
			soccerBall.velocity = 10;
			soccerBall.setWallBoundaries(0, 600);
			addChild(soccerBall);
			
			addEventListener(Event.ENTER_FRAME, move);
		}
		public function move(event: Event) {
		soccerBall.updateLocation();
			soccerBall.x=soccerBall.mX;	
		}
	}

}