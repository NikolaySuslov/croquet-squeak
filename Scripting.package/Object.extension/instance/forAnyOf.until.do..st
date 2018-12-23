*Scripting-Extensions
forAnyOf: eventSpec until: stopCondition do: aBlock			 
	"Evaluate aBlock whenever any of the events in eventSpec is triggered"
	^self forAnyOf: eventSpec do: aBlock until: stopCondition