package  {

	import flash.display.MovieClip;
	
	public class SurvivalTest extends Survival {

		public function SurvivalTest() {
			trace("--||SURVIVAL TEST||--");
			// constructor code
			doBoss = false;
		}

		override public function getEnemyWaveList(survivalObj:MovieClip):Array {
			if (survivalObj) {
				var arr:Array = new Array();
				for (var i:int = 0; i < survivalObj.numOfEnemiesInWave; i ++) {
					var enemyID:String;
					
					if (survivalObj.currentWave%2 == 0) {
						if (survivalObj.currentWave < 4) {
							//wind On
							enemyID = "ENEMY1";
							if (i%3 == 0) enemyID = "ENEMY1";
						} else {
							enemyID = "ENEMY1";
							if (i%2 == 0) enemyID = "ENEMY1";
							if (i%3 == 0) enemyID = "ENEMY1";
						}
						
					} else {
						//wind Off
						if (survivalObj.currentWave < 4) {
							enemyID = "ENEMY1";
							if (i%3 == 0) enemyID = "ENEMY1";
						} else {
							enemyID = "ENEMY1";
							if (i%2 == 0) enemyID = "ENEMY1";
							if (i%3 == 0) enemyID = "ENEMY1";
						}
					}
					
					trace(i + ". "+enemyID);
					arr.push([enemyID, true]);
					
				}
				return arr;
			} else {
				return null;
			}
		}
	}
	
}
