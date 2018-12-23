A Croquet specific FarRef. Does ->NOT<- allow immediate messages to pass through automatically. Use only in conjunction with #future or #send, e.g.,
	ref := island send avatar.
	ref future translation: 100@0@100.
	trans := ref send:[:obj| obj translation]. "<- this will likely NOT be 100@0@100"
