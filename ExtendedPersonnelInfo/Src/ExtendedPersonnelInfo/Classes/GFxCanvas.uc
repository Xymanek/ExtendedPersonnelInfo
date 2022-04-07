class GFxCanvas extends GFxObject dependson(ScaleformCanvasHelpers);

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

// TODO: BeginGradientFill

function AS_EndFill ()
{
	ActionScriptVoid("endFill");
}

function AS_MoveTo (float InX, float InY)
{
	ActionScriptVoid("moveTo");
}

function LineStyle (MovieClipLineStyle Style)
{
	AS_LineStyle(
		Style.Thickness, Style.Color, Style.Alpha, Style.PixelHinting,
		class'ScaleformCanvasHelpers'.static.LineNoScaleToAS(Style.NoScale),
		class'ScaleformCanvasHelpers'.static.LineCapsToAS(Style.CapsStyle),
		class'ScaleformCanvasHelpers'.static.LineJointToAS(Style.JointStyle),
		Style.MiterLimit
	);
}

function AS_LineStyle (
	float Thickness, float InColor = 0x000000, float InAlpha = 100, bool PixelHinting = false,
	string NoScale = "normal", // Valid values are "normal", "none", "vertical", "horizontal"
	string CapsStyle = "round", // Valid values are "round", "square", "none"
	string JointStyle = "round", // Valid values are "round", "miter", "bevel"
	float MiterLimit = 3
)
{
	ActionScriptVoid("lineStyle");
}

function LineGradientStyle (MovieClipLineGradientStyle Style)
{
	local array<float> Colors, Alphas, Ratios;
	local int i;

	Colors.Length = Style.Points.Length;
	Alphas.Length = Style.Points.Length;
	Ratios.Length = Style.Points.Length;

	for (i = 0; i < Style.Points.Length; i++)
	{
		Colors[i] = Style.Points[i].Color;
		Alphas[i] = Style.Points[i].Alpha;
		Ratios[i] = Style.Points[i].Ratio;
	}

	AS_LineGradientStyle(
		class'ScaleformCanvasHelpers'.static.LineGradientFillToAS(Style.FillType),
		Colors, Alphas, Ratios,
		Style.StyleMatrix,
		class'ScaleformCanvasHelpers'.static.LineGradientSpreadToAS(Style.SpreadMethod),
		class'ScaleformCanvasHelpers'.static.LineGradientInterpolationToAS(Style.InterpolationMethod),
		Style.FocalPointRatio
	);
}

function AS_LineGradientStyle (
	string FillType, // Valid values are "linear" or "radial"
	array<float> Colors, array<float> Alphas, array<float> Ratios, // Lengths must match
	GFxObject InMatrix,
	string SpreadMethod = "pad", // Valid values are "pad", "reflect" or "repeat"
	string InterpolationMethod = "RGB", // Valid values are "RGB" or "linearRGB"
	float FocalPointRatio = 0 // [-1, 1]
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

// TODO: Clear

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
