copying
import: data to: dstIsland
	| importer |
	importer := dstIsland future new: TIslandCopyImporter.
	^importer future importData: data.
