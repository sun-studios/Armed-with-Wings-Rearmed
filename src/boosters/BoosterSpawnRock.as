package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterSpawnRock extends Booster
	{
		
		public function BoosterSpawnRock(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			this.eagleAction = true;
		}
		
		override public function update ():void {
			super.update();
		}
		
		override public function boosterAction():void {
			if (hero.moveable && hero.active) {
				if (gameData.boosterInputByName("Handy Rock", playerID)) {
					if (boosterManager.canUse("Handy Rock")) {
						hero.particles.addRock2(hero.x+(20*hero.scaleX), hero.y-(hero.bound.height*.5), 7*hero.scaleX, 12, 1);
					}
				}
			}
		}
		
		override public function eagleBoosterAction():void {
			if (gameData.boosterInputByName("Handy Rock", playerID)) {
				if (boosterManager.canUse("Handy Rock")) {
					hero.particles.addRock2(eagle.x+(20*eagle.scaleX), eagle.y-(eagle.bound.height*.5), 7*eagle.scaleX, 12, 1);
				}
			}
		}
	}
}