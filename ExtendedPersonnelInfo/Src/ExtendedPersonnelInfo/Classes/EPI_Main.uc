// This class deals with spawing side panes and listening to changes on the personnel screen
class EPI_Main extends UIPanel;

// These are set outside
var UIPersonnel Personnel;

// These are set inside
var XComGameState_Unit CurrentUnit;

var UIPanel LeftWingAnchor;
var UIPanel LeftWingContainer;
//var UIImage LeftWingBG;
var UICanvas LeftWingBG;

var UIPanel RightWingAnchor;
var UIPanel RightWingContainer;
var UIImage RightWingBG;

delegate PreviousOnSetSelectedIndex(UIList ContainerList, int ItemIndex);

simulated function InitEPIMain () 
{
	InitPanel('EPI_Main');

	PreviousOnSetSelectedIndex = Personnel.m_kList.OnSetSelectedIndex;
	Personnel.m_kList.OnSetSelectedIndex = OnListSetSelectedIndex;

	BuildUIPanels();

	UpdateCurrentUnit(Personnel.m_kList.SelectedIndex);
	UpdateDisplay();
}

simulated function UpdateDisplay ()
{
	//LeftPane.DisplayFor(CurrentUnit);
	//RightPane.DisplayFor(CurrentUnit);
}

simulated function OnListSetSelectedIndex(UIList ContainerList, int ItemIndex) 
{
	UpdateCurrentUnit(ItemIndex);
	UpdateDisplay();

	PreviousOnSetSelectedIndex(ContainerList, ItemIndex);
}

simulated function UpdateCurrentUnit (int Index)
{
	//local UIPersonnel_ListItem ListItem;
	//
	//ListItem = UIPersonnel_ListItem(Personnel.m_kList.GetItem(Index));
	//
	//if (ListItem == none) {
	//	CurrentUnit = none;
	//	return;
	//}
	//
	//CurrentUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ListItem.UnitRef.ObjectID));
}

simulated protected function BuildUIPanels ()
{
	BuildLeftWing();
	BuildRightWing();
}

simulated protected function BuildLeftWing ()
{
	LeftWingAnchor = Spawn(class'UIPanel', self);
	LeftWingAnchor.bAnimateOnInit = false;
	LeftWingAnchor.InitPanel('LeftWingAnchor');
	//LeftWingAnchor.SetX(class'EPI_Utilities'.const.PersonnelX + 1);
	LeftWingAnchor.SetX(class'EPI_Utilities'.const.PersonnelX + 1);
	LeftWingAnchor.SetY(class'EPI_Utilities'.const.PersonnelY);

	LeftWingContainer = Spawn(class'UIPanel', LeftWingAnchor);
	LeftWingContainer.bAnimateOnInit = false;
	LeftWingContainer.InitPanel('LeftWingContainer');
	//LeftWingContainer.SetX(-402);
	LeftWingContainer.SetX(-400);

	//LeftWingBG = Spawn(class'UIImage', LeftWingContainer);
	//LeftWingBG.bAnimateOnInit = false;
	//LeftWingBG.InitImage('LeftWingBG', "img:///EPI_UILibrary.bg_left_wing");
	//LeftWingBG.SetSize(402, 891);

	LeftWingBG = Spawn(class'UICanvas', LeftWingContainer);
	LeftWingBG.bAnimateOnInit = false;
	LeftWingBG.InitPanel('LeftWingBG');
	
	// Counter clockwise, starting from bottom right
	LeftWingBG.AS_BeginFill(0x000000, 70);
	LeftWingBG.AS_MoveTo(400, 890);
	LeftWingBG.LineStyle(class'ScaleformCanvasHelpers'.default.LineStyle_Invisible);
	LeftWingBG.AS_LineTo(62, 890);
	LeftWingBG.AS_LineTo(44, 869);
	LeftWingBG.AS_LineTo(44, 753);
	LeftWingBG.AS_LineTo(0, 714);
	LeftWingBG.AS_LineTo(0, 503);
	LeftWingBG.AS_LineTo(44, 466);
	LeftWingBG.AS_LineTo(44, 19);
	LeftWingBG.AS_LineTo(62, 0);
	LeftWingBG.AS_LineTo(400, 0);
	LeftWingBG.AS_LineTo(400, 890);
	LeftWingBG.AS_EndFill();

	// TODO: Border line, splitter dags
}

simulated protected function BuildRightWing ()
{
	RightWingAnchor = Spawn(class'UIPanel', self);
	RightWingAnchor.bAnimateOnInit = false;
	RightWingAnchor.InitPanel('RightWingAnchor');
	RightWingAnchor.SetX(class'EPI_Utilities'.const.PersonnelX + class'EPI_Utilities'.const.PersonnelWidth - 1);
	RightWingAnchor.SetY(class'EPI_Utilities'.const.PersonnelY);

	RightWingContainer = Spawn(class'UIPanel', RightWingAnchor);
	RightWingContainer.bAnimateOnInit = false;
	RightWingContainer.InitPanel('RightWingContainer');

	RightWingBG = Spawn(class'UIImage', RightWingContainer);
	RightWingBG.bAnimateOnInit = false;
	RightWingBG.InitImage('RightWingBG', "img:///EPI_UILibrary.bg_right_wing");
	RightWingBG.SetSize(402, 891);
}

defaultproperties 
{
	bAnimateOnInit = false;
}