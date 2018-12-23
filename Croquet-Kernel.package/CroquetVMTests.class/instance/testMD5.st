miscellaneous
testMD5
	"Ensure that MD5 primitive works properly"
	self assert: (self md5Hash: 'a') = 16r0CC175B9C0F1B6A831C399E269772661.
	self assert: (self md5Hash: 'abc') = 16r900150983CD24FB0D6963F7D28E17F72.
	self assert: (self md5Hash: 'message digest') = 16rF96B697D7CB7938D525A2F31AAF161D0.
	self assert: (self md5Hash:
		'abcdefghijklmnopqrstuvwxyz') = 16rC3FCD3D76192E4007DFB496CCA67E13B.
	self assert: (self md5Hash:
		'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') =
		16rD174AB98D277D9F5A5611C2C9F419D9F.
	self assert: (self md5Hash:
		'12345678901234567890123456789012345678901234567890123456789012345678901234567890') =
 		16r57EDF4A22BE3C955AC49DA2E2107B67A.