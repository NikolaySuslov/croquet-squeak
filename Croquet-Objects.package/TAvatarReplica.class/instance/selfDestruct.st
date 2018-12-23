step
selfDestruct
	"If we haven't gotten any messages in the last five seconds, self-destruct"
	| nowTime delta |
	nowTime := Processor activeIsland time.
	delta := nowTime - lastAliveTime.
	delta > aliveTimeout ifTrue:[^self destroy].
	(self future: 30000) selfDestruct.	 "Check every 30 seconds."