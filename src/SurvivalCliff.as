package  {

	import flash.display.MovieClip;
	
	public class SurvivalCliff extends Survival {

		public function SurvivalCliff() {
			// constructor code
			trace("--||SURVIVAL THE CLIFF||--");
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
							enemyID = "ENEMY5";
							if (i%3 == 0) enemyID = "ENEMY4";
						} else {
							enemyID = "ENEMY5";
							if (i%2 == 0) enemyID = "ENEMY3";
							if (i%3 == 0) enemyID = "ENEMY4";
						}
						
					} else {
						//wind Off
						if (survivalObj.currentWave < 4) {
							enemyID = "ENEMY4";
							if (i%3 == 0) enemyID = "ENEMY5";
						} else {
							enemyID = "ENEMY1";
							if (i%2 == 0) enemyID = "ENEMY4";
							if (i%3 == 0) enemyID = "ENEMY6";
						}
					}
					/*
					//defult
					if (survivalObj.currentWave%3 == 0) enemyID = "ENEMY5";
					else enemyID = "ENEMY4";
					
					//progressive
					if (survivalObj.currentWave >= 3) {
						if (i%5 == 0) enemyID = "ENEMY5";
					}
					if (survivalObj.currentWave >= 6) {
						if (i%5 == 0) enemyID = "ENEMY6";
						if (i%6 == 0) enemyID = "ENEMY5";
					}
					if (survivalObj.currentWave >= 9) {
						if (i%4 == 0) enemyID = "ENEMY6";
						if (i%5 == 0) enemyID = "ENEMY5";
					}
					if (survivalObj.currentWave >= 12) {
						if (i%3 == 0) enemyID = "ENEMY5";
						if (i%5 == 0) enemyID = "ENEMY6";
					}
					*/
					
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
