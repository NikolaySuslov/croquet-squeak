accessing
diffuseColor: dc

	| dcol |
	dcol := dc.
	dcol class = Color ifTrue:[ dcol := dcol asVectorColor].
	dcol class = TranslucentColor ifTrue:[ dcol := dcol asVectorColor].
	dcol size = 3 ifTrue:[dcol := dcol@diffuseColor alpha].
	diffuseColor := dcol asVectorColor.