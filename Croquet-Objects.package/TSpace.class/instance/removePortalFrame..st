frameManagement
removePortalFrame: prtlFrm

	portalFrames remove: prtlFrm.
	"portalFrames doWithIndex:[ :pf :i| pf = prtlFrm ifTrue: [portalFrames remove: i]]."