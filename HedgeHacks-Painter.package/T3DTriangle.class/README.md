| faces points |
points _ (0 to: 35) collect:[:i| 
	(B3DRotation angle: i*5 axis: 0@0@1) asMatrix4x4 localPointToGlobal: (20@0@0)].
points _ points collect:[:v3| v3 x @ v3 y].
points _ {300@196. 299@205. 297@210. 296@212}.
faces _ PoohTriangle basicNew elevateFan: points to: 246@158@74 steps: 8.
faces _ B3DSimpleMesh withAll: faces.
(B3DSceneExplorerMorph new openInWorld) scene withGeometry: faces asIndexedMesh.
