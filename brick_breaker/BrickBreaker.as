package  {
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.geom.ColorTransform;
	import flash.ui.Keyboard;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.system.fscommand;
	
	public class BrickBreaker extends MovieClip{
		
		public var brickArray: Array;
		public var paddle: Paddle;
		public var ball: Ball;
		public static var stillPlaying: Boolean;

		public function BrickBreaker() {
			// constructor code
			
			stillPlaying = true;
			brickArray = new Array();
			paddle = new Paddle();
			addChild(paddle);
			ball = new Ball(300, 200);
			addChild(ball);
			
			ball.vx = 150;
			ball.vy = 150;
			
			// top to bottom (rows)
			for (var i:int = 1; i <= 5; i++){
				
				// from left to right (columns)
				for (var j:int = 1; j <= 4; j++){
					var currentBrick: Brick = new Brick(i*95, j*25);
					brickArray.push(currentBrick);
					addChild(currentBrick);
				}
			}
			
			// to move 
			addEventListener(Event.ENTER_FRAME, moveBall);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, movePaddle);
		}
	
		public function moveBall(event: Event) {
			ball.movePosition();
			checkCollision();
		}
	
		public function selfDelete():void{
			if (parent != null){
				parent.removeChild(this);
			}
		}
	
	
		public function movePaddle(event: MouseEvent){
			// LEFT ARROW
			paddle.x = parent.mouseX;
		}
	
		// IF COLLIDES WITH PADDLE OR BRICK
		public function checkCollision(): void {
				
				// IF COLLIDES WITH THE PADDLE
				if (ball.x < paddle.x + 100 && ball.x > paddle.x - 100 && ball.y > paddle.y - 25) {
					if (ball.y > paddle.y - 25){
						ball.vy = ball.vy * - 1;
					}
				}
			
				if (brickArray.length == 0 || !stillPlaying){
					// HAVE AN END MESSAGE AND QUIT THE WINDOW
					if (brickArray.length == 0) trace("YOU WON");
					else trace("GAME OVER");
					fscommand("quit");
					
					while (stage.numChildren > 0){
						stage.removeChildAt(0);
					}
				}
			
			
				// LOOP TO CHECK ALL THE COLLISIONS
				for (var i: int = 0; i < brickArray.length; i++) {
					// NOW WE CHECK IF IT COLLIDES WITH ANY OF THE BRICKS
					//trace("brick x: " + brickArray[i].x);
					//trace("brick y: " + brickArray[i].y);
					//trace("ball x: " + ball.x);
					//trace("ball y: " + ball.y);
					//trace();
					if (ball.x < brickArray[i].x + 50 && ball.x > brickArray[i].x - 50){
						if (ball.y < brickArray[i].y + 20){
							trace("hit");
							brickArray[i].selfDelete();
							brickArray.splice(i, 1);
							ball.vy = ball.vy * -1;
						}
					}
				}
			}

		}

	}
	

