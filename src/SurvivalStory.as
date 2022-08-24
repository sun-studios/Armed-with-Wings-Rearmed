package  {
	
	import flash.display.MovieClip;
	
	public class SurvivalStory extends Survival {
		
		public var bossArrOrder:Array;
		public var bossOrderIndex:Number;
		
		public function SurvivalStory() {
			trace("--||SURVIVAL STORY #1||--");
			// constructor code
			doBoss = false;
			bossWaveCount = 4;
			startBossAfterWave = 1;
			spawnTimerDefult = 132;
			
			bossArrOrder = new Array();
			bossArrOrder = ["BOSS1", "BOSS2", "BOSS3", "BOSS4"];
			bossOrderIndex = 0;
		}
		
		override public function getEnemyWaveList(survivalObj:MovieClip):Array {
			if (survivalObj) {
				var arr:Array = new Array();
				for (var i:int = 0; i < survivalObj.numOfEnemiesInWave; i ++) {
					var enemyID:String;
					//defult
					enemyID = "ENEMY7";
					
					//progressive
					if (survivalObj.currentWave >= 0) {
						//if (i%5 == 0) enemyID = "ENEMY1";
					}
					if (survivalObj.currentWave >= 2) {
						//if (i%5 == 0) enemyID = "ENEMY6";
					}
					if (survivalObj.currentWave >= 3) {
						//if (i%5 == 0) enemyID = "ENEMY3";
						//if (i%5 == 0) enemyID = "ENEMY2";
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
			if (survivalObj) {
				var arr:Array = new Array();
				
				var bossID:String = "BOSS1";
			
				if (survivalObj.currentWave % 16 == 4) { 
					bossID = "BOSS1";
				}
				if (survivalObj.currentWave % 16 == 8) { 
					bossID = "BOSS3";
				}
				if (survivalObj.currentWave % 16 == 12) {
					bossID = "BOSS2";
				}
				if (survivalObj.currentWave % 16 == 0) {
					bossID = "BOSS4";
				}
				
				arr.push([bossID, true]);
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
