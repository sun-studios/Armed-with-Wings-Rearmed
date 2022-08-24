package achievements 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class AchievementData 
	{
		
		public static const acheivement0_name:String = "ORB COLLECTOR";
		public static const acheivement0_desc:String = "Collect 100 Orbs";
		
		public static const acheivement1_name:String = "ORB HUNTER";
		public static const acheivement1_desc:String = "Collect 500 Orbs";
		
		public static const acheivement2_name:String = "ORB MASTER";
		public static const acheivement2_desc:String = "Collect 1000 Orbs";
		
		public static const acheivement3_name:String = "GOOD COMBO";
		public static const acheivement3_desc:String = "Get a x10 Combo";
		
		public static const acheivement4_name:String = "GREAT COMBO";
		public static const acheivement4_desc:String = "Get a x25 Combo";
		
		public static const acheivement5_name:String = "SUPER COMBO";
		public static const acheivement5_desc:String = "Get a x50 Combo";
		
		public static const acheivement6_name:String = "RESISTANCE IS";
		public static const acheivement6_desc:String = "Complete the Story on Futile";
		
		public static const acheivement7_name:String = "RIGHTFUL RULER";
		public static const acheivement7_desc:String = "Complete the Story with Vandeer Lorde";
		
		public static const acheivement8_name:String = "KATANA'S PROSPERITY";
		public static const acheivement8_desc:String = "Complete the Story with the Katana";
		
		public static const acheivement9_name:String = "PEERLESS WARRIOR";
		public static const acheivement9_desc:String = "Complete the Story on Hard";
		
		public static const acheivement10_name:String = "RELIC COLLECTOR";
		public static const acheivement10_desc:String = "Collect all Relics";
		
		public static const acheivement11_name:String = "TRUE STRENGTH";
		public static const acheivement11_desc:String = "Complete Level 40 without being Revived";
		
		public static const acheivement12_name:String = "ARMED WITH EVERYTHING";
		public static const acheivement12_desc:String = "Unlock all Equipment";
		
		public static const acheivement13_name:String = "SURVIVALIST";
		public static const acheivement13_desc:String = "Reach Wave 5";
		
		public static const acheivement14_name:String = "GREAT SURVIVALIST";
		public static const acheivement14_desc:String = "Reach Wave 10";
		
		public static const acheivement15_name:String = "SUPER SURVIVALIST";
		public static const acheivement15_desc:String = "Reach Wave 20";
		
		public static const acheivement16_name:String = "GOAL";
		public static const acheivement16_desc:String = "Reach a Single Flag Post";
		
		public static const acheivement17_name:String = "BONUS GOAL";
		public static const acheivement17_desc:String = "Reach a Double Flag Post";
		
		public static const acheivement18_name:String = "SPECIAL GOAL";
		public static const acheivement18_desc:String = "Reach a Triple Flag Post";
		
		public static const acheivement19_name:String = "SPEED DEMON";
		public static const acheivement19_desc:String = "Complete the Story in 60 minutes or less";
		
		public var acheivementsUnlocked:Array;
		public var gameData:MovieClip;
		
		public function AchievementData(_gameData:MovieClip) 
		{
			gameData = _gameData;
			if (gameData.acheivementsUnlocked.length > 0) {
				acheivementsUnlocked = gameData.acheivementsUnlocked;
				trace("LOADED ACHIEVEMENT DATA");
			} else {
				acheivementsUnlocked = new Array();
				for (var i:int = 0; i < 20; i ++) {
					acheivementsUnlocked.push(false);
				}
				trace("NEW ACHIEVEMENT DATA CREATED");
			}
			
		}
		
		public function isAchievementUnlocked(id:int):Boolean {
			return acheivementsUnlocked[id];
		}
		
		public function unlockAchiement(id:int):void {
			if (!acheivementsUnlocked[id]) {
				acheivementsUnlocked[id] = true;
				trace("ACHIEVMENT UNLOCKED :: "+id);
			} else {
				trace("ACHIEVMENT "+id+" already unlocked");
			}
			gameData.unlockSteamAchievement();
			gameData.unlockSteamAchievement();
			gameData.acheivementsUnlocked = acheivementsUnlocked;
		}
		
		
	}

}