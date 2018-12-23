initialize
shutdownIslandSignalHandlers

	island ifNotNil: [ "island" self stopScript: #reflectReplicateValues:into: ]