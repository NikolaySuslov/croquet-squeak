as yet unclassified
applyOpacity: omap to: dmap

	"Oform is a MAP_OPAQUE from the model; dform is the MAP_DIFFUSE.
     Composite them to produce a 32-bit image that is transparent 
	for all pixels where oform is black,
	and a copy of dform's pixels for all pixels where oform is white."

	| result blit |

	"All that is needed is to apply the R (or G or B) value
     of each pixel from oform into dform as its alpha component."
 
	result := dmap asFormOfDepth:32.

	"Clear the alpha component of the result."
	blit := BitBlt toForm: result.
	blit combinationRule: 1;  "AND"
		halftoneForm: (Bitmap with: 16r00FFFFFF);
		copyBits.

	"Copy in the alpha from the blue of the map."
	blit := BitBlt toForm: result.
	blit sourceForm: (omap asFormOfDepth:32);
		combinationRule: 7; "OR"
		colorMap: (ColorMap
					shifts: #(0 0 0 24)
					masks: #(0 0 0 16rFF));
		copyBits.

	^ result.
