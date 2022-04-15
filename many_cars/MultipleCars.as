package  {
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.events.*;
	
	public class MultipleCars extends MovieClip{
		
			var car1: Car;
			var car2: Car;
			var car3: Car;
			var car4: Car;
			var car5: Car;
			var car6: Car;
			var car7: Car;
			var car8: Car;
			var car9: Car;
			var car10: Car;
			var car11: Car;
			var car12: Car;
			var car13: Car;
			var car14: Car;
			var car15: Car;
			var car16: Car;
			var allCars:Array;

		public function MultipleCars() {
			// constructor code
			
			car1 = new Car();
			car2 = new Car();
			car3 = new Car();
			car4 = new Car();
			car5 = new Car();
			car6 = new Car();
			car7 = new Car();
			car8 = new Car();
			car9 = new Car();
			car10 = new Car();
			car11 = new Car();
			car12 = new Car();
			car13 = new Car();
			car14 = new Car();
			car15 = new Car();
			car16 = new Car();
			allCars = new Array();
			
			car1.setLocation(200, 200);
			car1.x = car1.mX;
			car1.y = car1.mY;
			car1.velocity = 20;
			car1.setWallBoundaries(0, 600);
			addChild(car1);
			allCars.push(car1);
			
			car2.setLocation(100, 270);
			car2.x = car2.mX;
			car2.y = car2.mY;
			car2.velocity = 15;
			car2.setWallBoundaries(0, 600);
			addChild(car2);
			allCars.push(car2);
			
			car3.setLocation(50, 250);
			car3.x = car3.mX;
			car3.y = car3.mY;
			car3.velocity = 11;
			car3.setWallBoundaries(0, 600);
			addChild(car3);
			allCars.push(car3);
			
			car4.setLocation(10, 50);
			car4.x = car4.mX;
			car4.y = car4.mY;
			car4.velocity = 5;
			car4.setWallBoundaries(0, 600);
			addChild(car4);
			allCars.push(car4);
			
			car5.setLocation(20, 300);
			car5.x = car5.mX;
			car5.y = car5.mY;
			car5.velocity = 7;
			car5.setWallBoundaries(0, 600);
			addChild(car5);
			allCars.push(car5);
			
			car6.setLocation(70, 260);
			car6.x = car6.mX;
			car6.y = car6.mY;
			car6.velocity = 8;
			car6.setWallBoundaries(0, 600);
			addChild(car6);
			allCars.push(car6);
			
			car7.setLocation(20, 190);
			car7.x = car7.mX;
			car7.y = car7.mY;
			car7.velocity = 13;
			car7.setWallBoundaries(0, 600);
			addChild(car7);
			allCars.push(car7);
			
			car8.setLocation(25, 100);
			car8.x = car8.mX;
			car8.y = car8.mY;
			car8.velocity = 12;
			car8.setWallBoundaries(0, 600);
			addChild(car8);
			allCars.push(car8);
			
			car9.setLocation(40, 40);
			car9.x = car9.mX;
			car9.y = car9.mY;
			car9.velocity = 14;
			car9.setWallBoundaries(0, 600);
			addChild(car9);
			allCars.push(car9);
			
			car10.setLocation(50, 50);
			car10.x = car10.mX;
			car10.y = car10.mY;
			car10.velocity = 10;
			car10.setWallBoundaries(0, 600);
			addChild(car10);
			allCars.push(car10);
			
			car11.setLocation(10, 280);
			car11.x = car11.mX;
			car11.y = car11.mY;
			car11.velocity = 6;
			car11.setWallBoundaries(0, 600);
			addChild(car11);
			allCars.push(car11);
			
			car12.setLocation(5, 40);
			car12.x = car12.mX;
			car12.y = car12.mY;
			car12.velocity = 8;
			car12.setWallBoundaries(0, 600);
			addChild(car12);
			allCars.push(car12);
			
			car13.setLocation(80, 150);
			car13.x = car13.mX;
			car13.y = car13.mY;
			car13.velocity = 9;
			car13.setWallBoundaries(0, 600);
			addChild(car13);
			allCars.push(car13);
			
			car14.setLocation(200, 90);
			car14.x = car14.mX;
			car14.y = car14.mY;
			car14.velocity = 10;
			car14.setWallBoundaries(0, 600);
			addChild(car14);
			allCars.push(car14);
			
			car15.setLocation(180, 10);
			car15.x = car15.mX;
			car15.y = car15.mY;
			car15.velocity = 11;
			car15.setWallBoundaries(0, 600);
			addChild(car15);
			allCars.push(car15);
			
			car16.setLocation(150, 200);
			car16.x = car1.mX;
			car16.y = car1.mY;
			car16.velocity = 19;
			car16.setWallBoundaries(0, 600);
			addChild(car16);
			allCars.push(car16);
			
			addEventListener(Event.ENTER_FRAME, move);
		}
	
		public function move(event: Event) {
			car1.updateLocation();
			car1.x=car1.mX;
			car2.updateLocation();
			car2.x=car2.mX;
			car3.updateLocation();
			car3.x=car3.mX;
			car4.updateLocation();
			car4.x=car4.mX;
			car5.updateLocation();
			car5.x=car5.mX;
			car6.updateLocation();
			car6.x=car6.mX;
			car7.updateLocation();
			car7.x=car7.mX;
			car8.updateLocation();
			car8.x=car8.mX;
			car9.updateLocation();
			car9.x=car9.mX;
			car10.updateLocation();
			car10.x=car10.mX;
			car11.updateLocation();
			car11.x=car11.mX;
			car12.updateLocation();
			car12.x=car12.mX;
			car13.updateLocation();
			car13.x=car13.mX;
			car14.updateLocation();
			car14.x=car14.mX;
			car15.updateLocation();
			car15.x=car15.mX;
			car16.updateLocation();
			car16.x=car16.mX;
		}

	}
	
}
