package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterPowerWave extends Booster
	{
		
		public function BoosterPowerWave(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
		}
		
		override public function update ():void {
			hero.canPowerWave = true;
			super.update();
		}
		
		override public function boosterAction ():void {
			if (boosterManager.canUse("Power Wave", false)) {
				if (hero.onGround && (hero.currentFrameLabel == "idle" || hero.currentFrameLabel == "walk" || hero.currentFrameLabel == "attack")) {
					if (hero.currentFrameLabel == "attack" && hero.attack.startAttack) {
						
					} else {
						shootPowerWave();
					}
				}
			}
		}
		
		override public function kill ():void {
			hero.canPowerWave = false;
		}
		
		public function shootPowerWave():void {
			if (boosterManager.canUse("Power Wave") && hero.currentFrameLabel != "hurt" && hero.life > 0) {
				hero.gotoAndStop("attack");
				hero.attack.gotoAndPlay("aPowerWave");
			}
		}
	}

}