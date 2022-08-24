package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class CameraDistCheck extends MovieClip 
	{
		
		public static var _root:MovieClip;
		
		public function CameraDistCheck(_rootRef:MovieClip) 
		{
			_root = _rootRef;
		}
		
		public static function inRange(obj:MovieClip, handleVisibility:Boolean = false, range:int = 1200):Boolean {
			var vcam:MovieClip; 
			if (_root.zoom != null) vcam = _root.zoom.container.vcam;
			
			if (vcam && obj) {
				var dist:Number = distanceBetween(vcam, obj);
				
				if (dist < range) {
					if (handleVisibility) obj.visible = true;
					return true;
				} else {
					if (handleVisibility) obj.visible = false;
					return false;
				}
			} else {
				return false;
			}
		}
		
		public static function inRangeEnemy(obj:MovieClip, range:int = 1200):Boolean {
			var vcam:MovieClip = _root.zoom.container.vcam;
			var dist:Number = distanceBetween(vcam, obj);
			
			if (obj.life == 0) {
				return true;
			} else {
				if (dist < range) {
					return true;
				} else {
					if (obj.dead || _root.gameMode == _root.SURVIVAL) return true;
					else return false;
				}
			}
		}
		
		
		public static function distanceBetween(obj1:MovieClip,  obj2:MovieClip):Number {
			var dx:Number = obj1.x-obj2.x;
			var dy:Number = obj1.y-obj2.y;
			return Math.sqrt(dx * dx + dy * dy);
		}
		
	}

}