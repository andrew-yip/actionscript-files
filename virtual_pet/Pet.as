package  {
	
	import flash.display.*;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.display.Sprite;
	
	public class Pet extends MovieClip{
		
		// CURRENT PET STATE
		private var myState: int;
		
		//POSSIBLE PET STATES
		private const isPLAYING: int = 1;
		private const isLOOKING_FOR_FOOD:int = 2;
		private const isEATING:int = 3;
		
		// STOMACH ATTRIBUTES
		private var stomachCapacity: int;
		private var currentStomachLevel: int;
		private const EMPTY: int = 0;
		
		// SPEED ATTRIBUTE
		private var easingVelocity: int;
		
		// TIMER
		private var myTimer: Timer;

		public function Pet() {
			// constructor code
			// TASK 1: A PET ARRIVES WITH A FULL STOMACH, READY TO PLAY
			stomachCapacity = Math.random() * 100 + 150;
			currentStomachLevel = stomachCapacity;
			myState = isPLAYING;
			
			// TASK 2: ATTRIBUTES ARE RANDOMLY ASSIGNED: SIZE, SPEED ABILITY, LOCATION
			this.width = Math.random() * 45 + 45;
			this.height = this.width + 20;
			easingVelocity = Math.random() * 45 + 15;
			this.x = Math.random() * 600 + 200;
			this.y = Math.random() * 200 + 200;
			
			
			//	INSTANTIATE TIMER
			myTimer = new Timer(5);
			myTimer.start();
		}
	
		// MOVE: THIS FUNCTION IS CALLED DURING THE GAME LOOP
		public function move(toy: Toy, foodList: Array): void {
			// TASK: EVALUATE FINITE STATES
			switch (myState){
				// _________
				case isPLAYING:
					// TASK 1: BURN CALORIES
					currentStomachLevel--;
					// TASK 2: LOCATE THE TOY TO PLAY WITH
					locateTarget(toy.x, toy.y);
				
					// TASK 3: CHECK IF PET HAS AN EMPTY STOMACH: CHANGE STATE TO isListening
					if (currentStomachLevel < EMPTY){
						myState = isLOOKING_FOR_FOOD;
					}
					break;
				
				case isLOOKING_FOR_FOOD:
					// TASK 1: CHECK IF THERE IS ANY FOOD AND SEEK IT OUT.
					//locateTarget(food.x, food.y);
				
					// TASK 2: CHECK IF PET HAS REACHED THE FOOD: CHANGE THE STATE
					//if (food.hitTestPoint(this.x, this.y)){
					//	myState = isEATING;
					//}
					//break;
				
					// TIMER IF NO FOOD OUT AND AFTER A CERTAIN AMOUNT OF TIME THEN KILL THE PET
					
					if (foodList.length == 0 && myTimer.currentCount >= 30){
						
						//trace("hello");
						locateTarget(100, 650);
						if(myTimer.currentCount >= 750){
							if (parent != null) {
								parent.removeChild(this);
								myTimer.stop();
							}
							//parent.removeChild(this);
							break;
							
						}
/*							parent.removeChild(this);
							myTimer.stop();*/
							break;
					}
						
				
					// NEED TO GO THROUGH ALL THE FOODS TO SEE IF IT HIT
				
					for (var i: int = 0; i < foodList.length; i++){
						
						if (!foodList[i].eaten){
							locateTarget(foodList[i].x, foodList[i].y);
							if (foodList[i].hitTestPoint(this.x, this.y)){
								myState = isEATING;
								parent.removeChild(foodList[i]);
								foodList.removeAt(i);
							}
							break;
						}
						
						
						//myState = isPLAYING;
					}
				break;
				
				case isEATING:
					// TASK 1: CONSUME FOOD - INCREASE CURRENT STOMACH LEVEL
					currentStomachLevel++;
					// TASK 2: WHEN FOOD IS BELLY FULL, PET PLAYS
					if (currentStomachLevel >= stomachCapacity){
						myState = isPLAYING;
					}
					myTimer.reset();
					myTimer.start();
					break;
			}
		
		}
	
		// MOVE TOWARD A GIVEN TARGET
		public function locateTarget(xTarget: Number, yTarget: Number): void {
			// TASK 1: ORIENT THE PET TOWARDS ITS TARGET: FOOD OR TOY
			var xDist: Number = xTarget - this.x;
			var yDist: Number = yTarget - this.y;
			var angle: Number = Math.atan2(yDist, xDist);
			this.rotation = angle * 180 / Math.PI + 90;
			
			// TASK 2: MOVE TO THE TARGET
			this.x += (xTarget - this.x) / easingVelocity;
			this.y += (yTarget - this.y) / easingVelocity;
		}
	
		

	}
	
}
