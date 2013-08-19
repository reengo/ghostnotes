package  {
	import com.greensock.*;
	import com.greensock.events.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.media.*
	import flash.events.*;
	import flash.text.TextField;
	import com.flashandmath.dg.objects.AbstractParticle;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Actions 
	{			
		public static var ghost:Object = new Object();
		public static var ghosts:Array = [];
		
		private var strings:Array = [];
		
		public function Actions() 
		{
			//strings = [fret.eString, fret.aString, fret.dString, fret.gString];
		}				
		
		public static function transitionMC( mc:MovieClip, from:Array, dest:Array, duration:Number, transAni:String ):void
		{
			switch( transAni ){
				case "slide":
					TweenMax.fromTo( mc, duration, { x:from[0], y:from[1] }, { x:dest[0], y:dest[1], ease:Bounce.easeIn } );
					break;
				case "appear":
					TweenMax.fromTo( mc, duration, { alpha:0}, {alpha:1, ease:Elastic.easeOut } );
					break;
			}			
		}
		
		public static function pullStrings( string:Sprite,note:String ):void
		{						
			//TweenMax.to( string, 0.1, { ease:Bounce.easeIn, blurFilter:{ blurY:5 }, tint:0xccff66, onComplete:resetClickable, onCompleteParams:[string]});				
		}
		
		private function resetClickable(string:Sprite):void
		{
			TweenMax.to( string, 0.5, { ease:Bounce.easeOut, blurFilter:{ blurY:0 }, tint:null });
		}
		
		//public function showNote( note:String ):void
//		{
//			var displayNote:TextField = new TextField();
//			displayNote.text = note;
//			this.addChild(displayNote);
//			trace(displayNote);
//			TweenMax.to( displayNote, 0.5, { alpha: 0.7, ease:Bounce.easeIn, blurFilter:{ blurY:50 }, onComplete:resetState} );
//		}
		
		public function resetState( e:MouseEvent ):void
		{
			TweenMax.to( e.target, 1, { alpha: 1, ease:Elastic.easeOut, blurFilter:{ blurY:0 } } ); 
		}
		
		public static function hitGhost( note:String ):void
		{				
			Main.score += 20; 
			Main.scoreBoard.text = "Score: " + String( Main.score ); 
			if (Ghost.life == 0) {
				TweenMax.to( ghost, 0.5, { ease:Bounce.easeIn, blurFilter:{ blurY:5 }, tint:0xff0000, onComplete:resetHitGhost, onCompleteParams:[ghost]});					
			}else {
				Ghost.life -= 1;
			}
			
		}
		
		public static function playerDeath():void
		{
			trace("YOUR DEADS");
		}
		
		public static function resetHitGhost( ghost:MovieClip ):void
		{
			Main.ghostsOnStage = Main.ghostsOnStage-1;
			TweenMax.fromTo( ghost, 0.5, { ease:Bounce.easeOut, blurFilter:{ blurY:0 }, tint:null }, { alpha:0, x:1000000 });
		}		
		public static function switchToScene( scene:String ):void
		{
			//ghostNotes.logoScene;
			trace(Main.mainMenu);
		}
		public static function playSound( sound:String ):void
		{	
			SoundEffects.sound[ sound ].play();
		}
	}	
}
