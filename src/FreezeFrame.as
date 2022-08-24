package  {
	
	import flash.events.Event;
	import flash.display.MovieClip;
	import com.greensock.TweenMax;
	
	public class FreezeFrame {
		
		public var game:MovieClip;
		public var hero:MovieClip;
				
		private var freezeIndex:int;
		private var freezeIndexOrig:int;
		
		private var autoUnfreeze:Boolean;
		private var deathFreezeInProgress:Boolean;
		
		public function FreezeFrame() {
			// constructor code
			freezeIndex = 0;
			freezeIndexOrig = 0;
		}
		
		public function init (_game:MovieClip, _hero:MovieClip):void {
			game = _game;
			hero = _hero;
	
			hero.addEventListener("DEATHFREEZE", deathFreeze, false, 0, true);
			hero.addEventListener("DEATHFREEZEEND", deathFreezeEnd, false, 0, true);
			
			
			if (game.hero_p2) {
				game.hero_p2.addEventListener("DEATHFREEZE", deathFreeze, false, 0, true);
				game.hero_p2.addEventListener("DEATHFREEZEEND", deathFreezeEnd, false, 0, true);
			}
		}
		
		
		public function update ():void {
			if (freezeIndex > 0) {
				freezeIndex --;
			} else {
				
			}
		}
		
		public function deathFreeze(e:Event):void {
			freezeIndex = 300;
			deathFreezeInProgress = true;
			
			if (game) {
				for (var i:int = 0; i < game.enemiesArr.length; i ++) {
					var en:MovieClip = game.enemiesArr[i];
					if (en) {
						if (en[en.currentFrameLabel] && en.life > 0) {
							en[en.currentFrameLabel].stop();
						}
					}
				}
				
			}
		}
		
		public function deathFreezeEnd(e:Event):void {
			freezeIndex = 0;
			
			if (game) {
				
				for (var i:int = 0; i < game.enemiesArr.length; i ++) {
					var en:MovieClip = game.enemiesArr[i];
					if (en) {
						if (en[en.currentFrameLabel] && en.life > 0) {
							en[en.currentFrameLabel].play();
						}
					}
				}
				
			}
			deathFreezeInProgress = false;
		}
		
		public function attackFreeze(duration:Number = 10):void {
			if (!deathFreezeInProgress) {
				freezeIndex = duration;
				
				if (game) {
					for (var i:int = 0; i < game.enemiesArr.length; i ++) {
						var en:MovieClip = game.enemiesArr[i];
						if (en) {
							if (en[en.currentFrameLabel] && en.life > 0) {
								en[en.currentFrameLabel].stop();
							}
						}
					}
					if (game.hero[game.hero.currentFrameLabel]) {
						game.hero[game.hero.currentFrameLabel].stop();
					}
					
					game.vcam.shakeCamera(20);
					game.vcam.zoom = .8;
				}
				
				TweenMax.delayedCall(duration, attackFreezeEnd, null, true);
			}
		}
		public function attackFreezeEnd():void {
			if (!deathFreezeInProgress) {
				freezeIndex = 0;
				if (game) {
					
					for (var i:int = 0; i < game.enemiesArr.length; i ++) {
						var en:MovieClip = game.enemiesArr[i];
						if (en) {
							if (en[en.currentFrameLabel] && en.life > 0) {
								en[en.currentFrameLabel].play();
							}
						}
					}
					if (game.hero[game.hero.currentFrameLabel]) {
						game.hero[game.hero.currentFrameLabel].play();
					}
					game.vcam.zoom = 1;
				}
			}
		}
		
		public function freezeOn():Boolean {
			if (freezeIndex > 0) return true;
			return false;
		}
	}
	
}
