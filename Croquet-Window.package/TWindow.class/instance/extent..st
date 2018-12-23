accessing
extent: ext

	| sz |

	rectFront extent: ext.
	sz := rectFront extent asPoint. " The rectFront might have something to say about this..."
	rectBack extent: sz.
	windowFrame extent: sz.
	windowButtons extent: sz.
	saveContents ifNotNil:[saveContents extent: sz].
