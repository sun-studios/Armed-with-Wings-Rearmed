package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class AwarnessManager extends MovieClip
	{
		
		public var game:MovieClip;
		public var enemiesArr:Array;
		public var _root:MovieClip;
		public var particleLayer:MovieClip;
		
		public function AwarnessManager(_rootRef:MovieClip) 
		{
			_root = _rootRef;
		}
		
		public function update ():void {
			/*
			if (game == null) {
				game = _root.zoom.container;
				if (game) {
					game.addEventListener("LEVELSETUPCOMPLETE", refresh);
					enemiesArr = game.enemiesArr;
					particleLayer = game.particleLayer;
				}
			} else {
				
				for (var i:int = 0; i < enemiesArr.length; i ++) {
					var en:MovieClip = enemiesArr[i];
					
					if (en) {
						//rules
						if (en.life > 0 && !en.dead && (en.enemyType == "ENEMY1" || en.enemyType == "ENEMY2" || en.enemyType == "ENEMY6")) {
						///////////////////////////
							//hero in sight
							
							if (enemiesArr[i][0] == null) {
								if (en.aware) {
									addAwarnessToEnemy(en, false, 0, true);
									TweenMax.delayedCall(4, addAwarnessToEnemy, [en, true, 0, true], true);
									TweenMax.delayedCall(8, addAwarnessToEnemy, [en, true, 0, true], true);
									
									enemiesArr[i][0] = true;
								}
							}
							//eagle in sight
							if (enemiesArr[i][1] == null) {
								if (en.baware && !en.aware) {
									particleLayer.addAwarness(en, 1);
									TweenMax.delayedCall(4, addAwarnessToEnemy, [en, true, 1], true);
									TweenMax.delayedCall(8, addAwarnessToEnemy, [en, true, 1], true);
									
									enemiesArr[i][1] = true;
								}
							}
							
							//angry
							if (en.eagleAnger && en.baware && !en.findHero()) {
								if (Math.random() < .05) {
									if (Math.random() < .5) {
										var clip = particleLayer.addAwarness(en, 1);
										clip.alpha = .4;
									} else {
										clip = particleLayer.addAwarness(en, 0);
										clip.alpha = .4;
									}
								}
							}
						}
					}
				}
				
			}
			*/
			
		}
		
		private function addAwarnessToEnemy(enemy:MovieClip, fade:Boolean = false, id:Number = 0, follow:Boolean = false):void {
			/*
			var clip:MovieClip = particleLayer.addAwarness(enemy, id, follow);
			if (fade) {
				clip.alpha = .5;
			}
			*/
		}
		
		function refresh(e:Event):void {
			/*
			enemiesArr = game.enemiesArr;
			particleLayer = game.particleLayer;
			game = null;
			*/
		}
		
	}

}