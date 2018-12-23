comparing
hash
	^ ((((((self sid hash
		bitXor: self time hash)
		bitXor: self id hash)
		bitXor: self sender hash)
		bitXor: self receiver hash)
		bitXor: self selector hash)
		bitXor: self arguments hash)
