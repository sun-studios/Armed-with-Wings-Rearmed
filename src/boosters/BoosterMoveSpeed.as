package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterMoveSpeed extends Booster
	{
		
		private var cacheMoveSpeed:Number;
		private var cacheSpeed:Number;
		
		public function BoosterMoveSpeed(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			cacheMoveSpeed = hero.maxMoveSpeed;
			cacheSpeed = hero.speed;
			
			hero.maxMoveSpeed = hero.maxMoveSpeedDefault = cacheMoveSpeed + 4;
			hero.speed = cacheSpeed + .5;
		}
		
		override public function update ():void {
			
		}
		override public function kill ():void {
			hero.maxMoveSpeed = hero.maxMoveSpeedDefault = cacheMoveSpeed ;
			hero.speed = cacheSpeed;
		}
	}

}