package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterFloat extends Booster 
	{
		
		public function BoosterFloat(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
		}
		
		override public function update ():void {
			if (hero.currentFrameLabel != "hurt" && gameData.dataIsGearEquipt("Floaty", playerID)) {
				if (hero.currentFrameLabel == "attack") {
					if (hero.ySpeed < -4) {
						hero.ySpeed += .5;
					}
				} else {
					if (hero.currentFrameLabel != "climb") {
						if (hero.ySpeed < 2) {
							hero.ySpeed += .5;
						}
					}
				}
			}
			
		}
		
	}

}