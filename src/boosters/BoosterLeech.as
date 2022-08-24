package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterLeech extends Booster
	{
		
		public function BoosterLeech(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			//functionality is en the enemies takedamage() method
		}
		
		override public function update ():void {
			if (gameData.dataIsGearEquipt("Leech", playerID)) {
				
			}
		}
	}

}