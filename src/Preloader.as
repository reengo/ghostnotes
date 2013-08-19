package 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Ringo Bautista
	 */
	public class Preloader extends MovieClip 
	{
		[Embed(source='../lib/GhostNotesAssets.swf', symbol='logo')]
		private var LogoMC:Class;	
		private var logoMC:MovieClip = new LogoMC;
		private var swfPath:String = "";
		private var urlLoader:URLLoader = new URLLoader();
		private var percent:TextField = new TextField();	
		
		public static var xml:XML;
		public static var bulkLoader:BulkLoader = new BulkLoader("assets");
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}		
			
			logoMC.x = 274;
			logoMC.y = 110;
			addChild( logoMC );
			logoMC.play();
			
			var transitionTimer:Timer = new Timer( 5000, 1 );
		  
			transitionTimer.addEventListener( TimerEvent.TIMER_COMPLETE, startPreload );
			transitionTimer.start();
		}
		private function startPreload(e:TimerEvent):void
		{
			var domain:String = this.stage.loaderInfo.url;
			var domainSplit:Array = domain.split("/");
			
			swfPath = this.stage.loaderInfo.url == null ? '' : String( domainSplit[0] ) + "/";
			
			var loaderParams:String = loaderInfo.parameters.settings != null ? loaderInfo.parameters.settings : 'default';						
			//var request:URLRequest = new URLRequest(  swfPath + "settings/" + loaderParams + ".xml" );		
			var request:URLRequest = new URLRequest(  "http://www.reengo.com/rgb/static/ghost-notes/settings/" + loaderParams + ".xml" );		
			
			urlLoader.load( request );
			urlLoader.addEventListener( Event.COMPLETE, onLoadXMLComplete, false, 0, true  );
			
			// TODO show loader
			
			removeChild(logoMC);
			addChild(percent);
		}
		
		
		private function onLoadXMLComplete(e:Event):void
		{
			urlLoader = URLLoader( e.target );
			xml = new XML( e.target.data );
			xml.ignoreWhitespace = true;
			
			addEventListener(Event.ENTER_FRAME, checkFrame);			
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
		}
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:BulkProgressEvent):void 
		{
			// TODO update loader
			trace(e.loadingStatus())
			
			var perc:Number = e.bytesLoaded / 3644004 ;
			percent.textColor = 0xFFFFFF;
			percent.text = "Loading.... " + Math.ceil(perc * 100).toString() + "%";
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void 
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO hide loader
			
			for each ( var soundNode:XML in xml.assets.sounds.children() )
			{
				bulkLoader.add( 'http://www.reengo.com/rgb/static/ghost-notes/assets/sfx/' + soundNode, { id: soundNode.name() } );				
			}			
			bulkLoader.addEventListener( BulkLoader.COMPLETE, startup, false, 0, true );
			bulkLoader.addEventListener( BulkLoader.PROGRESS, progress);
			bulkLoader.start();
		}
		
		private function startup(e:ProgressEvent):void
		{
  
			for each ( var soundNode:XML in xml.assets.sounds.children() )
			{
				SoundEffects.sound[ soundNode.name() ] = bulkLoader.getSound( soundNode.name() );
			}
			
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass(xml) as DisplayObject);
		}
		
	}
	
}