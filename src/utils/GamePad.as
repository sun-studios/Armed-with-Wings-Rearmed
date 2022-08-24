package utils {
	
	import flash.ui.GameInput;
	import flash.ui.GameInputControl;
	import flash.ui.GameInputDevice;
	import flash.events.GameInputEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class GamePad extends MovieClip {

		public var gameInput:GameInput;
		public var device:GameInputDevice;
		public var gamePadAttached:Boolean;
		public var id:int;
		
		//gamepad input
		public var pad_left:Boolean = false;
		public var pad_right:Boolean = false;
		public var pad_up:Boolean = false;
		public var pad_down:Boolean = false;
		public var pad_A:Boolean = false;
		public var pad_B:Boolean = false;
		public var pad_X:Boolean = false;
		public var pad_Y:Boolean = false;
		public var pad_start:Boolean = false;
		public var pad_LB:Boolean = false;
		public var pad_RB:Boolean = false;
		public var pad_LT:Boolean = false;
		public var pad_RT:Boolean = false;
		
		public var pad_StickAngle_Left:Number;
		public var pad_StickPressure_Left:Number;
		public var pad_StickPressure_Y_Left:Number;
		
		public var ps3TestArray:Array = new Array();
		
		
		public function GamePad(_id:int = 0, _device:GameInputDevice = null) {
			id = _id;
			//gamePadAttached = false;
			//gameInput = new GameInput();
			//gameInput.addEventListener(GameInputEvent.DEVICE_ADDED, onDeviceAdded);
			//gameInput.addEventListener(GameInputEvent.DEVICE_REMOVED, onDeviceRemoved);
			if (_device != null) {
				insertDevice(_device);
			}
		}
		
		public function insertDevice(_device:GameInputDevice):void {
			device = _device;
			if (!hasEventListener(Event.ENTER_FRAME)) {
				addEventListener(Event.ENTER_FRAME, update);
				trace("Gamepad inserted, EnterFrame engadged.");
			}
		}
		public function pullDevice():void {
			device = null;
			removeEventListener(Event.ENTER_FRAME, update);
			trace("Gamepad removed");
		}
		//private function onDeviceAdded(e:GameInputEvent):void {
			//if (GameInput.numDevices >0) {
				//gamePadAttached = true;
				//device = GameInput.getDeviceAt(0);
				//device.enabled = true;
				
			//}
		//}
		
		//private function onDeviceRemoved(e:GameInputEvent):void {
			
		//}
		
		private function update(e:Event):void {
			if (device) {
				
				var X:Number = Math.round(device.getControlAt(0).value*100) / 100;
				var Y:Number = Math.round(device.getControlAt(1).value * 100) / 100;
				if (Math.abs(device.getControlAt(0).value) < .2) X = 0;
				if (Math.abs(device.getControlAt(1).value) < .2) Y = 0;
				
				pad_StickAngle_Left = getAngle(0, 0, X, Y);
				pad_StickPressure_Left = distanceTwoPoints(0, device.getControlAt(0).value, 0, device.getControlAt(1).value);
				pad_StickPressure_Y_Left = Y;
				//trace("X: "+X+"; Y: "+Y+"; Angle: "+pad_StickAngle_Left*180/Math.PI);
				
				//left/right with dpad and joystick
				if (device.getControlAt(0).value > .5 || device.getControlAt(19).value == 1) {
					pad_right = true;
					pad_left = false;
				} else {
					if (device.getControlAt(0).value < -.5  || device.getControlAt(18).value == 1) {
						pad_right = false;
						pad_left = true;
					} else {
						pad_right = false;
						pad_left = false;
					}
				}
				
				//up/down with dpad and joystick
				if (device.getControlAt(1).value > .5 || device.getControlAt(16).value == 1) {
					pad_up = true;
					pad_down = false;
				} else {
					if (device.getControlAt(1).value < -.5  || device.getControlAt(17).value == 1) {
						pad_up = false;
						pad_down = true;
					} else {
						pad_up = false;
						pad_down = false;
					}
				}
				
				//A button
				if (device.getControlAt(4).value == 1) {
					pad_A = true;
				} else {
					pad_A = false;
				}
				//B button
				if (device.getControlAt(5).value == 1) {
					pad_B = true;
				} else {
					pad_B = false;
				}
				
				//X button
				if (device.getControlAt(6).value == 1) {
					pad_X = true;
				} else {
					pad_X = false;
				}
				
				//Y button
				if (device.getControlAt(7).value == 1) {
					pad_Y = true;
				} else {
					pad_Y = false;
				}
				
				//Left Trigger
				if (device.getControlAt(10).value == 1) {
					pad_LT = true;
				} else {
					pad_LT = false;
				}
				
				//Right Trigger
				if (device.getControlAt(11).value == 1) {
					pad_RT = true;
				} else {
					pad_RT = false;
				}
				
				//Left Bumper
				if (device.getControlAt(8).value == 1) {
					pad_LB = true;
				} else {
					pad_LB = false;
				}
				
				//Right Bumper
				if (device.getControlAt(9).value == 1) {
					pad_RB = true;
				} else {
					pad_RB = false;
				}
				
				//start button
				if (device.getControlAt(13).value == 1) {
					pad_start = true;
				} else {
					pad_start = false;
				}
			}
		}
		
		private function getAngle (x1:Number, y1:Number, x2:Number, y2:Number):Number {
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.atan2(dy,dx);
		}
		
		private function distanceTwoPoints(x1:Number, x2:Number,  y1:Number, y2:Number):Number {
			var dx:Number = x1-x2;
			var dy:Number = y1-y2;
			return Math.sqrt(dx * dx + dy * dy);
		}
	}
}
