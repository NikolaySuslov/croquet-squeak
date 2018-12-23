initialize
initializeWithFileName: fName mipmap: bMM shrinkFit: bSF extension: ext

	tform := TFormManager default addFileNamed: fName mipmap: bMM shrinkFit: bSF extension: ext.
	tform ifNil:[tform := TForm defaultTForm thumb. Transcript cr; show:'TForm File: <'; show: fName; show:'> was not found. Using default texture.' ]. 
	
	self setup.
