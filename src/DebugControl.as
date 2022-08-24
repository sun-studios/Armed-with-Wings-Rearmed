package 
{
	
	
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class DebugControl 
	{
		//SKIP LEVELS with RB+Y
		public static var skipLevels:Boolean = false;
		
		//SKIP MENU DIRECT TO LEVEL
		public static var directToLevel:Boolean = false;
		public static var directLevelNum:int = 1;
		
		//SKIP TO SURVIVAL
		public static var directToSurvival:Boolean = false;
		
		//FORCE ALL ENEMIES Power-Level
		public static var forceEnemyLevel:Boolean = false;
		public static var enemyLevel:int = 1;
		
		//MAKE HERO INVINCIBLE
		public static var playerInvincible:Boolean = false;
		
		//DEBUG FLYING HERO MODE
		public static var debugFlyEnabled:Boolean = false;
		
		public static var lowHealthBosses:Boolean = false;
		public static var lowHealthEnemies:Boolean = false;
		
		public static var superPause:Boolean = false;
		
		public static var points:Boolean = false;
		public static var _points:Number = 20000;//200000
		
		public static var showMouse:Boolean = false;

	}
}