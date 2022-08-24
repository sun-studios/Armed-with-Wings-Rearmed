package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class Physics
	{
		
		public function Physics() 
		{
			
		}
		
		public static function getGlobalX(_root:MovieClip, _parent:MovieClip, obj:MovieClip, offset:Number = 0):Number {
			return (obj.x *(_root.zoom.scaleX)+(_root.gameWidth*.5) + _parent.x *(_root.zoom.scaleX) + (offset * _root.zoom.scaleX))*_root.scaleFactor;
		}

		public static function getGlobalY(_root:MovieClip, _parent:MovieClip, obj:MovieClip, offset:Number = 0):Number {
			return (obj.y*(_root.zoom.scaleX)+(_root.gameHeight*.5)  + _parent.y *(_root.zoom.scaleX) + (offset * _root.zoom.scaleX))*_root.scaleFactor;
		}
		
	}

}