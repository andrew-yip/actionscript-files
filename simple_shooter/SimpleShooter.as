﻿package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent; 
	
	public class SimpleShooter extends MovieClip{
		
		public static var planeList: Array;
		private var schedulePlaneInterval: int;
		private var schedulePlaneIntervalLimit: int;
		private var bulletLauncher: BulletLauncher;
		public function SimpleShooter() {
			planeList = new Array();
			schedulePlaneInterval = 0;
			schedulePlaneInterval = 20;
			bulletLauncher = new BulletLauncher();
			addChild(bulletLauncher);
			
			addEventListener(Event.ENTER_FRAME, updateGame);
			stage.addEventListener(MouseEvent.CLICK, clickHandler); 
		}
	
		// WHEN YOU CLICK THE MOUSE BULLETS COME OUT
		public function clickHandler(event: MouseEvent){
			var bullet: Bullet = new Bullet();
			addChild(bullet);
			addEventListener(Event.ENTER_FRAME, bullet.updateLocation);
		}
	
		public function updateGame(event:Event){
			// schedule planes to appear at intervals
			schedulePlaneInterval++;
			
			if(schedulePlaneInterval >= schedulePlaneIntervalLimit){
				scheduleNextPlane();
			}
			// move active planes and remove inactive planes
			for (var i: int = 0; i < planeList.length; i++){
				planeList[i].move();
				// removal o fan inactive plane
				if(!planeList[i].isActive){
					planeList.splice(i,1);
				}
			}
		}
	
		public function scheduleNextPlane(){
			// reset schedule interval count and time limit
			schedulePlaneInterval = 0;
			schedulePlaneIntervalLimit = Math.random()*40+10;
			// generate random properties for next plane
			var velocity:Number = Math.random()*3+10;
			var altitude:Number = Math.random()*100 + 100;
			var travelDirection: String = "right";
			if(Math.random() > .5){
				travelDirection = "left";
			}
			// add the plane to the stage and the array structure
			var p:Plane;
			var planeType = (int)(Math.random()*3+1);
		
			switch(planeType){
				case 1: p = new Helicopter(travelDirection, velocity, altitude);break;
				case 2: p = new Airplane(travelDirection, velocity, altitude);break;
				case 3: p = new SeaPlane(travelDirection, velocity, altitude);break;
			}
		
			addChild(p);
			planeList.push(p);
		}

	}
	
}
