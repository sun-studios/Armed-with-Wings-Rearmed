package boosters 
{
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterFireBall extends Booster
	{
		
		public function BoosterFireBall(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			this.eagleAction = true;
		}
		
		override public function update ():void {
			super.update();
		}
		
		override public function boosterAction ():void {
			if (boosterManager.canUse("Fire Ball", false)) {
				shootProjectile();
			}
		}
		override public function eagleBoosterAction():void {
			if (boosterManager.canUse("Fire Ball", false)) {
				shootProjectile(eagle);
			}
		}
		
		private function shootProjectile(fromClip:MovieClip = null):void {
			if (!fromClip) fromClip = hero;
			if (boosterManager.canUse("Fire Ball")) {
				fromClip.particles.addBomb(fromClip.x + (30 * fromClip.scaleX), fromClip.y - 55, fromClip.scaleX, hero);				
			}
		}
		
		override public function kill ():void {
			
		}
		
	}

}