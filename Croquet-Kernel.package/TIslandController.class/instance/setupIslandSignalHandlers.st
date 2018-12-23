initialize
setupIslandSignalHandlers

	island ifNotNil: [ self runScript: #reflectReplicateValues:into: when: {island . #collectReplicateValues}. ]
