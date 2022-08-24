package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterDoubleHit extends Booster
	{
		
		public var doubleHitAmount:Number;
		
		public function BoosterDoubleHit(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			doubleHitAmount = .1;
		}
		
		override public function update ():void {
			hero.canDoubleHit = true;
			hero.doubleHitAmount = doubleHitAmount;
		}
		
		override public function kill ():void {
			hero.canDoubleHit = false;
		}
		
	}

}