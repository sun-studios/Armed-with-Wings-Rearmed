package boosters 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterIceSpikes extends Booster
	{
		
		public function BoosterIceSpikes(_boosterManager:PlayerBoosterManager) 
		{
			super(boosterManager = _boosterManager);
			eagleAction = true;
		}
		
		override public function update ():void {
			super.update();
			
		}
		
		override public function boosterAction():void {
			if (hero.moveable && hero.life > 0) {
				if (boosterManager.canUse("Ice Spikes", false) && gameData.boosterInputByName("Ice Spikes", playerID)) {
					shootIceSpikeBooster();
				}
			}
		}
		
		override public function eagleBoosterAction():void {
			if (boosterManager.canUse("Ice Spikes", false) && gameData.boosterInputByName("Ice Spikes", playerID)) {
				shootIceSpikeBooster(eagle);
			}
		}
		
		private function shootIceSpikeBooster(fromClip:MovieClip = null):void {
			if (!fromClip) fromClip = hero;
			if (boosterManager.canUse("Ice Spikes")) {
				hero.sndCtrl.playSound(hero.sndCtrl.sndIceShot);
				var X:Number = fromClip.x - ((20*fromClip.scaleX)*Math.random());
				var Y:Number = fromClip.y - 30 - ((fromClip.bound.height*.4)*Math.random());
				var iceSpike:MovieClip = hero.particles.addIceSpike(X, Y, 0, 10, 1, hero);
				
				//iceSpike.updateController(control);
				//iceSpikeArr.push(iceSpike);
				hero.vcam.shakeCamera(20);
				
				iceSpike.scaleX = fromClip.scaleX;
				iceSpike.scaleY = fromClip.scaleX;
				iceSpike.rotation = (88 + (4*Math.random()))*fromClip.scaleX;
				iceSpike.clip.width = 9;
				iceSpike.clip.height = 80;
				iceSpike.bound.width = iceSpike.clip.width;
				iceSpike.bound.height = iceSpike.clip.height;
				iceSpike.xSpeed = 35*fromClip.scaleX;
				iceSpike.gravityOn = true;
				iceSpike.ySpeed = 90-Math.abs(iceSpike.rotation);
				iceSpike.slowFall = true;
				iceSpike.control = null;
				iceSpike.master = fromClip;
			}
		}
	}

}