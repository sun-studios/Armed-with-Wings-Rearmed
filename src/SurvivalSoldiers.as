package  {
	
	import flash.display.MovieClip;
	
	public class SurvivalSoldiers extends Survival {
		
		public var bossArrOrder:Array;
		public var bossOrderIndex:Number;
		
		public function SurvivalSoldiers() {
			// constructor code
			trace("--||SURVIVAL SOLIDERS||--");
			doBoss = false;
		}
		
		override public function getEnemyWaveList(survivalObj:MovieClip):Array {
			if (survivalObj) {
				var arr:Array = new Array();
				for (var i:int = 0; i < survivalObj.numOfEnemiesInWave; i ++) {
					var enemyID:String;
					//defult
					enemyID = "ENEMY1";
					
				
					//progressive
					if (survivalObj.currentWave >= 3) {
						if (i%5 == 0) enemyID = "ENEMY6";
					}
					if (survivalObj.currentWave >= 6) {
						if (i%5 == 0) enemyID = "ENEMY2";
						if (i%6 == 0) enemyID = "ENEMY6";
					}
					if (survivalObj.currentWave >= 9) {
						if (i%4 == 0) enemyID = "ENEMY2";
						if (i%5 == 0) enemyID = "ENEMY6";
					}
					if (survivalObj.currentWave >= 12) {
						if (i%3 == 0) enemyID = "ENEMY2";
						if (i%5 == 0) enemyID = "ENEMY6";
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
