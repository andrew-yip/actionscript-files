package  {
	
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.events.*;
	
	public class FriendChaser extends MovieClip{
		
		var friendList:Array = new Array();

		public function FriendChaser() {
			// constructor code
			
			
			
			for (var i:Number = 0; i < 100; i++){
				// SPECIFY THE TIME TO TARGET
				var timetoTarget:int = i + 1;
				var positionX = i * 30;
				var positionY:int = 300;
				
				// INSTANTIATE A BOX, ADD IT TO THE STATE AND THE LIST
				var myFriend:Friend = new Friend(positionX, positionY, timetoTarget);
				//trace("hi");
				addChild(myFriend);
				friendList.push(myFriend);
			}
		
			// REGISTER AN EVENT 
			addEventListener(Event.ENTER_FRAME, followMouse);
		}
	
		public function followMouse(event: Event){
			for (var i: Number = 0; i < friendList.length; i++){
				friendList[i].updatePosition(mouseX, mouseY);
			}
		}

	}
	
}
