initialization
setup

	harness := CroquetHarness new.
	contactBroadcaster := TBroadcasterStandalone reset default.
	harness setupMaster.
	harness addOverlay: self.