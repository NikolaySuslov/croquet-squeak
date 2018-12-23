initialize
normalColor: normalColor highlightColor: highlightColor
	"Generate a 1-D texture (actually 2-D since that's what Croquet handles, but it's only one pixel high) that is used for the highlight upon mouseOver.  The texture will given a UV offset depending on what part of the frame is to be highlighted."
	| sixteenthWidth halfWidth width form mixedColor tex |
	sixteenthWidth := 16.
	halfWidth := sixteenthWidth * 8.
	width := halfWidth * 2.

	form := Form extent: width@1 depth: 32.
	
	1 to: sixteenthWidth do: 
		[:i |
		mixedColor := highlightColor 
						alphaMixed: (sixteenthWidth-i+1) / sixteenthWidth
						with: normalColor.
		form colorAt: (halfWidth+i-1)@0 put: mixedColor.
		form colorAt: (halfWidth-i)@0 put: mixedColor].
	1 to: halfWidth - sixteenthWidth do:
		[:i |
		form colorAt: (i-1)@0 put: normalColor.
		form colorAt: (width-i)@0 put: normalColor].

	tex := TTexture new initializeWithForm: form mipmap: true shrinkFit: false.
	materialHilite := TMaterial new.
	materialHilite 
		transparency: 0.9;
		fullBright: true;
		texture: tex.
