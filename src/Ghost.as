package  {
	import flash.display.MovieClip;
	import flash.display.Sprite;	
	import flash.display.*;
	import flash.text.TextField;
	import flash.geom.Point;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.events.*;
	
	public class Ghost extends Sprite
	{
		public static var life:Number;
		public static var note:String;
		public static var type:String;
		public static var speed:uint;
		public static var name:String;
		
		private var ghostSprite:Sprite;
		private var noteField:TextField = new TextField();
		
		private var g1:Ghost1 = new Ghost1;
		private var g2:Ghost2 = new Ghost2;
		private var g3:Ghost3 = new Ghost3;
		private var g4:Ghost4 = new Ghost4;
		
		public function Ghost( _note:String, _life:Number, _type:Array, _speed:Number)
		{	
			//assign params
			name = _note;
			life = _life;		
			type = _type[ Math.floor( Math.random() * _type.length ) ];
			speed = _speed;
			
			noteField.text = _note;
			
			//create ghost
			switch( type )
			{
				case "g1": ghostSprite = g1; break;
				case "g2": ghostSprite = g2; break;
				case "g3": ghostSprite = g3; break;
				case "g4": ghostSprite = g4; break;
				default: ghostSprite = g1; break;
			}
			
			ghostSprite.x = 800;
			ghostSprite.y = 0;
			
			noteField.x = ghostSprite.width / 2;
			noteField.y = ghostSprite.height/2;
			
			ghostSprite.addChild(noteField);
			addChild(ghostSprite);
			
			this.addEventListener(Event.ENTER_FRAME, onEnter);
		}
		
		private function onEnter(evt:Event):void 
		{
			this.x -= 1;
		}			
	}	
}
