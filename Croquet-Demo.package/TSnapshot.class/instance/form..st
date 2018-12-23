accessing
form: aForm
	self signalChanged: #formChanged from: form to: aForm.
	form := aForm.
	update := false.
