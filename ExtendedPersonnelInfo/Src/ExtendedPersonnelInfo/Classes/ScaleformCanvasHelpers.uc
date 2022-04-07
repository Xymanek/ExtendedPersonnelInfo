class ScaleformCanvasHelpers extends Object abstract;

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
