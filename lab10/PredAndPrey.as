package  {
	import flash.display.*;
	import flash.events.*;
	public class PredAndPrey extends MovieClip{
		
		public var board: Array;
		public var boardOfObjects: Array;
		
		
		public function PredAndPrey() {
			trace("inside document class");
			
			board = new Array();
			boardOfObjects= new Array();
			
			makeBoard();
			
			displayBoard();
		}
	
		public function makeBoard():void{
			for (var r:int = 0; r < Game.ROWS; r++){
				board[r] = new Array();
				
				for(var c:int = 0; c < Game.COlS; c++){
					if (r==0 || r==Game.ROWS-1 || c==0 || c==Game.COlS-1){
						board[r][c] = Game.BLOCK;
					}
					else{
						var percent:Number = Math.random();
						if(percent < .85){
							board[r][c] = Game.FREE;
						}
						else{
							board[r][c] = Game.BLOCK;
						}
					}
				}
			}
			board[Game.ROWS-2][Game.COlS-1] = Game.EXIT;
			board[1][1] = Game.FREE;
			board[Game.ROWS - 2][Game.COlS - 2] = Game.FREE;
			board[Game.ROWS - 2][Game.COlS - 2] = Game.FREE;
		}
	
		public function displayBoard ():void{
			for(var r:int = 0; r < Game.ROWS; r++){
				for(var c:int = 0; c < Game.COlS; c++){
					var cell:DisplayObject;
					
					if(board[r][c] == Game.FREE){
						cell = new FreeSpace();
					}
					else if (board[r][c] == Game.EXIT){
						cell = new ExitDOOR();
					}
					else{
						cell = new Obstical();
					}
					cell.x = c * Game.WIDTH + Game.OFFSET;
					cell.y = r * Game.WIDTH + Game.OFFSET;
					cell.alpha = .7;
					boardOfObjects.push(cell);
					addChild(cell);
				}
			}
		}

	}
	
}
