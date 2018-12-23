accessing
withGcDataDo: doBlock

	^gcData ifNotNil: [ doBlock value: gcData]