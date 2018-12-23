importing
import: dataSet migratingTo: newInstance
	"Import the given data set migrating to a reshaped instance of the original class described in the data set"
	| map value mapped |
	map := reshapeMap at: newInstance class ifAbsentPut:[
		map := newInstance class allInstVarNames.
		dataSet instShape collect:[:iv| map indexOf: iv]].
	1 to: dataSet size do:[:i|
		value := self remap: (dataSet at: i).
		mapped := map at: i.
		mapped > 0 ifTrue:[newInstance instVarAt: mapped put: value].
	].
