package boosters 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterProjectile extends Booster
	{
		
		public function BoosterProjectile(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			this.eagleAction = true;
		}
		
		override public function update ():void {
			super.update();
		}
		
		override public function boosterAction ():void {
			if (boosterManager.canUse("Projectile", false) && gameData.boosterInputByName("Projectile", playerID)) {
				shootProjectile();
			}
		}
		override public function eagleBoosterAction():void {
			if (boosterManager.canUse("Projectile", false) && gameData.boosterInputByName("Projectile", playerID)) {
				shootProjectile(eagle);
			}
		}
		
		private function shootProjectile(fromClip:MovieClip = null):void {
			if (!fromClip) fromClip = hero;
			if (boosterManager.canUse("Projectile")) {
				fromClip.particles.addBoom(fromClip.x+(30*hero.scaleX), fromClip.y-55, fromClip.scaleX, hero);
			}
		}
	}

}