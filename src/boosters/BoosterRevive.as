package boosters 
{
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterRevive extends Booster
	{
		
		public var overDriveTime:Number;
		public var overDriveIndex:Number;
		public var overdrive:Boolean;
		public var firstDeath:Boolean;
		public var reviving:Boolean;
		
		public function BoosterRevive(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			
			overDriveTime = 400;//10 seconds
			overDriveIndex = 0;
		}
		
		override public function update ():void {
			if (hero.active && hero.life > 0) {
				if (overdrive || hero.currentFrameLabel == "revive") hero.smokeType = 1;
				else hero.smokeType = 0;
				
				handleOverDive();
			}
			
			if (hero.currentFrameLabel == "death2") {
				if (hero.death2.currentFrameLabel == "startRevive") {
					startRevive();
				}
			}
			
			if (hero.currentFrameLabel == "revive") {
				if (hero.revive.currentFrameLabel == "endRevive") {
					endRevive();
				}
			}
		}
		
		public function startRevive():void {
			var go:Boolean = true;
			if (gameData.gameMode == "MULTIPLAYER") {
				if (gameData.dataIsGearEquipt(gameData.data_gear10_name, playerID)) {
					if (firstDeath) 
						go = false;
				} else {
					go = false;
				}
			}
			
			if (go) {
				hero.reviving = reviving = true;
				
				var lightning:MovieClip = new ReviveLightning();
				var lightningBG:MovieClip = new ReviveLightningBG();
				hero.game.addChildAt(lightning, hero.game.getChildIndex(hero) +1);
				hero.game.addChildAt(lightningBG, hero.game.getChildIndex(hero.game.ground));
				
				lightning.x = hero.x; lightning.y = hero.y;
				lightningBG.x = hero.x; lightningBG.y = hero.y;
				
				sndCtrl.playSound(sndCtrl.sndThunder3);
				sndCtrl.playSound(sndCtrl.sndThunder2, 0, .6);
				vcam.shakeCamera(40);
				vcam.zoom = 1; 
				vcam.slowZoom = false;
				
				sndCtrl.musicChannel.stop();
				sndCtrl.playMusic(sndCtrl.currentMusic, true);
				
				TweenMax.delayedCall(35, function () { hero.gotoAndStop("revive");  vcam.shakeCamera(40); }, null, true);
				
				hero.life = .01;	
				TweenMax.to(hero, 3, {life:hero.lifeOrig*.3});
			} else {
				
			}
		}

		function endRevive():void {
			overDriveIndex = overDriveTime;
			
			//appy hack stats
			if (hero.maxMoveSpeed < 10) {
				hero.maxMoveSpeed = 10;
				hero.maxMoveSpeedDefault = hero.maxMoveSpeed;
			}
			hero.powerStrikeChargeSpeed = 2;
			
			if (hero.attackSpeed < 8) hero.attackSpeed = 8;
			trace("apply super stats");
			hero.moveable = true;
			hero.active = true;
			hero.overdrive = overdrive = true;
			hero.firstDeath = firstDeath = true;
			hero.reviving = reviving = false;
			hero.dead = false;
			hero.dispatchEvent(new Event("REVIVECOMPLETE"));
		}
		
		function handleOverDive():void {
			if (overDriveIndex > 0) {
				overDriveIndex --;
				
				if (overdrive) {
					if (vcam.cameraShake < 10) vcam.cameraShake = 10;
				}
			} else {
				if (overdrive) {
					hero.applyItemStats();
					trace("stats restored");
					overdrive = false;
					hero.overdrive = false;
				}
			}
		}
		
	}

}