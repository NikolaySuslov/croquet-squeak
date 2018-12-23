initialize-release
release
	suspended ifNotNil:[suspended resume].
	signaler on: selector unNotify: self.
	suspended := signaler := nil.