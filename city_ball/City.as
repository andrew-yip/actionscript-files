package  {
	import flash.display.*;
	import flash.events.*;
	
	public class City extends MovieClip{
		var car: Car;
		var ball: Ball;
		public function City() {
			
			//adding the balls
			ball = new Ball();
			ball.setLocation(0,340);
			ball.x = ball.mX;
			ball.y = ball.mY;
			ball.velocity = 5;
			ball.setWallBoundries(0,600);
			addChild(ball);
			
			// adding a child car
			car = new Car();
			car.setLocation(0, 280);
			car.x = car.mX;
			car.y = car.mY;
			car.velocity = 10;
			car.setWallBoundries(0,600);
			addChild(car);
			
			addEventListener(Event.ENTER_FRAME,move)
		}
		
		public function move(event:Event){
			car.updateLocation();
			car.x = car.mX;
			ball.updateLocation();
			ball.x = ball.mX;
		}

	}
	
}
