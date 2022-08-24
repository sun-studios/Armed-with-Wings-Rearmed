package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Daniel Sun
	 */
	public class UIMultiPlayer extends MovieClip
	{	
		public var ctrl:PlayerControl;
		public var gameData:MovieClip;
	
		public var mainPanel:MovieClip;
		public var panelCharacter:MovieClip;
		public var equiptWeaponPanel:MovieClip;
		public var equiptGearPanel:MovieClip;
		public var transition:MovieClip;
		public var readyClip:MovieClip;
		
		public var currentPanel:MovieClip;
		
		public var ready:Boolean;
		public var playerID:int;
		
		public var local_heroName:String;
		public var local_equiptedWeapon:int;
		public var local_equiptedGear0:int;
		public var local_equiptedGear1:int;
		public var local_equiptedGear2:int;
		public var local_equiptedGear3:int;
		
		public function UIMultiPlayer() {
			
		}
		
		public function init(_ctrl:PlayerControl, _transition:MovieClip, _playerID:int):void {
			ctrl = _ctrl;
			transition = _transition;
			playerID = _playerID;
			
			mainPanel.visible = false;
			panelCharacter.visible = false;
			equiptWeaponPanel.visible = false;
			equiptGearPanel.visible = false;
			
			gameData = MovieClip(root);
			
			displayPanel(panelCharacter);
		}
		
		public function update ():void {
			if (!ready) {
				if (currentPanel == panelCharacter) {
					currentPanel.clip.update();
				}
				if (currentPanel == mainPanel) {
					mainPanel.update();
				}
				if (currentPanel == equiptWeaponPanel) {
					equiptWeaponPanel.update();
				}
				if (currentPanel == equiptGearPanel) {
					equiptGearPanel.update();
				}
			} else {
				if (ctrl.ctrl_cancel) {
					if (gameData.sessionVSTournament) {
						displayPanel(panelCharacter);
					} else {
						displayPanel(mainPanel);
					}
					
					ready = false;
					readyClip.visible = false;
				}
			}
		}

		public function displayPanel (panel:MovieClip):void {
			if (currentPanel) currentPanel.visible = false;
			currentPanel = panel;
			currentPanel.visible = true;
			
			switch (currentPanel) {
				case panelCharacter:
					currentPanel.gotoAndStop(10);
					currentPanel.clip.init(playerID);
					currentPanel.clip.go = true;
					
					//currentPanel.clip.ctrl = ctrl;//override ctrl
					break;
				case mainPanel:
					applyLocalToData();
					currentPanel.init(playerID, this, ctrl);
					break;
				case equiptWeaponPanel:
					currentPanel.init(ctrl, this);
					break;
				case equiptGearPanel:
					
					break;
			}
		}
		
		public function closeCharacterPanel():void {
			if (gameData.sessionVSTournament) {
				readyWaiting();
			} else {
				displayPanel(mainPanel);
			}
		}
		
		public function backtoCharacter():void {
			displayPanel(panelCharacter);
		}
		
		public function openGearSlot(id:Number, _ability:Boolean = false):void {
			displayPanel(equiptGearPanel);
			equiptGearPanel.init(id, this, playerID, _ability);
			equiptGearPanel.ctrl = ctrl;
		}
		
		public function backtoMenu():void {
			transition.toGame = false;
			transition.backToMenu = true;
			transition.backToPasue = false;
			transition.gotoAndPlay("out");
		}
		
		public function readyWaiting():void {
			applyLocalToData();
			readyClip.gotoAndPlay(2);
			mainPanel.visible = false;
			panelCharacter.visible = false;
			equiptWeaponPanel.visible = false;
			equiptGearPanel.visible = false;
			ready = true;
		}
		
		public function gotoGame():void {
			
			transition.toGame = true;
			transition.backToMenu = false;
			transition.backToPasue = false;
			transition.gotoAndPlay("out");
		}
		
		public function applyLocalToData():void {
			var sPlayer:String = "";
			if (playerID == 2) sPlayer = "_p2";
			
			gameData["heroName"+sPlayer] = local_heroName;
			gameData["data_equiptedWeapon"+sPlayer] = local_equiptedWeapon;
			gameData["data_equiptedGear0"+sPlayer] = local_equiptedGear0;
			gameData["data_equiptedGear1"+sPlayer] = local_equiptedGear1;
			gameData["data_equiptedGear2"+sPlayer] = local_equiptedGear2;
			gameData["data_equiptedGear3"+sPlayer] = local_equiptedGear3;
			
			trace("SETTINGS PLAYER "+playerID+", player name is :: "+gameData["heroName"+sPlayer]+", player sword should be :: "+local_equiptedWeapon);
			
			/*
			var weapBoostersArr:Array = gameData.dataGetWeapBoosterFromID(gameData.data_equiptedWeapon);
			gameData["data_weap"+local_equiptedWeapon+"_assignedBoosters"][0][0] = local_equiptedGear0;
			gameData["data_weap"+local_equiptedWeapon+"_assignedBoosters"][0][1] = local_equiptedGear1;
			gameData["data_weap"+local_equiptedWeapon+"_assignedBoosters"][0][2] = local_equiptedGear2;
			gameData["data_weap"+local_equiptedWeapon+"_assignedBoosters"][0][3] = local_equiptedGear3;
			*/
			
			//gameData.saveStoryData();
		}
	}

}

