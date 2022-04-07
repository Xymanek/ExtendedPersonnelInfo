class EPI_ScaleformTest extends UIScreen;

//var GFxObject SelfGfx;
//var GFxObject TestGfx;

var UIPanel CanvasPanel;
var UIBGBox BG;

var UICanvas CanvasPanel2;
var UIBGBox BG2;

var UICanvas CanvasPanel3;
var UICanvas CanvasPanel4;

var UICanvas CanvasPanel5;

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


	CanvasPanel3 = Spawn(class'UICanvas', self);
	CanvasPanel3.InitPanel('CanvasPanel3');
	CanvasPanel3.SetPosition(500, 800);

	CanvasPanel3.AS_LineStyle(0, 0x0000FF, 100);
	CanvasPanel3.AS_BeginFill(0xFF0000);
	CanvasPanel3.AS_MoveTo(0, 100);
	CanvasPanel3.AS_CurveTo(0, 200, 100, 200);
	CanvasPanel3.AS_CurveTo(200, 200, 200, 100);
	CanvasPanel3.AS_CurveTo(200, 0, 100, 0);
	CanvasPanel3.AS_CurveTo(0, 0, 0, 100);
	CanvasPanel3.AS_EndFill();

	CanvasPanel4 = Spawn(class'UICanvas', self);
	CanvasPanel4.InitPanel('CanvasPanel4');
	CanvasPanel4.SetPosition(900, 800);

	CanvasPanel4.AS_BeginFill(0x0000FF);
	CanvasPanel4.AS_LineStyle(0,, 0);
	CanvasPanel4.AS_LineTo(100, 0);
	CanvasPanel4.AS_CurveTo(150, 50, 100, 100);
	CanvasPanel4.AS_LineTo(0, 100);
	CanvasPanel4.AS_LineTo(0, 0);
	CanvasPanel4.AS_EndFill();

	CanvasPanel5 = Spawn(class'UICanvas', self);
	CanvasPanel5.AddOnInitDelegate(OnCanvas5Init);
	CanvasPanel5.InitPanel('CanvasPanel5');
	CanvasPanel5.SetPosition(900, 400);
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

	Canvas.AS_BeginFill(0xFF0000);
	Canvas.AS_MoveTo(10, 10);
	Canvas.AS_LineStyle(5, 0x0000FF, 100);
	Canvas.AS_LineTo(100, 10);
	Canvas.AS_LineTo(150, 60);
	Canvas.AS_LineTo(100, 100);
	Canvas.AS_LineTo(10, 100);
	Canvas.AS_LineTo(10, 10);
	Canvas.AS_EndFill();
}

simulated function OnCanvas5Init (UIPanel Panel)
{
	local array<float> Colors, Alphas, Ratios;
	local GFxObject LineStyleMatrix;
	local GFxCanvas Canvas;

	Colors.Length = 2;
	Colors[0] = 0xFF0000;
	Colors[1] = 0x0000FF;

	Alphas.Length = 2;
	Alphas[0] = 100;
	Alphas[1] = 100;

	Ratios.Length = 2;
	Ratios[0] = 0;
	Ratios[1] = 255;

	Canvas = CanvasPanel5.GetGFxCanvas();
	LineStyleMatrix = Canvas.CreateBoxMatrixForLineGradient(0, 0, 100, 20);

	Canvas.AS_LineStyle(20,,,,, "none");
	Canvas.AS_LineGradientStyle("linear", Colors, Alphas, Ratios, LineStyleMatrix);
	Canvas.AS_LineTo(100, 0);
	Canvas.AS_EndFill();
}
