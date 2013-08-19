package  {	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class SoundEffects extends Sound
	{
		private var _xml:XML = Preloader.xml;
		public static var sound:Object = new Object();
		public static var channel:SoundChannel = new SoundChannel();
		
		public function SoundEffects() 
		{
			// constructor code
		}
	}
}
