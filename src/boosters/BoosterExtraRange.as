package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterExtraRange extends Booster
	{
		
		public var boosterRange:Number;
		
		public function BoosterExtraRange(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			//boosterRange = .5;
			boosterRange = .5;
		}
		
		override public function update ():void {
			hero.extraRange = boosterRange;
		}
		override public function kill ():void {
			hero.extraRange = 0;
		}
	}

}