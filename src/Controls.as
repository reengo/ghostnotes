package  {	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class Controls extends MovieClip
	{
			
		[Embed(source = '../lib/GhostNotesAssets.swf', symbol = 'Fret')]
		private var Fret:Class;		
		private var fret:Sprite = new Fret;
		private var eString:Sprite = Fret['eString'];
		private var aString:Sprite = Fret['aString'];
		private var dString:Sprite = Fret['dString'];
		private var gString:Sprite = Fret['gString'];
		
		private var _xml:XML;
				
		public function Controls(xml:XML) 
		{
			_xml = xml;
			
			for each ( var soundNode:XML in _xml.assets.sounds.children() )
			{
				this.addEventListener( MouseEvent.CLICK, playNote );	
				trace(this.name);
			}		
			
			addChild( fret );
		}
		
		public function playNote(e:MouseEvent):void
		{			
			var note:String = "";	
			var key:String = "";
			var openString:String = e.target.name.substr(0,1);
			var strings:Array = [eString, aString, dString, gString];
			
			if(e.ctrlKey == true)
			{
				Actions.playSound( e.target.name );
				note = Notes.getNoteName(e.target.name);
				Main.note.text = note;
			}else{					
				switch( openString )
				{
					case "e": key = "e"; note = "E";break;
					case "a": key = "a"; note = "A";break;
					case "d": key = "d"; note = "D";break;
					case "g": key = "g"; note = "G2";break;
				}				
				Actions.playSound( key );
			}
			//animate string
			switch( openString )
			{
				case "e": Actions.pullStrings(eString, note);break;
				case "a": Actions.pullStrings(aString, note);break;
				case "d": Actions.pullStrings(dString, note);break;
				case "g": Actions.pullStrings(gString, note);break;
			}
			//actions.showNote(note); 		
			
			//hit ghost
			//trace(ghost);
			//for(var i:uint = 0; i <= Actions.ghosts.length-1; i++)
			//{
			//trace(Ghost[key]);
			//if (note == Ghost[key].note){					
			//	Actions.hitGhost( Ghost[key].note );
			//	trace(Ghost[key].note);
				//this.parent.removeChild(Actions.ghosts[i]);										
			//}
			//}	
			//if ( note == GhostNotes.spectre[note].name )
			//{
				//trace(GhostNotes.spectre[note].name);
				//ghostNotes.erase(note);
			//}
		}		
	}
	
}
