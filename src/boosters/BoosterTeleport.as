package boosters 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterTeleport extends Booster
	{
		
		public var pointTarget:MovieClip;
		public var pointTarget2:MovieClip;
		
		public function BoosterTeleport(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			
			pointTarget = new PointTarget();
			hero.addChild(pointTarget);
			pointTarget.y = -hero.bound.height * .5;
			
			pointTarget2 = new PointTarget();
			eagle.addChild(pointTarget2);
			pointTarget2.y = -eagle.bound.height * .5;
		}
		
		override public function update ():void {
			super.update();
			if (hero.active && hero.moveable && hero.life > 0) {
				teleportControl();
			}
		}
		
		override public function boosterAction ():void {
			
		}
		
		public function teleportControl ():void {
			
			if (boosterManager.canUse("Teleport", false) && hero.moveable && hero.currentFrameLabel != "hurt" && hero.currentFrameLabel != "climb") {
			//if (gameData.dataIsGearEquipt("Teleport", playerID)) {
				if (pointTarget) {
					
					if (gameData.boosterInputByName("Teleport", playerID)) {
						
						pointTarget.init(hero);			
						pointTarget.update();
					} else {
						pointTarget.end();
					}
				}
			}
				
			if (hero.currentFrameLabel == "teleport") {
				if (hero.teleport.currentFrame == 1) {
					boosterManager.canUse("Teleport");
					hero.xSpeed *= -.1;
					hero.ySpeed *= -.1;
				}
				if (hero.teleport.currentFrameLabel == "teleport") {
					var enableY:Boolean = true;
					var enableX:Boolean = true;
					for (var i:int = 0; i < 40; i ++) {
						if (enableX) hero.x += pointTarget.xDist/40;
						if (enableY) hero.y += pointTarget.yDist/40;
						
						hero.updateOnSurface(30, 83, true);
						if (hero.onTopWall || hero.onGround) {
							enableY = false;
							break;
						}
						if (hero.onLeftWall || hero.onRightWall) {
							enableX = false;
							break;
						}
					}
					
					hero.xSpeed = pointTarget.xDist * .04;
					hero.ySpeed = -pointTarget.yDist * .04;
					if (!hero.onGround) {
						hero.ySpeed += (Math.abs(pointTarget.xDist) * .03);
					}
				}
			}
		}
		
	}

}