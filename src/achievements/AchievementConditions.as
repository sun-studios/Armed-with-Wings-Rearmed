package achievements 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class AchievementConditions 
	{
		
		private var game:MovieClip;
		private var gameData:MovieClip;
		private var achievePopup:MovieClip;
		private var achievementData:AchievementData;
		
		private var go:Boolean;
		private var updateDelay:int;
		private var updateDelayOrig:int;
		public var displayQue:Array;
		
		public function AchievementConditions() 
		{
			updateDelay = 80;
			updateDelayOrig = 80;
			
			displayQue = new Array();
		}
		
		public function init (_game:MovieClip, _gameData:MovieClip, _achievePopup:MovieClip, _achievementData:AchievementData):void {
			game = _game;
			gameData = _gameData;
			achievePopup = _achievePopup;
			achievementData = _achievementData;
			
			_gameData.addEventListener("STORYCOMPLETED", updateOnStoryCompleted);
			_gameData.addEventListener("LEVELCOMPLETED", updateOnLevelCompleted);
			_gameData.addEventListener("GOALREACHED", updateOnGoalReached);
			go = true;
		}
		
		public function update ():void {
			if (go) {
				if (updateDelay > 0) {
					updateDelay --;
				} else {
					achieve1_conditionUpdate();
					achieve2_conditionUpdate();
					achieve3_conditionUpdate();
					
					achieve4_conditionUpdate();
					achieve5_conditionUpdate();
					achieve6_conditionUpdate();
					
					//achieve7_conditionUpdate(); listens for an event dispatch
					//achieve8_conditionUpdate(); listens for an event dispatch
					//achieve9_conditionUpdate(); listens for an event dispatch
					//achieve10_conditionUpdate(); listens for an event dispatch
					
					achieve11_conditionUpdate();
					
					achieve13_conditionUpdate();
					
					achieve14_conditionUpdate();
					achieve15_conditionUpdate();
					achieve16_conditionUpdate();
					
					updateDelay = updateDelayOrig;
				}
				displayQueUpdate();
			}
		}
		function updateOnStoryCompleted (e:Event):void {
			achieve7_conditionUpdate();
			achieve8_conditionUpdate();
			achieve9_conditionUpdate();
			achieve10_conditionUpdate();
			achieve20_conditionUpdate();
			achieve12_conditionUpdate();
		}
		function updateOnLevelCompleted(e:Event):void {
			achieve12_conditionUpdate();
		}
		function updateOnGoalReached(e:Event):void {
			achieve17_conditionUpdate();
			achieve18_conditionUpdate();
			achieve19_conditionUpdate();
		}
		
		
		
		function addToDisplayQue(id:int):void {
			displayQue.push(id);
		}
		function displayQueUpdate():void {
			if (displayQue.length == 0) {
				
			} else {
				if (achievePopup.currentFrame == 1) {
					achievePopup.go(displayQue[0]);
					displayQue.shift();
					
					if (displayQue.length == 0) {
						if (gameData) {
							gameData.dispatchEvent(new Event("ACHIEVEDISPLAYCOMPLETE"));
						} else {
							trace("gameData is null? caught, but is this bad? Are avchievements unlocking?");
						}
					} 
				}
			}
		}
		
		
		
		//GET 100 ORBS
		private function achieve1_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(0)) {
				if (gameData.data_orbsCollected >= 100) {
					achievementData.unlockAchiement(0);
					addToDisplayQue(0);
				}
			}
		}
		
		//GET 500 ORBS
		private function achieve2_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(1)) {
				if (gameData.data_orbsCollected >= 500) {
					achievementData.unlockAchiement(1);
					addToDisplayQue(1);
				}
			}
		}
		
		//GET 1000 ORBS
		private function achieve3_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(2)) {
				if (gameData.data_orbsCollected >= 1000) {
					achievementData.unlockAchiement(2);
					addToDisplayQue(2);
				}
			}
		}
		
		//GET X10 COMBO
		private function achieve4_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(3)) {
				if (gameData.sessionTopCombo >= 10) {
					achievementData.unlockAchiement(3);
					addToDisplayQue(3);
				}
			}
		}
		
		//GET X25 COMBO
		private function achieve5_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(4)) {
				if (gameData.sessionTopCombo >= 25) {
					achievementData.unlockAchiement(4);
					addToDisplayQue(4);
				}
			}
		}
		
		//GET X50 COMBO
		private function achieve6_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(5)) {
				if (gameData.sessionTopCombo >= 50) {
					achievementData.unlockAchiement(5);
					addToDisplayQue(5);
				}
			}
		}
		
		//RESISTANCE IS - Beat the game on Futile < triggers by event dispatch
		private function achieve7_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(6)) {
				if (gameData.gameDifficulty == gameData.gameDifficultySuperFutile) {
					achievementData.unlockAchiement(6);
					addToDisplayQue(6);
				}
			}
		}
		
		//RIGHTFUL RULER - Beat the game with Vandheer < triggers by event dispatch
		private function achieve8_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(7)) {
				if (gameData.heroName == "VANDHEER") {
					achievementData.unlockAchiement(7);
					addToDisplayQue(7);
				}
			}
		}
		
		//KATANA - Complete the Story with the Katana < triggers by event dispatch
		private function achieve9_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(8)) {
				if (gameData.data_equiptedWeapon == 0) {
					achievementData.unlockAchiement(8);
					addToDisplayQue(8);
				}
			}
		}
		
		//PEERLESS WARRIOR
		//KATANA - Complete the Story with the Katana < triggers by event dispatch
		private function achieve10_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(9)) {
				if (gameData.gameDifficulty == gameData.gameDifficultyFutile) {
					achievementData.unlockAchiement(9);
					addToDisplayQue(9);
				}
			}
		}
		
		//RELIC COLLECTOR - Collect all Relics
		private function achieve11_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(10)) {
				if (gameData.allKeysCollected()) {
					achievementData.unlockAchiement(10);
					addToDisplayQue(10);
				}
			}
		}
		
		//RELIC COLLECTOR - Collect all Relics < called frm event dispatch
		private function achieve12_conditionUpdate():void {
			trace("dsadsad as da :: "+gameData.sessionLevel);
			if (!achievementData.isAchievementUnlocked(11)) {
				if (!gameData.sessionFinalBossRevived && gameData.sessionLevel == 40) {
					achievementData.unlockAchiement(11);
					addToDisplayQue(11);
				}
			}
		}
		
		//ARMED WITH WVERYTHING - Collect all Equipment
		private function achieve13_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(12)) {
				if (gameData.allGearUnlocked() && gameData.allWeaponsUnlocked()) {
					achievementData.unlockAchiement(12);
					addToDisplayQue(12);
				}
			}
		}
		
		//SURVIVAL WAVE 1 - Reach Wave 5
		private function achieve14_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(13)) {
				if (gameData.sessionWave >= 5) {
					achievementData.unlockAchiement(13);
					addToDisplayQue(13);
				}
			}
		}
		//SURVIVAL WAVE 2 - Reach Wave 10
		private function achieve15_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(14)) {
				if (gameData.sessionWave >= 10) {
					achievementData.unlockAchiement(14);
					addToDisplayQue(14);
				}
			}
		}
		//SURVIVAL WAVE 3 - Reach Wave 20
		private function achieve16_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(15)) {
				if (gameData.sessionWave >= 20) {
					achievementData.unlockAchiement(15);
					addToDisplayQue(15);
				}
			}
		}
		
		//GOAL 1 - Reach a Single Flag Post
		private function achieve17_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(16)) {
				if (gameData.sessionFlagPostType <= 1) {
					achievementData.unlockAchiement(16);
					addToDisplayQue(16);
				}
			}
		}
		//GOAL 2 - Reach a Double Flag Post
		private function achieve18_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(17)) {
				if (gameData.sessionFlagPostType == 2) {
					achievementData.unlockAchiement(17);
					addToDisplayQue(17);
				}
			}
		}
		//GOAL 3 - Reach a Tripple Flag Post
		private function achieve19_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(18)) {
				if (gameData.sessionFlagPostType == 3) {
					achievementData.unlockAchiement(18);
					addToDisplayQue(18);
				}
			}
		}
		
		//SPEED DEMON - Complete the Game in 60 minutes < dispatche event
		private function achieve20_conditionUpdate():void {
			if (!achievementData.isAchievementUnlocked(19)) {
				if (gameData.sessionTimeInt <= 3600) {
					achievementData.unlockAchiement(19);
					addToDisplayQue(19);
				}
			}
		}
	}

}