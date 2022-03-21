package {

	import flash.display.*;
	import flash.events.*;
	import flash.display.MovieClip;

	public class CompletedPool extends MovieClip {

		private var cueBall: WhiteBall;
		private var blackBall: BlackBall;
		private var blueBall: BlueBall;
		private var redBall: RedBall;
		private var greenBall: GreenBall;
		private var yellowBall: YellowBall;
		private var purpleBall: PurpleBall;

		private var stick: Stick;

		public function CompletedPool() {
			// constructor code
			cueBall = new WhiteBall(400, 250);
			cueBall.vx = 0;
			cueBall.vy = 0;
			addChild(cueBall);

			blackBall = new BlackBall(400, 260);
			blackBall.vx = 0;
			blackBall.vy = 0;
			addChild(blackBall);

			blueBall = new BlueBall(400, 270);
			blueBall.vx = 0;
			blueBall.vy = 0;
			addChild(blueBall);

			redBall = new RedBall(400, 280);
			redBall.vx = 0;
			redBall.vy = 0;
			addChild(redBall);

			greenBall = new GreenBall(400, 290);
			greenBall.vx = 0;
			greenBall.vy = 0;
			addChild(greenBall);

			yellowBall = new YellowBall(400, 300);
			yellowBall.vx = 0;
			yellowBall.vy = 0;
			addChild(yellowBall);

			purpleBall = new PurpleBall(400, 310);
			purpleBall.vx = 0;
			purpleBall.vy = 0;
			addChild(purpleBall);

			stick = new Stick();
			stick.x = mouseX;
			stick.y = mouseY;
			addChild(stick);

			addEventListener(Event.ENTER_FRAME, updateObjects);
			stick.addEventListener(MouseEvent.MOUSE_DOWN, startToShoot);

		}

		public function updateObjects(event: Event) {
			cueBall.movePosition();

			var dx: Number = cueBall.x - mouseX;
			var dy: Number = cueBall.y - mouseY;
			var angle: Number = Math.atan2(dy, dx);
			stick.rotation = angle * 180 / Math.PI;

			stick.x = mouseX;
			stick.y = mouseY;
			
			// LOOP THROUGH TO SEE IF IT HITS ALL THE BALLS
			checkCollision(cueBall, blackBall);
			checkCollision(cueBall, blueBall);
			checkCollision(cueBall, redBall);
			checkCollision(cueBall, greenBall);
			checkCollision(cueBall, yellowBall);
			
			checkCollision(blackBall, blueBall);
			checkCollision(blackBall, redBall);
			checkCollision(blackBall, greenBall);
			checkCollision(blackBall, yellowBall);
			
			checkCollision(blueBall, redBall);
			checkCollision(blueBall, greenBall);
			checkCollision(blueBall, yellowBall);
			
			checkCollision(redBall, greenBall);
			checkCollision(redBall, yellowBall);
			
			checkCollision(greenBall, yellowBall);
			
			
		}

		public function startToShoot(event: MouseEvent) {
			var dx: Number = cueBall.x - mouseX;
			var dy: Number = cueBall.y - mouseY;
			var dist: Number = Math.sqrt(dx * dx + dy * dy);

			if (dist > 110) {
				stick.startx = stick.x;
				stick.starty = stick.y;
				stick.addEventListener(MouseEvent.MOUSE_UP, finishShoot);
			}
		}

		public function finishShoot(event: Event) {
			cueBall.vx = (stick.x - stick.startx) * .2;
			cueBall.vy = (stick.y - stick.starty) * .2;
			stick.removeEventListener(MouseEvent.MOUSE_UP, finishShoot);
		}

		public function checkCollision(ball1, ball2): void {
			var dx: Number = ball1.x - ball2.x;
			var dy: Number = ball1.y - ball2.y;
			var dist: Number = Math.sqrt(dx * dx + dy * dy);
			if (dist < Game.DIAMETER) {
				var angle = Math.atan2(dy, dx);
				var cosa = Math.cos(angle);
				var sina = Math.sin(angle);
				ball1.x = ball2.x + cosa * Game.DIAMETER;
				ball1.y = ball2.y + sina * Game.DIAMETER;
				var vx2 = cosa * ball1.vx + sina * ball1.vy;
				var vy1 = cosa * ball1.vy - sina * ball1.vx;
				var vx1 = cosa * ball2.vx + sina * ball2.vy;
				var vy2 = cosa * ball2.vy - sina * ball2.vx;
				ball1.vx = cosa * vx1 - sina * vy1;
				ball1.vy = cosa * vy1 + sina * vx1;
				ball2.vx = cosa * vx2 - sina * vy2;
				ball2.vy = cosa * vy2 + sina * vx2;
				//var temp: Number = ball1.vx;
				//ball1.vx = ball2.vx;
				//ball2.vx = temp;
				//ball1.x = ball2.x - Game.DIAMETER;
			}

		}

	}

}