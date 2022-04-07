class GFxCanvas extends GFxObject;

static function GFxCanvas ForPanel (UIPanel Panel)
{
	return GFxCanvas(Panel.Movie.GetVariableObject(string(Panel.MCPath), class'GFxCanvas'));
}

function BeginFill (float InColor, optional float InAlpha = 100)
{
	ActionScriptVoid("beginFill");
}

function EndFill ()
{
	ActionScriptVoid("endFill");
}

function MoveTo (float InX, float InY)
{
	ActionScriptVoid("moveTo");
}

function LineStyle (
	float Thickness, float InColor = 0x000000, float InAlpha = 100,
	bool PixelHinting = false, string NoScale = "normal",
	string CapsStyle = "round", string JointStyle = "round", float miterLimit = 3
)
{
	ActionScriptVoid("lineStyle");
}

function LineTo (float InX, float InY)
{
	ActionScriptVoid("lineTo");
}

function CurveTo (
	float ControlX, float ControlY,
	float AnchorX, float AnchorY
)
{
	ActionScriptVoid("curveTo");
}
