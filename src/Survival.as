package  {
	import flash.display.MovieClip;
	
	public class Survival extends MovieClip {
		
		public var doBoss:Boolean;
		public var bossWaveCount:int;
		public var startBossAfterWave:int;
		public var spawnTimerDefult:Number;

		public function Survival() {
			// constructor code
			spawnTimerDefult = 200;
		}
		
		public function getEnemyWaveList(survivalObj:MovieClip):Array {
			return new Array();
		}
		
		public function getBossWaveList(survivalObj:MovieClip):Array {
			return new Array();
		}

	}
	
}
