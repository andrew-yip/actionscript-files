﻿package  {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Game extends MovieClip{

		public static var SIZE: int = 13;
		public static var OFFSET: int = 82;
		
		public static var COLS: int = 50;
		public static var ROWS: int = 50;
		
		public static var N_CELLS: int = ROWS * COLS;
		
		public static var NORTH: int = 0;
		public static var SOUTH: int = 1;
		public static var EAST: int = 2;
		public static var WEST: int = 3;
		
		// CONTROLS
		public static var UPARROW:int = 38;
		public static var DOWNARROW:int = 40;
		public static var LEFTARROW:int = 37;
		public static var RIGHTARROW:int = 39;

	}
	
}
