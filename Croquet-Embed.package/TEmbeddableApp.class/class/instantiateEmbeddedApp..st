instance creation
instantiateEmbeddedApp: appRef
	"Instantiate the associated embeddable app"
	| appData appExtent |
	appData := appRef get: #appData.
	appExtent := (appRef get: #appExtent).
	^self new initialize: appRef data: appData extent: appExtent