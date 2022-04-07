class EPI_ScaleformTest extends UIScreen;

//var GFxObject SelfGfx;
//var GFxObject TestGfx;

var UIPanel CanvasPanel;
var UIBGBox BG;

var UICanvas CanvasPanel2;
var UIBGBox BG2;

//var GFxCanvas Canvas;

simulated function InitScreen(XComPlayerController InitController, UIMovie InitMovie, optional name InitName)
{
	super.InitScreen(InitController, InitMovie, InitName);

	CanvasPanel = Spawn(class'UIPanel', self);
	CanvasPanel.InitPanel('CanvasPanel');
	CanvasPanel.AddOnInitDelegate(OnCanvasInit);
	CanvasPanel.SetPosition(100, 100);

	BG = Spawn(class'UIBGBox', self);
	BG.InitBG('BG');
	BG.SetPosition(150, 60);
	BG.SetSize(200, 200);
	
	//BG.mc.FunctionNum("setMaskControl", CanvasPanel.mc.cacheIndex);

	//class'UIMask';

	CanvasPanel2 = Spawn(class'UICanvas', self);
	CanvasPanel2.InitPanel('CanvasPanel2');
	CanvasPanel2.SetPosition(500, 100);

	CanvasPanel2.AS_BeginFill(0xFF0000);
	CanvasPanel2.AS_MoveTo(10, 10);
	CanvasPanel2.AS_LineStyle(5, 0x0000FF, 100);
	CanvasPanel2.AS_LineTo(100, 10);
	CanvasPanel2.AS_LineTo(150, 60);
	CanvasPanel2.AS_LineTo(100, 100);
	CanvasPanel2.AS_LineTo(10, 100);
	CanvasPanel2.AS_LineTo(10, 10);
	CanvasPanel2.AS_EndFill();

	BG2 = Spawn(class'UIBGBox', self);
	BG2.InitBG('BG2');
	BG2.SetPosition(150, 60);
	BG2.SetSize(600, 200);

	CanvasPanel2.SetMaskFor(BG2);
}

//simulated function OnInit ()
//{
//	super.OnInit();
//
//	//SelfGfx = Movie.GetVariableObject(string(MCPath));
//	//TestGfx = SelfGfx;
//	//TestGfx = SelfGfx.CreateEmptyMovieClip("test_mc");
//	//TestGfx.SetFloat("_x", 100);
//	//TestGfx.SetFloat("_y", 100);
//
//	Canvas = class'GFxCanvas'.static.ForPanel(self);
//
//	Canvas.BeginFill(0xFF0000);
//	Canvas.MoveTo(10, 10);
//	Canvas.LineStyle(5, 0x0000FF, 100);
//	Canvas.LineTo(100, 10);
//	Canvas.LineTo(150, 60);
//	Canvas.LineTo(100, 100);
//	Canvas.LineTo(10, 100);
//	Canvas.LineTo(10, 10);
//	Canvas.EndFill();
//
//	//
//}

simulated function OnCanvasInit (UIPanel Panel)
{
	local GFxCanvas Canvas;

	Canvas = class'GFxCanvas'.static.ForPanel(Panel);

	Canvas.BeginFill(0xFF0000);
	Canvas.MoveTo(10, 10);
	Canvas.LineStyle(5, 0x0000FF, 100);
	Canvas.LineTo(100, 10);
	Canvas.LineTo(150, 60);
	Canvas.LineTo(100, 100);
	Canvas.LineTo(10, 100);
	Canvas.LineTo(10, 10);
	Canvas.EndFill();
}