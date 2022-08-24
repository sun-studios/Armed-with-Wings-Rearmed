package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterAntiFlinch extends Booster
	{
		
		public function BoosterAntiFlinch(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
		}
		
		override public function update ():void {
			if (gameData.dataIsGearEquipt(gameData.data_gear6_name, playerID)) {
				hero.canAntiFlinchFORCE = true;
			} else {
				
			}
		}
		
		override public function kill ():void {
			hero.canAntiFlinchFORCE = false;
			trace("Kill Anti Flinch");
		}
	}

}