package utils {
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	public class BM_keys
	{
		public var _stage:Stage;
		public var enabled:Boolean;
		public var keyArray:Array = new Array();
		
		public function BM_keys (passStage:Stage) 
		{
			enabled = true;
			_stage = passStage;
			for (var i:Number = 0; i < 222; i++) {
				keyArray.push([i, false]);
			}
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, keysDown, false, 0, true);
			_stage.addEventListener(KeyboardEvent.KEY_UP, keysUp, false, 0, true);
			_stage.addEventListener(Event.DEACTIVATE, isNotActive, false, 0, true);
			
		}
		public function keysDown (e:KeyboardEvent) {
			keyArray[e.keyCode][1] = true;
			if (e.keyCode == 27) e.preventDefault();
		}
		public function keysUp (e:KeyboardEvent) {
			keyArray[e.keyCode][1] = false;
		}
		public function isKeyDown(X:Number) {
			if (enabled) {
				return keyArray[X][1];
			} else {
				return false;
			}
		}
		private function isNotActive(e:Event):void {
			for (var i:int = 0; i < keyArray.length; i ++) {
				if (keyArray[i][1]) keyArray[i][1] = false; 
			}
		}
	}
}