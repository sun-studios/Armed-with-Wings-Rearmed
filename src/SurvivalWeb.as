package  {
	
	import flash.display.MovieClip;
	
	public class SurvivalWeb extends Survival {
		
		public var bossArrOrder:Array;
		public var bossOrderIndex:Number;
		
		public function SurvivalWeb() {
			// constructor code
			trace("--||SURVIVAL WEB||--");
			doBoss = true;
			bossWaveCount = 4;
			startBossAfterWave = 0;
			
			bossArrOrder = new Array();
			bossArrOrder = ["BOSS2"];
			bossOrderIndex = 0;
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
						if (i%5 == 0) enemyID = "ENEMY2";
					}
					if (survivalObj.currentWave == 4) {
						enemyID = "ENEMY1";
					}
					if (survivalObj.currentWave >= 6) {
						if (i%4 == 0) enemyID = "ENEMY2";
					}
					if (survivalObj.currentWave >= 9) {
						if (i%5 == 0) enemyID = "ENEMY2";
						if (i%6 == 0) enemyID = "ENEMY5";
					}
					if (survivalObj.currentWave >= 12) {
						if (i%2 == 0) enemyID = "ENEMY5";
						
					}
					if (survivalObj.currentWave >= 15) {
						if (i%4 == 0) enemyID = "ENEMY5";
						if (i%2 == 0) enemyID = "ENEMY2";
					}
					if (survivalObj.currentWave >= 18) {
						if (i%3 == 0) enemyID = "ENEMY2";
						if (i%2 == 0) enemyID = "ENEMY6";
						if (i%4 == 0) enemyID = "ENEMY5";
					}
					
					trace(i + ". "+enemyID);
					arr.push([enemyID, true]);
					
				}
				return arr;
			} else {
				return null;
			}
		}
		override public function getBossWaveList(survivalObj:MovieClip):Array {
			trace("EVA");
			if (survivalObj) {
				trace("GREYNA");
				var arr:Array = new Array();
				
				var bossID:String = "BOSS2";
			
				if (survivalObj.currentWave % 8 == 0) { 
					bossID = "BOSS2";
				}
			
				//spawn 2 bosses at once after 2 boss waves
				if (survivalObj.currentWave > survivalObj.bossWaveCount*2)
					arr.push([bossID, true]);
				//repick fewer for boss round
				survivalObj._pickEnemies(true);
				
				return arr;
			} else {
				return null;
			}
		}
	}
	
}
