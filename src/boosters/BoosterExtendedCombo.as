package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 * Extended combo functionality is embeded in the Hero timeline code
	 */
	public class BoosterExtendedCombo extends Booster
	{
		
		
		
		public function BoosterExtendedCombo(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
		}
		
		override public function update ():void {
			if (gameData.dataIsGearEquipt("Extended Combo", playerID)) {
				hero.extraAttacks = true;
			}
		}
		
		override public function kill ():void {
			hero.extraAttacks = false;
		}
		
	}

}