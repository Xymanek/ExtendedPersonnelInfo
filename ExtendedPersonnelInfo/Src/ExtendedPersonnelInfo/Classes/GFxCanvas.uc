class GFxCanvas extends GFxObject;

////////////////
/// Creation ///
////////////////

static function GFxCanvas ForPanel (UIPanel Panel)
{
	return GFxCanvas(Panel.Movie.GetVariableObject(string(Panel.MCPath), class'GFxCanvas'));
}

///////////////////////////
/// Action script calls ///
///////////////////////////

function AS_BeginFill (float InColor, optional float InAlpha = 100)
{
	ActionScriptVoid("beginFill");
}

function AS_EndFill ()
{
	ActionScriptVoid("endFill");
}

function AS_MoveTo (float InX, float InY)
{
	ActionScriptVoid("moveTo");
}

function AS_LineStyle (
	float Thickness, float InColor = 0x000000, float InAlpha = 100,
	bool PixelHinting = false, string NoScale = "normal",
	string CapsStyle = "round", string JointStyle = "round", float miterLimit = 3
)
{
	ActionScriptVoid("lineStyle");
}

function AS_LineGradientStyle (
	string FillType, // Valid values are "linear" or "radial"
	array<float> Colors, array<float> Alphas, array<float> Ratios, // Lengths must match
	GFxObject InMatrix,
	string SpreadMethod = "pad", // Valid values are "pad", "reflect" or "repeat"
	string interpolationMethod = "RGB", // Valid values are "RGB" or "linearRGB"
	float focalPointRatio = 0 // [-1, 1]
)
{
	ActionScriptVoid("lineGradientStyle");
}

function AS_LineTo (float InX, float InY)
{
	ActionScriptVoid("lineTo");
}

function AS_CurveTo (
	float ControlX, float ControlY,
	float AnchorX, float AnchorY
)
{
	ActionScriptVoid("curveTo");
}

///////////////
/// Helpers ///
///////////////

function GFxObject CreateBoxMatrixForLineGradient (
	float X, float Y, // Upper left corner of gradient relavtive to owing movie clip
	float Width, float Height,
	float Rotation = 0 // Radians
)
{
	return class'ScaleformCanvasHelpers'.static.CreateBoxMatrixForLineGradient(
		Outer, X, Y, Width, Height, Rotation
	);
}
