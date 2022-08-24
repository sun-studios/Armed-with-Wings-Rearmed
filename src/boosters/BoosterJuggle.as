package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterJuggle extends Booster
	{
		
		public function BoosterJuggle(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
		}
		
		override public function update ():void {
			hero.canJuggle = true;
		}
		
		override public function kill ():void {
			hero.canJuggle = false;
		}
		
	}

}