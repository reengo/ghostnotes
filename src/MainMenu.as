package  {
	import com.greensock.motionPaths.MotionPath;
	import flash.display.MovieClip;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MainMenu extends MovieClip
	{
		//private var ghostNotes:GhostNotes = new GhostNotes();				
		public static var playButton:buttonPlay = new buttonPlay;
		public static var practiceButton:buttonPractice = new buttonPractice;
		public static var scoresButton:buttonHighScore = new buttonHighScore;
		public static var backButton:buttonBack = new buttonBack;
		
		public static var guitarButton:buttonGuitar = new buttonGuitar;
		public static var bassGuitarButton:buttonBass = new buttonBass;
		
		private var splash:HomePageBG = new HomePageBG;
		private var menuLogo:MenuLogo = new MenuLogo;
		private var menuEffect:MenuEffect = new MenuEffect;
		private var startMenuMessage:StartMenuMessage = new StartMenuMessage;
		
		private var mainMenu:MovieClip = new MovieClip;
		private var startMenu:MovieClip = new MovieClip;
		
		public function MainMenu():void
		{		
			splash.x = splash.y = menuEffect.x = menuEffect.y = mainMenu.x = mainMenu.y = 0;
			menuLogo.x = 170;
			menuLogo.y = 10;
			
			addChild(splash);
			addChild(menuEffect);
			addChild(menuLogo);
			
			playButton.x = 10;
			playButton.y = 320;
			playButton.buttonMode = true;
			
			practiceButton.x = 250;
			practiceButton.y = 320;
			practiceButton.buttonMode = true;
			
			scoresButton.x = 490;
			scoresButton.y = 320;
			scoresButton.buttonMode = true;
			
			startMenuMessage.x = 740 + 10
			startMenuMessage.y = 20;
			
			bassGuitarButton.x = 740+310;
			bassGuitarButton.y = 20;
			bassGuitarButton.buttonMode = true;
			
			guitarButton.x = 740+550;
			guitarButton.y = 40;
			guitarButton.buttonMode = true;
			
			backButton.x = 740+10;
			backButton.y = 320;
			backButton.buttonMode = true;
			
			mainMenu.addChild(menuLogo);
			mainMenu.addChild(playButton);
			mainMenu.addChild(practiceButton);
			mainMenu.addChild(scoresButton);
			
			startMenu.x = 740;
			startMenu.addChild(startMenuMessage);
			startMenu.addChild(guitarButton);
			startMenu.addChild(bassGuitarButton);
			startMenu.addChild(backButton);
			
			playButton.addEventListener( MouseEvent.CLICK, openStartMenu )
			practiceButton.addEventListener( MouseEvent.CLICK, openStartMenu )
			backButton.addEventListener( MouseEvent.CLICK, returnMainMenu );
			
			playButton.addEventListener( MouseEvent.MOUSE_OVER, buttonOver );
			practiceButton.addEventListener( MouseEvent.MOUSE_OVER, buttonOver );
			scoresButton.addEventListener( MouseEvent.MOUSE_OVER, buttonOver );
			guitarButton.addEventListener( MouseEvent.MOUSE_OVER, buttonOver );
			bassGuitarButton.addEventListener( MouseEvent.MOUSE_OVER, buttonOver );
			backButton.addEventListener( MouseEvent.MOUSE_OVER, buttonOver );
			
			playButton.addEventListener( MouseEvent.MOUSE_OUT, resetOver );
			practiceButton.addEventListener( MouseEvent.MOUSE_OUT, resetOver );
			scoresButton.addEventListener( MouseEvent.MOUSE_OUT, resetOver );
			guitarButton.addEventListener( MouseEvent.MOUSE_OUT, resetOver );
			bassGuitarButton.addEventListener( MouseEvent.MOUSE_OUT, resetOver );
			backButton.addEventListener( MouseEvent.MOUSE_OUT, resetOver );
			
			addChild( mainMenu );
			addChild( startMenu );
		}
		
		private function openStartMenu( e:MouseEvent ):void
		{
			Actions.playSound('gg');
			TweenMax.to(mainMenu,1, {x: -740, ease:Back.easeOut});
			TweenMax.to(startMenu, 1, { x: -740, ease:Back.easeOut } );
			TweenMax.to(menuEffect,1, {x: -540, ease:Back.easeOut});
		}
		private function returnMainMenu( e:MouseEvent ):void
		{
			Actions.playSound('e');
			TweenMax.to(mainMenu,1, {x: 0, ease:Back.easeOut});
			TweenMax.to(startMenu, 1, { x: 740, ease:Back.easeOut } );
			TweenMax.to(menuEffect,1, {x: -100, ease:Back.easeOut});
		}
		
		private function buttonOver( e:MouseEvent  ):void
		{
			//TweenMax.to( e.target, 0.2, { glowFilter:{ color:0x00ff00, alpha:100, blurX:30, blurY:30 }} );
			TweenMax.to(e.target,0.2, {tint:0xffffff, alpha:0.5});
		}
		private function resetOver( e:MouseEvent ):void
		{
			//TweenMax.to( e.target, 0.5, { glowFilter:{ alpha:100, blurX:0, blurY:0 } } );
			TweenMax.to(e.target,0.2, {tint:null,alpha:1});
		}		
	}
	
}
