copying
export: anObject
	| exporter |
	exporter := TIslandCopyExporter new.
	exporter export: anObject.
	^exporter contents.