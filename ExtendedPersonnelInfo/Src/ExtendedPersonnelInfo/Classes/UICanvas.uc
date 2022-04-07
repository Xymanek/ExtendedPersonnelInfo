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

simulated function LineStyle (MovieClipLineStyle Style)
{
	AS_LineStyle(
		Style.Thickness, Style.Color, Style.Alpha, Style.PixelHinting,
		class'ScaleformCanvasHelpers'.static.LineNoScaleToAS(Style.NoScale),
		class'ScaleformCanvasHelpers'.static.LineCapsToAS(Style.CapsStyle),
		class'ScaleformCanvasHelpers'.static.LineJointToAS(Style.JointStyle),
		Style.MiterLimit
	);
}

simulated function AS_LineStyle (
	float Thickness, float InColor = 0x000000, float InAlpha = 100, bool PixelHinting = false,
	string NoScale = "normal", // Valid values are "normal", "none", "vertical", "horizontal"
	string CapsStyle = "round", // Valid values are "round", "square", "none"
	string JointStyle = "round", // Valid values are "round", "miter", "bevel"
	float MiterLimit = 3
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
	MC.QueueNumber(MiterLimit);
	MC.EndOp();
}

simulated function AS_LineTo (float InX, float InY)
{
	MC.BeginFunctionOp("lineTo");
	MC.QueueNumber(InX);
	MC.QueueNumber(InY);
	MC.EndOp();
}

simulated function AS_CurveTo (
	float ControlX, float ControlY,
	float AnchorX, float AnchorY
)
{
	MC.BeginFunctionOp("curveTo");
	MC.QueueNumber(ControlX);
	MC.QueueNumber(ControlY);
	MC.QueueNumber(AnchorX);
	MC.QueueNumber(AnchorY);
	MC.EndOp();
}

// Both UICanvas and MaskedPanel must have had InitPanel() called
simulated function SetMaskFor (UIPanel MaskedPanel)
{
	MaskedPanel.MC.FunctionNum("setMaskControl", MC.cacheIndex);
}

simulated function GFxCanvas GetGFxCanvas ()
{
	return class'GFxCanvas'.static.ForPanel(self);
}
