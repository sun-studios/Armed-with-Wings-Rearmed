package boosters 
{
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterJump extends Booster
	{
		
		private var jumpCount:int;
		
		public function BoosterJump(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			jumpCount = 1;
		}
		
		override public function update():void {
			super.update();
			
			if (hero.onGround) {
				jumpCount = 1;
			}
		}
		
		override public function boosterAction():void {
			jumpControlNormal();
		}
		
		function jumpControlNormal ():void {
			
			//jump
			if (hero.moveable && hero.active) {
				if (jumpCount > 0) {
					if (gameData.boosterInputByName("Jump", playerID)) {			
						if ((hero.onGround && hero.currentFrameLabel != "hurt") || hero.currentFrameLabel == "spinJump" ||
							(hero.currentFrameLabel == "walk" && hero.walk.jumping)) {
							if (boosterManager.canUse(gameData.data_gear9_name)) {
								hero.gotoAndStop("jump");
								hero.ySpeed = 16;
								jumpCount --;
							}
						}
					}
				}
				
				//wall jump
				if (boosterManager.canUse("Jump", false)) {
					if (hero.onLeftWall || hero.onRightWall && !hero.onGround) {
						if (gameData.boosterInputByName("Jump", playerID)) {	
							if (boosterManager.canUse(gameData.data_gear9_name)) {
								if (hero.onLeftWall) hero.scaleX = -1;
								if (hero.onRightWall) hero.scaleX = 1;				
								hero.wallJumpToSpin();
								jumpCount--;
							}
						}
					}
				}
			}
		}
	}
}