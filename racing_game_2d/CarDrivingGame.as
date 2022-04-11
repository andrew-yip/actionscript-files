package {
	import flash.events.*;
	import flash.display.*;
	import flash.utils.*;

	public class CarDrivingGame extends MovieClip {
		//GAME ELEMENTS
		private var car:Car;
		private var lastTimeStamp:uint;

		public function CarDrivingGame() {
			//TASK 1: ADD THE CAR TO THE STAGE
			car = new Car(track.x, track.y);
			addChild(car);

			// TASK 2: REGISTER KEYBOARD EVENTS FOR KEY DOWN
			// NOTE: USING BOTH EVENTS, USERS CAN TURN AND ACCELERATE SIMULTANEUSLY
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownFunction);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpFunction);
			
			//TASK 3: REGISTER LISTENER EVENT FOR THE GAME LOOP
			lastTimeStamp = getTimer();
			addEventListener(Event.ENTER_FRAME,updateCameraAngle);
		}

		public function updateCameraAngle(event:Event) {
			//TASK 1: COMPUTE ELAPSED TIME
			var elapsedTime:int = getTimer() - lastTimeStamp;
			lastTimeStamp += elapsedTime;

			// TASK 2: CHANGE THE CAMERA ANGLE
			var toRadians:Number = Math.PI / 180;
			track.x +=  car.velocity * Math.sin(car.rotation * toRadians) * elapsedTime / 100;
			track.y -=  car.velocity * Math.cos(car.rotation * toRadians) * elapsedTime / 100;
			
		}

		//****************** KEYBOARD EVENT METHODS ********************************
		public function keyDownFunction(event:KeyboardEvent) {
			//FINITE STATES ACCELERATION, REVERSE, TURNING, BRAKING
			switch (event.keyCode) {
				case Game.UPARROW :
					car.isMovingForward = true;
					break;
				case Game.DOWNARROW :
					car.isMovingReverse = true;
					break;
				case Game.LEFTARROW :
					car.isTurningLeft = true;
					break;
				case Game.RIGHTARROW :
					car.isTurningRight = true;
					break;
				case Game.SPACEBAR :
					car.isBraking = true;
			}
		}

		public function keyUpFunction(event:KeyboardEvent) {
			switch (event.keyCode) {
				case Game.UPARROW :
					car.isMovingForward = false;
					break;
				case Game.DOWNARROW :
					car.isMovingReverse = false;
					break;
				case Game.LEFTARROW :
					car.isTurningLeft = false;
					break;
				case Game.RIGHTARROW :
					car.isTurningRight = false;
					break;
				case Game.SPACEBAR :
					car.isBraking = false;
			}
		}
	}
}