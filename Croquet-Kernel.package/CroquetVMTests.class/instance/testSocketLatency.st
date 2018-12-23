socket tests
testSocketLatency
	| results |
	results := self quickLatencyTest.
	Transcript cr; show: '-------------------- testSocketLatency -------------------'.
	Transcript crtab; show: 'Avg. send time: ', results first.
	Transcript crtab; show: 'Max send time: ', results second.
	Transcript crtab; show: 'Avg. baseline time: ', results third.
	Transcript crtab; show: 'Max baseline time: ', results fourth.
	self should: [results first < 5.0] "average time should be well under 5 msec"
