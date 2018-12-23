as yet unclassified
outputTo: adapter

	mutex critical: [

		next to: history size do: [ :n | (history at: n) ifNotNilDo: [ :msg | msg sendTo: adapter ] ].
		1 to: next - 1 do: [ :n | (history at: n) ifNotNilDo: [ :msg |  msg sendTo: adapter ] ].
	
	].