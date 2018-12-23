accessing
makeSnapshot: space angle: yval translation: t
	| trans snapshot |
	trans := Matrix4x4 identity.
	trans rotationAroundY: yval.
	trans translation: t.
	snapshot := TSnapshot new space: space transform: trans.
	snapshots add: snapshot.