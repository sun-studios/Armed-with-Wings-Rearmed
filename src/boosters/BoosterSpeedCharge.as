package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterSpeedCharge extends Booster
	{
		
		public var gainSpeed:Number;
		
		private var cache0:Number;
		private var cache1:Number;
		
		public function BoosterSpeedCharge(_boosterManager:PlayerBoosterManager) 
		{
			cache0 = 0;
			cache1 = 0;
			
			super(_boosterManager);
			gainSpeed = hero.powerStrikeChargeSpeed;
		}
		
		override public function update ():void {
			switch (hero.heroName) {
				case "LONEWARRIOR":
					if (hero.currentFrameLabel == "attack" && hero.attack.charging) {
						if (hero.powerStrike < hero.powerStrikeMax) {
							hero.powerStrike += (gainSpeed*.75);
						}
					}
					break;
				case "VANDHEER":
					if (gameData.dataIsGearEquipt(gameData.data_gear2_name, playerID)) {
						if (cache0 == 0) {
							cache0 = hero.iceSpikeDpawnOrig;
							hero.iceSpikeSpawnOrig *= .6;
						}
						if (cache1 == 0) {
							cache1 = hero.iceSpikeDpawn2Orig;
							hero.iceSpikeSpawn2Orig *= .6;
						}
					}
					break;
			}
		}
		
		override public function kill ():void {
			//dosnet need skill scripts
		}
	}

}