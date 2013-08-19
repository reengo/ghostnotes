package  
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Ringo Bautista
	 */
	public class Logo extends MovieClip
	{
		[Embed(source='../lib/GhostNotesAssets.swf', symbol='logo')]
		private var LogoMC:Class;	
		private var logoMC:MovieClip = new LogoMC;
		
		public function Logo() 
		{
			logoMC.x = 274;
			logoMC.y = 110;
			addChild( logoMC );
			logoMC.play();
			
			var transitionTimer:Timer = new Timer( 5000, 1 );
		  
			transitionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, preload );
			transitionTimer.start();
		}
		private function preload(e:TimerEvent):void
		{
			var PreloaderClass:Class = getDefinitionByName("Preloader") as Class;
			addChild(new PreloaderClass() as DisplayObject);
		}
		
	}

}