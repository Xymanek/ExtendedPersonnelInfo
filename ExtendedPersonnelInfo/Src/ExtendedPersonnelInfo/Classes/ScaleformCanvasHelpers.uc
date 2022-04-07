class ScaleformCanvasHelpers extends Object abstract;

enum EMovieClipLineGradientFill
{
	eMCLGF_Linear,
	eMCLGF_Radial,
};

enum EMovieClipLineGradientSpread
{
	eMCLGS_Pad,
	eMCLGS_Reflect,
	eMCLGS_Repeat,
};

enum EMovieClipLineGradientInterpolation
{
	eMCLGI_RGB,
	eMCLGI_LinearRGB,
};

struct MovieClipLineGradientPoint
{
	var float Color; // RGB hexadecimal color value
	var float Alpha; // Will be clamped to [0, 100]
	var float Ratio; // Supported values are [0, 255]

	// Note that the ratio values must increase, sequentially. For example: [0, 63, 127, 190, 255]

	structdefaultproperties
	{
		Alpha = 100;
	}
};

struct MovieClipLineGradientStyle
{
	// Required
	var array<MovieClipLineGradientPoint> Points; // Max 15
	var GFxObject StyleMatrix; // Create using CreateBoxMatrixForLineGradient

	// Optional
	var EMovieClipLineGradientFill FillType;
	var EMovieClipLineGradientSpread SpreadMethod;
	var EMovieClipLineGradientInterpolation InterpolationMethod;
	var float FocalPointRatio; // [-1, 1]

	// Defaults for reference (they match unrealscript defaults)
	structdefaultproperties
	{
		FillType = eMCLGF_Linear;
		SpreadMethod = eMCLGS_Pad;
		InterpolationMethod = eMCLGI_RGB;
		FocalPointRatio = 0;
	}
};

static function GFxObject CreateBoxMatrixForLineGradient (
	GFxMoviePlayer Movie,
	float X, float Y, // Upper left corner of gradient relavtive to owing movie clip
	float Width, float Height,
	float Rotation = 0 // Radians
)
{
	local GFxObject StyleMatrix;
	
	StyleMatrix = Movie.CreateObject("Object");
	StyleMatrix.SetString("matrixType", "box");
	StyleMatrix.SetFloat("x", X);
	StyleMatrix.SetFloat("y", Y);
	StyleMatrix.SetFloat("w", Width);
	StyleMatrix.SetFloat("h", Height);
	StyleMatrix.SetFloat("r", Rotation);

	return StyleMatrix;
}

///////////////////////////////////////////////
/// Enums to actionscript string conversion ///
///////////////////////////////////////////////
// No default returns on purpose - we want the VM to produce
// a warning if there is an unhandled case

static function string LineGradientFillToString (EMovieClipLineGradientFill FillType)
{
	switch (FillType)
	{
		case eMCLGF_Linear:
			return "linear";

		case eMCLGF_Radial:
			return "radial";
	}
}

static function string LineGradientSpreadToString (EMovieClipLineGradientSpread SpreadMethod)
{
	switch (SpreadMethod)
	{
		case eMCLGS_Pad:
			return "linear";

		case eMCLGS_Reflect:
			return "reflect";

		case eMCLGS_Repeat:
			return "repeat";
	}
}

static function string LineGradientInterpolationToString (EMovieClipLineGradientInterpolation InterpolationMethod)
{
	switch (InterpolationMethod)
	{
		case eMCLGI_RGB:
			return "RGB";

		case eMCLGI_LinearRGB:
			return "linearRGB";
	}
}
