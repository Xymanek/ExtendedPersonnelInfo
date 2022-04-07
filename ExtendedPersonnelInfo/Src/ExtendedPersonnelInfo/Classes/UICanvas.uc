class UICanvas extends UIPanel;

simulated function AS_BeginFill (float InColor, optional float InAlpha = 100)
{
	MC.BeginFunctionOp("beginFill");
	MC.QueueNumber(InColor);
	MC.QueueNumber(InAlpha);
	MC.EndOp();
}

simulated function AS_EndFill ()
{
	MC.FunctionVoid("endFill");
}

simulated function AS_MoveTo (float InX, float InY)
{
	MC.BeginFunctionOp("moveTo");
	MC.QueueNumber(InX);
	MC.QueueNumber(InY);
	MC.EndOp();
}

simulated function AS_LineStyle (
	float Thickness, float InColor = 0x000000, float InAlpha = 100,
	bool PixelHinting = false, string NoScale = "normal",
	string CapsStyle = "round", string JointStyle = "round", float miterLimit = 3
)
{
	MC.BeginFunctionOp("lineStyle");
	MC.QueueNumber(Thickness);
	MC.QueueNumber(InColor);
	MC.QueueNumber(InAlpha);
	MC.QueueBoolean(PixelHinting);
	MC.QueueString(NoScale);
	MC.QueueString(CapsStyle);
	MC.QueueString(JointStyle);
	MC.QueueNumber(miterLimit);
	MC.EndOp();
}

simulated function AS_LineTo (float InX, float InY)
{
	MC.BeginFunctionOp("lineTo");
	MC.QueueNumber(InX);
	MC.QueueNumber(InY);
	MC.EndOp();
}

// Both UICanvas and MaskedPanel must have had InitPanel() called
simulated function SetMaskFor (UIPanel MaskedPanel)
{
	MaskedPanel.MC.FunctionNum("setMaskControl", MC.cacheIndex);
}

simulated function GFxCanvas GetGfxCanvas ()
{
	return class'GFxCanvas'.static.ForPanel(self);
}
