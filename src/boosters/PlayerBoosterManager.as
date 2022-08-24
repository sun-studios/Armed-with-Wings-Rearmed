package boosters  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class PlayerBoosterManager extends MovieClip
	{
		
		public var hero:MovieClip;
		public var boosterHud:MovieClip;
		public var playerID:Number;
		public var gameData:MovieClip;
		public var ctrl:PlayerControl;
		
		private var padding:int;
		
		public var booster0:Array;
		public var booster1:Array;
		public var booster2:Array;
		public var booster3:Array;
		
		public function PlayerBoosterManager() 
		{
			//[name, description, passive:bool, cooldown:number, mag:number]
		}
		
		public function kill():void {
			hero = null;
			boosterHud = null;
			gameData = null;
			ctrl = null;
			
			booster0 = null;
			booster1 = null;
			booster2 = null;
			booster3 = null;
		}
		
		public function init(playerClip:MovieClip):void {
			hero = playerClip;
			playerID = hero.playerID;
			gameData = MovieClip(hero.root);
			ctrl = PlayerControl(hero.control);
			
			padding = 10;
			
			//clear existing
			for (var i:int = 0; i < 4; i++) {
				var arr:Array = this["booster" + i]
				
				if (arr && arr[5]) {
					trace("KILLL 1");
					Booster(arr[5]).kill();
				}
			}
			
			if (playerID == 2) 
				boosterHud = MovieClip(hero.root).hud.topRight.boosters;
			else 
				boosterHud = MovieClip(hero.root).hud.topLeft.boosterCtrl;
			
			var p2:String = "";
			if (playerID == 2) p2 = "_p2";
			var gear0:int = gameData["data_equiptedGear0"+p2];
			var gear1:int = gameData["data_equiptedGear1"+p2];
			var gear2:int = gameData["data_equiptedGear2"+p2];
			var gear3:int = gameData["data_equiptedGear3" + p2];
			
			booster0 = new Array();
			booster0 = [gameData["data_gear"+gear0+"_name"], 
						gameData["data_gear"+gear0+"_description"], 
						gameData["data_gear"+gear0+"_passive"],
						[gameData["data_gear"+gear0+"_cooldown"], gameData.cacheCooldown0],
						[gameData["data_gear" + gear0 + "_mag"], gameData.cacheMag0]];
						
						
			booster1 = new Array();
			booster1 = [String(gameData["data_gear"+gear1+"_name"]), 
						String(gameData["data_gear"+gear1+"_description"]), 
						Boolean(gameData["data_gear"+gear1+"_passive"]),
						[Number(gameData["data_gear"+gear1+"_cooldown"]), gameData.cacheCooldown1],
						[Number(gameData["data_gear"+gear1+"_mag"]), gameData.cacheMag1]];
						
			booster2 = new Array();
			booster2 = [String(gameData["data_gear"+gear2+"_name"]), 
						String(gameData["data_gear"+gear2+"_description"]), 
						Boolean(gameData["data_gear"+gear2+"_passive"]),
						[Number(gameData["data_gear"+gear2+"_cooldown"]), gameData.cacheCooldown2],
						[Number(gameData["data_gear"+gear2+"_mag"]), gameData.cacheMag2]];
						
			booster3 = new Array();
			booster3 = [String(gameData["data_gear"+gear3+"_name"]), 
						String(gameData["data_gear"+gear3+"_description"]), 
						Boolean(gameData["data_gear"+gear3+"_passive"]),
						[Number(gameData["data_gear"+gear3+"_cooldown"]), gameData.cacheCooldown3],
						[Number(gameData["data_gear" + gear3 + "_mag"]), gameData.cacheMag3]];
			
			
						
			for (i = 0; i < 4; i ++) {
				arr = this["booster" + i]
				
				switch (String(arr[0])) {
					case "Extended Combo"		: arr[5] = (new BoosterExtendedCombo(this)); 		break;
					case "Speed Charge"			: arr[5] = (new BoosterSpeedCharge(this));			break;
					case "Auto Heal"			: arr[5] = (new BoosterAutoHeal(this)); 			break;
					case "Power Wave"			: arr[5] = (new BoosterPowerWave(this)); 			break;
					case "Projectile"			: arr[5] = (new BoosterProjectile(this)); 			break;
					case "AntiFlinch"			: arr[5] = (new BoosterAntiFlinch(this)); 			break;
					case "Teleport"				: arr[5] = (new BoosterTeleport(this)); 			break;
					case "DoubleHit"			: arr[5] = (new BoosterDoubleHit(this)); 			break;
					case "Jump"					: arr[5] = (new BoosterJump(this)); 				break;
					case "Revive"				: arr[5] = (new BoosterRevive(this)); 				break;
					case "Juggle"				: arr[5] = (new BoosterJuggle(this));				break;
					case "Ice Spikes"			: arr[5] = (new BoosterIceSpikes(this)); 			break;
					case "Floaty"				: arr[5] = (new BoosterFloat(this)); 				break;
					case "Gravity Hit"			: arr[5] = (new BoosterGravityHit(this)); 			break;
					case "Handy Rock"			: arr[5] = (new BoosterSpawnRock(this)); 			break;
					case "Speed Boost"			: arr[5] = (new BoosterMoveSpeed(this)); 			break;
					case "Extra Range"			: arr[5] = (new BoosterExtraRange(this)); 			break;
					case "Fire Ball"			: arr[5] = (new BoosterFireBall(this)); 			break;
					case "Attack Lundge"		: arr[5] = (new BoosterAttackLundge(this)); 		break;
					case "Leech"				: arr[5] = (new BoosterLeech(this)); 				break;
					case "Ultimate Strike"		: arr[5] = (new BoosterUltimateStrike(this)); 				break;
				}
				if (arr[5])
				Booster(arr[5]).boosterID = i;
			}
		}
		
		public function update():void {
			if (MovieClip(root).transition.ending) {
				//if true, don't update display. This stops a really annoying NullObject ref when completeing levels
			} else {
				cooldownAndDisplay();
				//if (padding > 0) {
				//	padding --;
				//} else {
				//	cooldownAndDisplay();
				//	padding = 10;
				//}
			}
			
			for (var i:int = 0; i < 4; i ++) {
				if (this["booster" + i]) {
					if (Booster(this["booster" + i][5])) {
						Booster(this["booster" + i][5]).update();
					}
				}
			}
		}
		
		public function takeDamage():void {
			for (var i:int = 0; i < 4; i ++) {
				if (this["booster" + i]) {
					if (Booster(this["booster" + i][5])) {
						Booster(this["booster" + i][5]).takeDamage();
					}
				}
			}
		}
		public function damageEnemy(enemy:MovieClip):void {
			for (var i:int = 0; i < 4; i ++) {
				if (this["booster" + i]) {
					if (Booster(this["booster" + i][5])) {
						Booster(this["booster" + i][5]).damageEnemy(enemy);
					}
				}
			}
		}
		
		public function canUse(_boosterName:String, _use:Boolean = true):Boolean {
			var arr:Array;
			var id:int;
			
			//Find array
			for (var i:int = 0; i < 4; i ++) {
				if (this["booster" + i][0] == _boosterName) {
					arr = this["booster" + i];
					id = i;
					break;
				}
			}
			
			if (arr) {
				//Check if Passive
				if (arr[2]) {
					return true;
				} else {
					//check if cooldown
					if (arr[3][1] == 0) {
						if (_use) {
							//check if mag is maxed
							if (arr[4][1] == arr[4][0]-1 || arr[4][0] == 0) {
								//do cooldown
								arr[3][1] = arr[3][0];
								arr[4][1] = 0;
							} else {
								arr[4][1] += 1;
								gameData["cacheMag" + i] = arr[4][1];
							}
							return true;
						} else {
							return true;
						}
					}
				}
			}
			
			return false;
		}
		
		public function cooldownAndDisplay():void {
			var val:Number;
			//Booster 1
			if (booster0[3][1] > 0) {
				booster0[3][1] -= 1;
				gameData.cacheCooldown0 = booster0[3][1];
				
				val = Number(booster0[3][1]) / (booster0[3][0]);
				if (val > 0 && val < 200) {
					boosterHud.panelEquiptment0.clip.refreshClip.gotoAndStop(2 + (100 - Math.floor(val * 100)));
					boosterHud.panelEquiptment0.clip.refreshClip.scaleY = 1;
				} else {
					boosterHud.panelEquiptment0.clip.refreshClip.gotoAndStop(1);
				}
			} else {
				boosterHud.panelEquiptment0.clip.refreshClip.gotoAndStop(1);
				if (booster0[4][0] > 0)
					boosterHud.panelEquiptment0.clip.refreshClip.scaleY = (booster0[4][1] / booster0[4][0]);
				else 
					boosterHud.panelEquiptment0.clip.refreshClip.scaleY = 0
			}
			
			//Booster 2
			if (booster1[3][1] > 0) {
				booster1[3][1] -= 1;
				gameData.cacheCooldown1 = booster1[3][1];
			
				val = Number(booster1[3][1]) / (booster1[3][0]);
				if (val > 0 && val < 200) {
					boosterHud.panelEquiptment1.clip.refreshClip.gotoAndStop(2 + (100 - Math.floor(val * 100)));
					boosterHud.panelEquiptment1.clip.refreshClip.scaleY = 1;
				} else {
					boosterHud.panelEquiptment1.clip.refreshClip.gotoAndStop(1);
				}
			} else {
				boosterHud.panelEquiptment1.clip.refreshClip.gotoAndStop(1);
				if (booster1[4][0] > 0)
					boosterHud.panelEquiptment1.clip.refreshClip.scaleY = (booster1[4][1] / booster1[4][0]);
				else 
					boosterHud.panelEquiptment1.clip.refreshClip.scaleY = 0
			}
			
			//Booster 3
			if (booster2[3][1] > 0) {
				booster2[3][1] -= 1;
				gameData.cacheCooldown2 = booster2[3][1];
			
				val = Number(booster2[3][1]) / (booster2[3][0]);
				if (val > 0 && val < 200) {
					boosterHud.panelEquiptment2.clip.refreshClip.gotoAndStop(2 + (100 - Math.floor(val * 100)));
					boosterHud.panelEquiptment2.clip.refreshClip.scaleY = 1;
				} else {
					boosterHud.panelEquiptment2.clip.refreshClip.gotoAndStop(1);
				}
			} else {
				boosterHud.panelEquiptment2.clip.refreshClip.gotoAndStop(1);
				if (booster2[4][0] > 0)
					boosterHud.panelEquiptment2.clip.refreshClip.scaleY = (booster2[4][1] / booster2[4][0]);
				else 
					boosterHud.panelEquiptment2.clip.refreshClip.scaleY = 0
			}
			
			//Booster 4
			if (booster3[3][1] > 0) {
				booster3[3][1] -= 1;
				gameData.cacheCooldown3 = booster3[3][1];
			
				val = Number(booster3[3][1]) / (booster3[3][0]);
				if (val > 0 && val < 200) {
					boosterHud.panelEquiptment3.clip.refreshClip.gotoAndStop(2 + (100 - Math.floor(val * 100)));
					boosterHud.panelEquiptment3.clip.refreshClip.scaleY = 1;
				} else {
					boosterHud.panelEquiptment3.clip.refreshClip.gotoAndStop(1);
				}
			} else {
				boosterHud.panelEquiptment3.clip.refreshClip.gotoAndStop(1);
				if (booster3[4][0] > 0)
					boosterHud.panelEquiptment3.clip.refreshClip.scaleY = (booster3[4][1] / booster3[4][0]);
				else 
					boosterHud.panelEquiptment3.clip.refreshClip.scaleY = 0
			}
		}
	}
}