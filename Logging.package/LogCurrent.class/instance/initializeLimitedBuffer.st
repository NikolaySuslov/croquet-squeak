initialize-release
initializeLimitedBuffer

	stream := (LimitedWriteStream on: (String new: self defaultBufferSize)).
	stream setLimit: self defaultBufferSize limitBlock: nil.