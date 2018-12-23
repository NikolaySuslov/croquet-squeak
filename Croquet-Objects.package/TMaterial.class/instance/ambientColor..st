accessing
ambientColor: ac

	| acol |
	acol := ac.
	acol class = Color ifTrue:[acol := acol asVectorColor].
	acol class = TranslucentColor ifTrue:[ acol := acol asVectorColor].
	acol size = 3 ifTrue:[acol := acol@ambientColor alpha].
	ambientColor := acol asVectorColor.	