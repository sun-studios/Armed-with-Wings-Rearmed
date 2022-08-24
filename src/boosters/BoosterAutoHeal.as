package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterAutoHeal extends Booster
	{
		
		private var lifeRecoverCool:Number;
		private var lifeRecoverCoolOrig:Number;
		
		public function BoosterAutoHeal(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			
			lifeRecoverCool = 120;
			lifeRecoverCoolOrig = 120;
		}
		
		override public function update ():void {
			if (gameData.dataIsGearEquipt("Auto Heal", playerID)) {
				if (lifeRecoverCool > 0) {
					lifeRecoverCool --;
				} else {
					if (hero.life < hero.lifeOrig*.5 && hero.life > 0) {
						hero.life += .01;
					}
				}
			}
		}
		
		override public function takeDamage():void {
			lifeRecoverCool = lifeRecoverCoolOrig;
		}
	}

}