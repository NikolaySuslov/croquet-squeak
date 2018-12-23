router tests
testMasterStage2
	"Log in as admin"
	self testMasterStage1.
	self loginAdmin: controller.