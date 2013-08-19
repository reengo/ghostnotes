package  {
	import flash.display.Sprite;
	
	public class Notes 
	{

		public function Notes() 
		{
			// constructor code
		}
		public static function getNoteName( key:String ):String
		{
			var newKey:String;
			switch( key ){
				case "e": newKey = "E";break;
				case "ef": newKey = "F";break;
				case "efs": newKey = "F#";break;
				case "eg": newKey = "G";break;
				case "egs": newKey = "G#";break;
				case "ea": newKey = "A";break;
				case "ebb": newKey = "Bb";break;
				case "eb": newKey = "B";break;
				case "ec": newKey = "C";break;
				case "ecs": newKey = "C#";break;
				case "ed": newKey = "D";break;
				case "eds": newKey = "D#";break;
				case "ee": newKey = "E2";break;
				case "a": newKey = "A";break;
				case "abb": newKey = "Bb";break;
				case "ab": newKey = "B";break;
				case "ac": newKey = "C";break;
				case "acs": newKey = "C#";break;
				case "ad": newKey = "D";break;
				case "ads": newKey = "D#";break;
				case "ae": newKey = "E2";break;
				case "af": newKey = "F2";break;
				case "afs": newKey = "F#2";break;
				case "ag": newKey = "G2";break;
				case "ags": newKey = "G#2";break;
				case "aa": newKey = "A2";break;
				case "d": newKey = "D";break;
				case "dds": newKey = "D#";break;
				case "de": newKey = "E2";break;
				case "df": newKey = "F2";break;
				case "dfs": newKey = "F#2";break;
				case "dg": newKey = "G2";break;
				case "dgs": newKey = "G#2";break;
				case "da": newKey = "A2";break;
				case "dbb": newKey = "Bb2";break;
				case "db": newKey = "B2";break;
				case "dc": newKey = "C2";break;
				case "dcs": newKey = "C#2";break;
				case "dd": newKey = "D2";break;
				case "g": newKey = "G2";break;
				case "ggs": newKey = "G#2";break;
				case "ga": newKey = "A2";break;
				case "gbb": newKey = "Bb2";break;
				case "gb": newKey = "B2";break;
				case "gc": newKey = "C2";break;
				case "gcs": newKey = "C#2";break;
				case "gd": newKey = "D2";break;
				case "gds": newKey = "D#2";break;
				case "gee": newKey = "E2";break;
				case "gf": newKey = "F2";break;
				case "gfs": newKey = "F#2";break;
				case "gg": newKey = "G2";break;
			}
			return newKey;
		}

	}
	
}
