package boosters
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterGravityHit extends Booster
	{
		
		private var enemiesArr:Array;
		private var slowHitTimer:Number;
		
		public function BoosterGravityHit(_boosterManager:PlayerBoosterManager)
		{
			super(_boosterManager);
			enemiesArr = new Array();
			slowHitTimer = 120;
		}
		
		override public function update():void
		{
			for (var i:int = 0; i < enemiesArr.length; i ++) {
				var enemy:MovieClip = enemiesArr[i][0];
				var timer:Number = enemiesArr[i][1];
				if (timer > 0) {
					if (enemy.hasOwnProperty("ySpeed")) {
						if (enemy.ySpeed < 0)
							enemy.ySpeed += .5;
						else enemy.ySpeed += .25;
					}
					
					enemiesArr[i][1] --;
				}
			}
		}
		
		override public function kill():void
		{
		
		}
		
		override public function damageEnemy(enemy:MovieClip):void
		{
			var go:Boolean = true;
			for (var i:int = 0; i < enemiesArr.length; i ++) {
				if (enemiesArr[i][0] == enemy) {
					go = false;
				}
			}
			if (go) {
				enemiesArr.push([enemy, slowHitTimer]);
			}
		}
		
	}
}