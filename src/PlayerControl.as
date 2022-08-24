package 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import utils.GamePad;
	import utils.BM_keys;
	import flash.ui.GameInputDevice;
	
	public class PlayerControl extends MovieClip
	{
		public var keys:BM_keys;
		public var gamePad:GamePad;
		public var loaded:Boolean;
		public var device:GameInputDevice;
		public var id:int;
		public var stageRef:Stage;
		public var _enabled:Boolean;
		
		public var ctrl_quit:Boolean;
		public var ctrl_pause:Boolean;
		public var ctrl_confirm:Boolean;
		public var ctrl_confirmStart:Boolean;
		public var ctrl_start:Boolean;
		public var ctrl_cancel:Boolean;
		public var ctrl_left:Boolean;
		public var ctrl_right:Boolean;
		public var ctrl_up:Boolean;
		public var ctrl_down:Boolean;
		public var ctrl_jump:Boolean;
		public var ctrl_char_attack:Boolean;
		public var ctrl_char_attackPower:Boolean;
		public var ctrl_char_booster1:Boolean;
		public var ctrl_char_booster2:Boolean;
		public var ctrl_char_block:Boolean;
		public var ctrl_char_swap:Boolean;
		public var ctrl_char_pickup:Boolean;
		public var ctrl_char_swapPickupLoot:Boolean;
		public var ctrl_eagle_hault:Boolean;
		public var ctrl_eagle_speed:Boolean;
		public var ctrl_debug_skipF:Boolean;
		public var ctrl_debug_skipB:Boolean;
		public var ctrl_debug_fly:Boolean;
		public var ctrl_angle:Number;
		public var ctrl_pressure:Number;
		public var ctrl_YPressure:Number;
		
		public var keyInput_quit:int;
		public var keyInput_pause:int;
		public var keyInput_confirm:int;
		public var keyInput_start:int;
		public var keyInput_cancel:int;
		public var keyInput_left:int;
		public var keyInput_right:int;
		public var keyInput_up:int;
		public var keyInput_down:int;
		public var keyInput_char_jump:int;
		public var keyInput_char_attack:int;
		public var keyInput_char_attackPower:int;
		public var keyInput_char_booster1:int;
		public var keyInput_char_booster2:int;
		public var keyInput_char_block:int;
		public var keyInput_char_swap:int;
		public var keyInput_char_pickup:int;
		public var keyInput_char_swapPickupLoot:int;
		public var keyInput_eagle_hault:int;
		public var keyInput_eagle_speed:int;
		
		private var keyboardEnabled:Boolean;
		
		public function PlayerControl (_id:int, _stage:Stage, _device:GameInputDevice, _keyboardEnabled:Boolean = true):void {
			id = _id;
			_enabled = true;
			stageRef = _stage;
			keyboardEnabled = _keyboardEnabled;
			if (stageRef == null) {
				stageRef = MovieClip(root).stage;
			}
			device = _device;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			keys = new BM_keys(stageRef);
			if (keyboardEnabled) keys.enabled = true;
			gamePad = new GamePad(id, device);
			applyDefaults();
			loaded = true;
			
		}
		
		public function applyDefaults():void {
			keyInput_quit = 81;
			keyInput_pause = 27;
			keyInput_confirm = 65;
			keyInput_start = 13;
			keyInput_cancel = 83;
			keyInput_left = 37;
			keyInput_right = 39;
			keyInput_up = 38;
			keyInput_down = 40;
			keyInput_char_jump = 32;
			keyInput_char_attack = 65;
			keyInput_char_attackPower = 83;
			keyInput_char_booster1 = 81;
			keyInput_char_booster2 = 87;
			keyInput_char_block = 68;
			keyInput_char_swap = 9;
			keyInput_char_pickup = 65;
			keyInput_char_swapPickupLoot = 32;
			keyInput_eagle_hault = 68;
			keyInput_eagle_speed = 83;
		}
		public function applyP1Keys():void {
			keyInput_quit = 81;
			keyInput_pause = 27;
			keyInput_confirm = 88;
			keyInput_start = 88;
			keyInput_cancel = 67;
			keyInput_left = 65;
			keyInput_right = 68;
			keyInput_up = 87;
			keyInput_down = 83;
			keyInput_char_jump = 70;
			keyInput_char_attack = 88;
			keyInput_char_attackPower = 67;
			keyInput_char_booster1 = 70;
			keyInput_char_booster2 = 71;
			keyInput_char_block = 86;
			keyInput_char_swap = 9;
			keyInput_char_pickup = 88;
			keyInput_eagle_hault = 86;
			keyInput_eagle_speed = 67;
			
		}
		public function applyP2Keys():void {
			keyInput_quit = 81;
			keyInput_pause = 27;
			keyInput_confirm = 77;
			keyInput_start = 77;
			keyInput_cancel = 188;
			keyInput_left = 37;
			keyInput_right = 39;
			keyInput_up = 38;
			keyInput_down = 40;
			keyInput_char_jump = 76;
			keyInput_char_attack = 77;
			keyInput_char_attackPower = 188;
			keyInput_char_booster1 = 74;
			keyInput_char_booster2 = 75;
			keyInput_char_block = 190;
			keyInput_char_swap = 9;
			keyInput_char_pickup = 77;
			keyInput_eagle_hault = 190;
			keyInput_eagle_speed = 188;
		}
		
		public function disableInput():void {
			_enabled = false;
			ctrl_quit = false;
			ctrl_pause = false;
			ctrl_confirm = false;
			ctrl_confirmStart = false;
			ctrl_start = false;
			ctrl_cancel = false;
			ctrl_left = false;
			ctrl_right = false;
			ctrl_up = false;
			ctrl_down = false;
			ctrl_jump = false;
			ctrl_char_attack = false;
			ctrl_char_attackPower = false;
			ctrl_char_booster1 = false;
			ctrl_char_booster2 = false;
			ctrl_char_block = false;
			ctrl_char_swap = false;
			ctrl_char_pickup = false;
			ctrl_char_swapPickupLoot = false;
			ctrl_eagle_hault = false;
			ctrl_eagle_speed = false;
			ctrl_debug_skipF = false;
			ctrl_debug_skipB = false;
			ctrl_debug_fly = false;
		}
		public function enableInput():void {
			_enabled = true;
		}
		
		public function update():void {
			if (_enabled) {
				if (gamePad == null) {
					gamePad = new GamePad(0, null);
				}
				
				
				
				//Pause
				if (keys.isKeyDown(keyInput_pause) || gamePad.pad_start) {
					ctrl_pause = true;
				} else {
					ctrl_pause = false;
				}
				
				//Confirm
				if (keys.isKeyDown(keyInput_confirm) || gamePad.pad_A) {
					ctrl_confirm = true;
				} else {
					ctrl_confirm = false;
				}
				
				//Start
				if (keys.isKeyDown(keyInput_start) || gamePad.pad_start) {
					ctrl_start = true;
				} else {
					ctrl_start = false;
				}
				//ConfirmStart ctrl_confirmStart
				if (keys.isKeyDown(keyInput_start) || gamePad.pad_start || keys.isKeyDown(keyInput_confirm) || gamePad.pad_A) {
					ctrl_confirmStart = true;
				} else {
					ctrl_confirmStart = false;
				}
				
				//Cancel
				if (keys.isKeyDown(keyInput_cancel) || keys.isKeyDown(27) || keys.isKeyDown(8) || gamePad.pad_B) {
					ctrl_cancel = true;
				} else {
					ctrl_cancel = false;
				}
				
				//LEFT
				if (keys.isKeyDown(keyInput_left) || gamePad.pad_left) {
					ctrl_left = true;
				} else {
					ctrl_left = false;
				}
				
				//RIGHT
				if (keys.isKeyDown(keyInput_right) || gamePad.pad_right) {
					ctrl_right = true;
				} else {
					ctrl_right = false;
				}
				
				//UP
				if (keys.isKeyDown(keyInput_up) || gamePad.pad_up) {
					ctrl_up = true;
				} else {
					ctrl_up = false;
				}
				
				//DOWN
				if (keys.isKeyDown(keyInput_down) || gamePad.pad_down) {
					ctrl_down = true;
				} else {
					ctrl_down = false;
				}
				
				//JUMP
				if (keys.isKeyDown(keyInput_char_jump) || gamePad.pad_X) {
					ctrl_jump = true;
				} else {
					ctrl_jump = false;
				}
				
				//ATTACK
				if (keys.isKeyDown(keyInput_char_attack) || gamePad.pad_A) {
					ctrl_char_attack = true;
				} else {
					ctrl_char_attack = false;
				}
				
				//ATTACK POWER
				if (keys.isKeyDown(keyInput_char_attackPower) || gamePad.pad_B) {
					ctrl_char_attackPower = true;
				} else {
					ctrl_char_attackPower = false;
				}
				//BOOSTER 1
				if (keys.isKeyDown(keyInput_char_booster1) || gamePad.pad_X) {
					ctrl_char_booster1 = true;
				} else {
					ctrl_char_booster1 = false;
				}
				//BOOSTER 2
				if (keys.isKeyDown(keyInput_char_booster2) || gamePad.pad_Y) {
					ctrl_char_booster2 = true;
				} else {
					ctrl_char_booster2 = false;
				}
				
				//BLOCK
				if (keys.isKeyDown(keyInput_char_block) || gamePad.pad_RT) {
					ctrl_char_block = true;
				} else {
					ctrl_char_block = false;
				}
				
				//SWAP
				if (keys.isKeyDown(keyInput_char_swap) || gamePad.pad_LT) {
					ctrl_char_swap = true;
				} else {
					ctrl_char_swap = false;
				}
				
				//PICKUP
				if (keys.isKeyDown(keyInput_char_pickup) || gamePad.pad_A) {
					ctrl_char_pickup = true;
				} else {
					ctrl_char_pickup = false;
				}
				
				//LOOT PICKUP
				if (keys.isKeyDown(keyInput_char_swapPickupLoot) || gamePad.pad_LB || gamePad.pad_RB) {
					ctrl_char_swapPickupLoot = true;
				} else {
					ctrl_char_swapPickupLoot = false;
				}
				
				//hault
				if (keys.isKeyDown(keyInput_eagle_hault) || gamePad.pad_RT) {
					ctrl_eagle_hault = true;
				} else {
					ctrl_eagle_hault = false;
				}
				
				//EAGLE SPEED
				if (keys.isKeyDown(keyInput_eagle_speed) || gamePad.pad_B) {
					ctrl_eagle_speed = true;
				} else {
					ctrl_eagle_speed = false;
				}
				
				if (keys.isKeyDown(keyInput_quit)) {
					ctrl_quit = true;
				} else {
					ctrl_quit = false;
				}
				
				////////////////////////////////////////////////////////////////////////////
				//SKIP FORWARD LEVEL
				if (gamePad.pad_Y && gamePad.pad_RB || keys.isKeyDown(190)) {
					ctrl_debug_skipF = true;
				} else {
					ctrl_debug_skipF = false;
				}
				
				//SKIP BACK LEVEL
				if (gamePad.pad_Y && gamePad.pad_LB || keys.isKeyDown(188)) {
					ctrl_debug_skipB = true;
				} else {
					ctrl_debug_skipB = false;
				}
				if (gamePad.pad_LB) {
					ctrl_debug_fly = true;
				} else {
					ctrl_debug_fly = false;
				}
				
				
				
				
				//angle
				
				var X:Number = 0;
				var Y:Number = 0;
				ctrl_pressure = 0;
				var usingKeys:Boolean;
				if (ctrl_left || ctrl_right || ctrl_up || ctrl_down) usingKeys = true;
				if (ctrl_left) X = -1;
				if (ctrl_right) X = 1;
				if (ctrl_up) Y = 1;
				if (ctrl_down) Y = -1;
				
				var dx:Number = X - 0;
				var dy:Number = Y - 0;
				
				if (usingKeys) {
					ctrl_angle = Math.atan2(Y, X); 
					ctrl_pressure = 1;
					ctrl_YPressure = Y;
				} else {
					if (!gamePad.device) {
						
						usingKeys = true;
					}
					//ctrl_angle = gamePad.pad_StickAngle_Left;
					//ctrl_pressure = gamePad.pad_StickPressure_Left;
					//ctrl_YPressure = gamePad.pad_StickPressure_Y_Left;
				}
			}	
		}
	
		public function usingGamePad():Boolean {
			return gamePad.gamePadAttached;
		}
	}	
}

