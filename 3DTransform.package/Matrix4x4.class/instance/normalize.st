transforming
normalize

	self column1: (self column2 cross: self column3) normalized.
	self column2: (self column3 cross: self column1) normalized.
	self column3: (self column1 cross: self column2) normalized.