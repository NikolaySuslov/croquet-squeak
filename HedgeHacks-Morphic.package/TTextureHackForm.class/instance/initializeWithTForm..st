initialize
initializeWithTForm: tf

	stepping := false.
	rate := self onscreenRate.
	super initializeWithTForm: tf.
	tf texture: self.