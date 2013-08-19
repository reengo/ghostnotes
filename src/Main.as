package 
{
	import flash.display.*;	
	import flash.media.*;	
	import flash.events.*;
	import flash.net.URLRequest;	
	import flash.net.URLLoader;	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.text.TextField;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.flashandmath.dg.objects.AbstractParticle;

	/**
	 * ...
	 * @author Ringo Bautista
	 */
	[Frame(factoryClass = "Preloader")]
	[SWF(width="750", height="450", background="0xffffff")]
	public class Main extends Sprite
	{
		[Embed(source='../lib/GhostNotesAssets.swf', symbol='intro')]
		private var IntroMC:Class;
		[Embed(source='../lib/GhostNotesAssets.swf', symbol='city1')]
		private var City:Class;
		[Embed(source='../lib/GhostNotesAssets.swf', symbol='clouds1')]
		private var Clouds:Class;
		
		private var introMC:Sprite = new IntroMC;
		private var city:Sprite = new City;
		private var clouds:Sprite = new Clouds;
		
		public static var ghostsOnStage:Number = 0;
		public static var score:Number = 0;
		public static var scoreBoard:TextField = new TextField();
		public static var note:TextField = new TextField();			
		public static var mainMenu:MainMenu;
		public static var sound:SoundEffects;		
		public static var swfPath:String;
		
		private var urlLoader:URLLoader = new URLLoader();
		
		private var spawnTimer:Timer;
		private var lvlRounds:Number;
		private var menu:MainMenu;
		private var control:Controls;		
		private var _xml:XML;
		
		private var ghostVolume:Array;

		public function Main(xml:XML):void 
		{
			_xml = xml
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{		
			//switch scene delay
			var transitionTimer:Timer;
			transitionTimer = new Timer( 0, 1 );// delay 0
			transitionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, menuSceneHandler );
			transitionTimer.start();
		}
		
		public function logoSceneHandler( e:TimerEvent ):void
		{
			logoScene();
		}
		public function menuSceneHandler( e:TimerEvent ):void
		{
			menuScene();
		}
		
		public function logoScene():void
		{
			//logoMC.x = 274;
			//logoMC.y = 110;
			//addChild( logoMC );
			//logoMC.play();
			//switchToScene( 'menu' );
		}
				
		public function introScene( e:TimerEvent ):void
		{			
			addChild( introMC );
			switchToScene( 'menu' );
		}
		
		public function menuScene():void
		{
			//removeChild( logoMC );
			//removeChild( introMC );
			mainMenu = new MainMenu();
			addChild( mainMenu );
			
			MainMenu.bassGuitarButton.addEventListener( MouseEvent.CLICK, startHandler );
			MainMenu.practiceButton.addEventListener( MouseEvent.CLICK, selectHandler );
			MainMenu.scoresButton.addEventListener( MouseEvent.CLICK, scoreHandler );
		}
		
		public function initStage():void
		{									
			//notification.text = "";
			removeChild( mainMenu );						
			addChildAt( city, 0);
			//Actions.transitionMC(city, [-700,0], [0,0], 2, "appear");
			//city.x = -6000;
			clouds.addEventListener( Event.ENTER_FRAME, moveBg );
			
			addChildAt(clouds, 0);
			clouds.x = -2000;
			
			scoreBoard.text = "Score: " + String( score );
			scoreBoard.x = 650;
			scoreBoard.y = 10;
			addChild(scoreBoard);
			
			note.text = "";
			note.x = 20;
			note.y = 20;
			addChild(note);
			
			initControls();	
			
			startRound( 1 );
		}
		
		
		private function moveBg( e:Event ):void
		{
			//city.x += 3;
			clouds.x += 0.5;
		}
		
		private function initControls( ):void
		{			
			control = new Controls( _xml );			
			control.x = 0;
			control.y = 700;
			addChildAt( control, 2 );			
			
			Actions.transitionMC(control, [0,1000], [0,250], 1, "slide");					
		}
		
		private function startRound( lvl:Number ):void
		{
			switch( lvl ){
				case 1:
					ghostVolume = [ 1, 1 ];					
					spawnTimer = new Timer( 5000, 10 ); // 1 ghost appears every 5 seconds 10 times
				break;
			}
			
			spawnTimer.addEventListener( TimerEvent.TIMER, haunt );
			spawnTimer.start();
		}
		
		private function haunt( e:TimerEvent ):void
		{
			var ghostNumber:Number = Math.floor(Math.random() * ( ghostVolume[1] - ghostVolume[0] + 1)) + ghostVolume[0];		
			
			var notes:Array = [ 'F','F#','G','G#','Bb','B','C','C#','D#','E2','F2','A2','Bb2','B2','C2','C#2','D2','F#2' ];
			var speed:Number = 0.0000001;
			var noteName:String;
			var startPointX:Number;
			var startPointY:Number;	
			
			noteName = notes[ Math.floor( Math.random() * notes.length ) ];
			
			startPointY = Math.floor(Math.random() * (170 - 0 + 1)) + 0;
			startPointX = Math.floor(Math.random() * (50 - 0 + 1)) + 0;
			
			Ghost[noteName] = new Ghost( noteName, 2, ['g1', 'g2', 'g3'], speed);
			Ghost.life = 2;
			Ghost[noteName].name = noteName;
			trace(noteName);
			Ghost[noteName].y = startPointY;				
			Ghost[noteName].x = startPointX;		
						
			addChildAt(Ghost[noteName], 2);
		}		
		
		public dynamic function switchToScene( scene:String ):void
		{
			var transitionTimer:Timer;
			
			switch ( scene ){
				case "intro":
					transitionTimer = new Timer( 5000, 1 );
					transitionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, introScene );
					transitionTimer.start();
				break;
				case "menu":
					transitionTimer = new Timer( 5000, 1 );
					transitionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, menuScene );
					transitionTimer.start();
				break;
				case "logo":
					transitionTimer = new Timer( 5000, 1 );
					transitionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, logoSceneHandler );
					transitionTimer.start();
				break;
			}			
		}
		
		private function startHandler( e:MouseEvent ):void
		{
			initStage();			
		}
		private function selectHandler( e:MouseEvent ):void
		{
			trace("select");			
		}
		
		private function scoreHandler( e:MouseEvent ):void
		{
			trace("score");
		}

	}

}