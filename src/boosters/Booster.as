package boosters 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class Booster
	{
		
		public var boosterManager:PlayerBoosterManager;
		public var gameData:MovieClip;
		public var hero:MovieClip;
		public var eagle:MovieClip;
		public var playerID:Number;
		public var ctrl:PlayerControl;
		public var game:MovieClip;
		public var sndCtrl:MovieClip;
		public var vcam:MovieClip;
		public var ground:MovieClip;
		public var particleLayer:MovieClip;
		public var boosterID:int;
		public var eagleAction:Boolean;
		
		private var keyFilter0:Boolean;
		
		public function Booster(_boosterManager:PlayerBoosterManager) 
		{
			boosterManager = _boosterManager;
			
			gameData = boosterManager.gameData;
			hero = boosterManager.hero;
			eagle = boosterManager.hero.eagle;
			playerID = boosterManager.playerID;
			ctrl = boosterManager.ctrl;
			game = hero.game;
			sndCtrl = hero.sndCtrl;
			vcam = hero.vcam;
			ground = game.ground;
			particleLayer = game.particleLayer;
			
		}
		
		public function update ():void {
			boosterInput();
		}
		
		public function takeDamage ():void {
			
		}
		
		public function damageEnemy(enemy:MovieClip):void {
			
		}
		
		public function boosterInput():void {
			var go:Boolean = false;
			if ((ctrl.ctrl_char_booster1 && boosterID == 0) || (ctrl.ctrl_char_booster2 && boosterID == 1)) {
				go = true;
			}
			
			if (hero.moveable) {
				if (go && hero.currentFrameLabel != "hurt") {
					if (!keyFilter0) {
						boosterAction();
						keyFilter0 = true;
					}
				} else {
					keyFilter0 = false;
				}
			} else if (eagle.moveable) {
				if (go) {
					if (!keyFilter0) {
						eagleBoosterAction();
						keyFilter0 = true;
					}
				} else {
					keyFilter0 = false;
				}

			}
		}
		
		public function boosterAction():void {
			
		}
		
		public function eagleBoosterAction():void {
			
		}
		
		public function kill():void {
			
		}
	}

}