package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterAttackLundge extends Booster
	{
		
		public function BoosterAttackLundge(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
		}
		
		override public function update ():void {
			hero.extraLundge = true;
		}
		
		override public function kill ():void {
			hero.extraLundge = false;
		}
	}

}