package  {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	
	public class Racing3D extends MovieClip {
		//GAME ELEMENTS
		
		// PLAYER INPUT: KEYBOARD ARROWS PRESSED
		private var isLeftArrowPressed:Boolean;
		private var isRightArrowPressed:Boolean;
		private var isUpArrowPressed:Boolean;
		private var isDownArrowPressed: Boolean;
		
		//ARRAY OF ALL GAME DISPLAY OBJECTS
		private var worldObjects:Array; 
		
		// LIBRARY VISUAL DISPLAY OBJECTS
		private var car:Car;
		private var ground:Ground;
		
		//GAME OBJECTS
		private var viewSprite:Sprite; // everything
		private var worldSprite:Sprite; // ground, trees, car
		
		
		
		public function Racing3D() {
			
			//TASK 1: INSTANTIATE THE ARRAY TO HOLD ALL WORLD GAME DISPLAY OBJECTS
			worldObjects = new Array();
			
			//TASK 2: CREATE A CONTAINER TO HOLD ALL VIEWS AND 
			//        PLACE IT IN THE CENTER OF THE STAGE.
			viewSprite = new Sprite();
			viewSprite.x = 275;
			viewSprite.y = 350;
			addChild(viewSprite);
			
			//TASK 3: CREATE A WORLD VIEW AND ADD IT TO THE MAIN CONTAINER
			worldSprite = new Sprite();
			worldSprite.rotationX = -90;
			viewSprite.addChild(worldSprite);
			
			//TASK 4: CREATE THE GROUND TERRAIN AND ADD IT TO THE WORLD VIEW.
			ground = new Ground();
			ground.scaleX = 20;   //SCALE IT UP.
			ground.scaleY = 20;
			worldSprite.addChild(ground);
			
			//TASK 5: CREATE A CAR AND ADD IT TO THE WORLD VIEW AND THE ARRAY OF OBJECTS.
			car = new Car();
			worldSprite.addChild(car);
			worldObjects.push(car);
			
						
			//TASK 6: CREATE TREES (LOCATE AT THE TREE BASES IN GROUND.)
			for(var i:int=0;i<ground.numChildren;i++) { 
				// loop through children
				if (ground.getChildAt(i) is TreeBase) { 
					// found a tree base
					var tree:Tree = new Tree();
					tree.x = ground.getChildAt(i).x*20; 
					// set location
					tree.y = ground.getChildAt(i).y*20;
					tree.scaleX = 10; 
					tree.scaleY = 10;
					tree.rotationX = 90; 
					worldSprite.addChild(tree);
					worldObjects.push(tree); 
				}
			}
			
			// TASK 7: z-index sort
			zSort();
		
			// TASK 8: PLAYER DRIVES AND STEERS USING ARROW KEYS
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressedDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyPressedUp);
			
			// TASK 9: GAME LOOP
			addEventListener(Event.ENTER_FRAME, moveGame);
		}
		
	
		public function keyPressedDown(event:KeyboardEvent) {
			//PLAYER HOLD THEIR FINGER ON AN ARROW KEY
			switch (event.keyCode){
				case Game.LEFTARROW: isLeftArrowPressed = true; break;
				case Game.RIGHTARROW: isRightArrowPressed = true; break;
				case Game.UPARROW: isUpArrowPressed = true; break;
				case Game.DOWNARROW: isDownArrowPressed = true; ;
			}
		}
		
		
		public function keyPressedUp(event:KeyboardEvent) {
			//PLAYER REMOVES THEIR FINGER FROM AN ARROW KEY
			switch (event.keyCode){
				case Game.LEFTARROW: isLeftArrowPressed = false; break;
				case Game.RIGHTARROW: isRightArrowPressed = false; break;
				case Game.UPARROW: isUpArrowPressed = false; break;
				case Game.DOWNARROW: isDownArrowPressed = false; ;
			}
		}
		
	
		// MAIN GAME LOOP
		public function moveGame(e) {
		
			// CHECK IF PLAYER TURNS TO THE LEFT OR RIGHT
			var turn:Number = 0;
			if (isLeftArrowPressed) {
				turn = .3;
			} else if (isRightArrowPressed) {
				turn = -.3;
			}
		
			// PCHECK IF LAYER ACCELERATES BY PRESSING THE UP ARROW KEY. OTHERWISE IT DECELERATES
			if (isUpArrowPressed) {
				car.velocity += .1;
				if (car.velocity > 5) car.velocity = 5; // limit
			} else {
				car.velocity -= .05;
				if (car.velocity < 0) car.velocity = 0; // limit
			}
			
			// CHECK IF  PLAYER MOVES OFF THE ROAD -  THE CAR SLOWS DOWN.
			if (!ground.road.hitTestPoint(275,350,true)) {
				car.velocity *= .95;
			}
		
			// if moving, then move and turn
			if (car.velocity != 0) {
				moveTerrain(-car.velocity*10);
				turnPlayer(Math.min(2.0,car.velocity)*turn);
				zSort();
				
			}
			
		}
		
		private function moveTerrain(d) {
			
			// move player by moving terrain in opposite directionection
			worldSprite.x += d*Math.cos(car.direction*2.0*Math.PI/360);
			worldSprite.z += d*Math.sin(car.direction*2.0*Math.PI/360);
			
			// move car opposite of terrain to keep in place
			car.x -= d*Math.cos(car.direction*2.0*Math.PI/360);
			car.y += d*Math.sin(car.direction*2.0*Math.PI/360);
		}
		
		
		private function turnPlayer(d) {
			
			// change directionection
			car.direction += d;
			
			// rotate world to change view
			viewSprite.rotationY = car.direction-90;
			
			// rotate all trees and car to face the eye
			for(var i:int=0;i<worldObjects.length;i++) {
				worldObjects[i].rotationZ -= d;
			}
		}
		
		// sort all objects so the closest ones are highest in the display list
		private function zSort() {
			var objectDist:Array = new Array();
			for(var i:int=0;i<worldObjects.length;i++) {
				var z:Number = worldObjects[i].transform.getRelativeMatrix3D(root).position.z;
				objectDist.push({z:z,n:i});
			}
			objectDist.sortOn( "z", Array.NUMERIC | Array.DESCENDING );
			for(i=0;i<objectDist.length;i++) {
				worldSprite.addChild(worldObjects[objectDist[i].n]);
			}
		}
		
	}
	
}
