as yet unclassified
mouseTrailFrom: currentBuf 
	"Current event, a mouse event buffer, is about to be processed.  If there are other similar mouse events queued up, then drop them from the queue, and report the positions inbetween."

	^Array with: (currentBuf third @ currentBuf fourth)