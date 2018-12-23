loader process
loadNextTFF: tff from: data
	"Load the TForm from the given binary data"
	| form tform |
	form := [Form fromBinaryStream: data readStream] on: Error do:[:ex| ex return: nil].
	tform := TForm new initialize: tff sha form: form 
				mipmap: tff bMipmap shrinkFit: tff bShrinkFit 
				extension: tff extension.
	self updateForm: tform tff: tff.