accessing
generateSHA: byteArray

	^(SecureHashAlgorithm new hashStream: (ReadStream on: byteArray)) radix:36.