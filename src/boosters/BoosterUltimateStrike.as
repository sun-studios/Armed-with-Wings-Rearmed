package boosters 
{
	import flash.display.MovieClip;
	import com.greensock.TweenMax;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class BoosterUltimateStrike extends Booster
	{
	
		public var ultiRings:Array;
		public var enemiesTouched:Array;
		public var enemyTargets:Array;
		private var go:Boolean;
		private var listenForRings:Boolean;
		private var minHits:int;
		private var minHitsOrig:int;
		
		public function BoosterUltimateStrike(_boosterManager:PlayerBoosterManager) 
		{
			super(_boosterManager);
			this.eagleAction = true;
			
			ultiRings = new Array();
			enemiesTouched = new Array();
			enemyTargets = new Array();
			minHits = 4;
			minHitsOrig = 4;
			
			
		}
		
		override public function update ():void {
			super.update();
			
			if (go) {
				if (listenForRings) ringEnemyCollision();
				levitateEnemies();
				attacks();
			}
		}
		
		override public function boosterAction ():void {
			if (boosterManager.canUse("Ultimate Strike", false)) {
				if (hero.life > 0 && hero.moveable && hero.active && hero.currentFrameLabel != "climb") {
					if (hero.currentFrameLabel == "attack" && hero.attack.startAttack) {
						
					} else {
						startAttack();
					}
				}
			}
		}
		
		override public function eagleBoosterAction():void {
			if (boosterManager.canUse("Ultimate Strike", false)) {
				if (hero.currentFrameLabel == "attack" && hero.attack.startAttack) {
					
				} else {
					startAttack(true);
				}
			}
		}
		
		private function startAttack(_eagle:Boolean = false):void {
			if (boosterManager.canUse("Ultimate Strike")) {
				//set some vars
				clearOutArray();
				go = true;
				listenForRings = true;
				ultiRings = [];
				minHits = minHitsOrig;
				
				//turn on Ring Collision
				TweenMax.delayedCall(60, function () { listenForRings = false; }, null, true);
				//disable player control
				hero.moveable = false;
				hero.isUltiStriking = true;
				hero.enablePhysics = false;
				hero.canAntiFlinchFORCE = true;
				hero.takeDamageOn = false;
				sndCtrl.playSound(sndCtrl.sndSpecialStrike);
				
				//do hero attack
				hero.gotoAndStop("attack");
				hero.attack.gotoAndPlay("ultimateStrike");
				hero.attack.startAttack = true;
				
				//drop first ring
				if (_eagle) {
					addRing(eagle);
				} else {
					addRing(hero);
				}
			}
		}
		
		override public function kill ():void {
			
		}
		
		function ringEnemyCollision():void {
			for (var i:int = 0; i < ultiRings.length; i ++) {
				var ring:MovieClip = ultiRings[i];
				
				//limit check to few frames
				if (ring.currentFrame < 40) {
					for (var i2:int = 0; i2 < enemiesTouched.length; i2 ++) {
						if (!enemiesTouched[i2]) {
							var en:MovieClip = game.enemiesArr[i2];
							
							if (isAllowedType(en)) {
								if (ring.bound.hitTestObject(en.bound) && !en.dead && en.moveable && en.visible) {
									enemiesTouched[i2] = true;
									var yFloat:Number = en.y - 40 - (Math.random() * 200);
									enemyTargets.push([en, yFloat]);
									addRing(en);
									sndCtrl.playSound(sndCtrl.sndSpecialStrikeSoft, 0, .2);
									en.gotoAndStop("hurt");
									if (isEnemySpecial(en)) {
										en.hurt.gotoAndStop(1);
										
										//forceing some settings
										if (en.enemyType == "BOSS3") {
											en.spinning = false;
											en.bounceAttk = false;
											en.digging = false;
										}
									} else {
										en.hurt.gotoAndPlay("spin");
									}
									
								}
							}
						}
					}
				}
			}
		}
		
		function levitateEnemies():void {
			for (var i:int = 0; i < enemyTargets.length; i ++) {
				var en:MovieClip = enemyTargets[i][0];
				var yFloat:Number = enemyTargets[i][1];
				if (en && !isEnemySpecial(en) && !en.deadJuiced) {
					if (en.hasOwnProperty("nearTopWall")) {
						if (en.nearTopWall) yFloat = enemyTargets[i][1] = en.y + 30;
					}
					
					en.y += (yFloat - en.y) / 30;
					en.ySpeed = 0;
					en.xSpeed = 0;
					
					
					//force hurt spin animation
					if (en.currentFrameLabel == "hurt") {
						if (!en.hurt.spinning) 
						en.hurt.gotoAndPlay("spin");
					} else {
						en.gotoAndStop("hurt");
						en.hurt.gotoAndPlay("spin");
					}
				}
			}
		}
		
		function isEnemySpecial(en:MovieClip):Boolean{
			if (en && en.hasOwnProperty("enemyType")) {
				if (en.enemyType == "ENEMY4" || en.enemyType == "ENEMY5" || en.enemyType == "ENEMY3" || en.enemyType == "BOSS3" || en.enemyType == "BOSS1") {
					return true;
				} else {
					return false;
				}
			}
			return false;
		}
		function isAllowedType(en:MovieClip):Boolean {
			if (en && en.hasOwnProperty("enemyType")) {
				if (en.enemyType == "ENEMY1" || en.enemyType == "ENEMY2" ||  en.enemyType == "ENEMY3" ||  en.enemyType == "ENEMY4" || en.enemyType == "ENEMY5" ||
				en.enemyType == "ENEMY6" || en.enemyType == "ENEMY7" || en.enemyType == "BOSS1" || en.enemyType == "BOSS2" || en.enemyType == "BOSS3" || en.enemyType == "BOSS4") {
					return true;
				} else {
					return false;
				}
			}
			
			return false;
		}
		
		
		function attacks():void {
			if (hero.currentFrameLabel == "attack" && !hero.moveable) {
				hero.xSpeed = 0;
				hero.ySpeed = 0;
			}
			
			if (hero.currentFrameLabel == "attack" && hero.attack.currentFrameLabel == "ULTIGO") {
				if (enemyTargets.length > 0) {
					var en:MovieClip = enemyTargets[0][0];
					if (en) {
						//caluate minimum hits
						if (minHits > 0) minHits--;
						//Attack from left or right
						var dir:int;
						if (Math.random() < .5) dir = 1; else dir = -1;
						
						//position hero
						hero.x = en.x + (50 * -dir);
						hero.scaleX = dir;
						hero.y = en.y;
						
						//Correct ground collision
						if (ground.hitTestPoint(hero.getGlobalX(), hero.getGlobalY(-20), true)) {
							dir *= -1;
							hero.x = en.x + (50 * -dir);
							hero.scaleX = dir;
							hero.y = en.y;
						}
						while (hero.onLeftWall || hero.onLeftWall || hero.nearTopWall) {
						
							if (hero.nearTopWall) hero.y ++;
							if (hero.onLeftWall) hero.x ++;
							if (hero.onRightWall) hero.x --;
							hero.updateOnSurface();
						}
						
						
						
						//get random attack animation
						var r:int = Math.round(Math.random() * 4);
						if (enemyTargets.length == 1) {
							//final attack/attacks on last enemy
							if (minHits == 0) {
								//remove last enemy in end()
								hero.attack.gotoAndPlay("ULTIATTACK5");
								//collision force fix maybe?
							} else {
								//#@ - chopping through enemies
								enemyTargets[0][1] = enemyTargets[0][1]+50;
								hero.attack.gotoAndPlay("ULTIATTACK" + r);
							}
						} else {
							//#@ - chopping through enemies
							hero.attack.gotoAndPlay("ULTIATTACK" + r);
							enemyTargets.splice(0, 1);
						}
						
						//teleport sound
						sndCtrl.playSound(sndCtrl.sndTeleport);
					}
				}
			}
			
			if (hero.currentFrameLabel == "attack") {
				if (hero.attack.currentFrameLabel == "ULTIEND") {
					end();
				}
				if (hero.attack.currentFrameLabel == "ANYENEMIES" && enemyTargets.length <= 0) {
					if (hero.onGround) {
						hero.gotoAndStop("idle");
					} else{ 
						hero.gotoAndStop("walk");
						hero.walk.gotoAndPlay("fall");
					}
					end();
				}
			}
		}
		
		private function addRing(targetClip:MovieClip):void {
			var ring:MovieClip = particleLayer.addUltimateStrikeRing(targetClip.x, targetClip.y);
			ultiRings.push(ring);
		}
		
		private function clearOutArray():void {
			enemyTargets = new Array();
			enemiesTouched = new Array();
			for (var i:int = 0; i < game.enemiesArr.length; i ++) {
				enemiesTouched.push(false);
			}
		}
		
		private function end():void {
			go = false;
			hero.switchToHero();
			hero.takeDamageOn = true;
			hero.canAntiFlinchFORCE = false;
			hero.isUltiStriking = false;
			hero.enablePhysics = true;
			hero.moveable = true;
			listenForRings = false;
			enemyTargets = [];
			enemiesTouched = [];
		}
		
	}

}