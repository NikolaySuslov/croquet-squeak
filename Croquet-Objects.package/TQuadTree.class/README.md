TQuadTree

This is a spatial "loose" quadtree. It is used for fast visibility and collision detection.

A loose octree/quadtree is one where an object is contained in only one octree cell. This cell is smallest cell that can completely contain the object, and the one that contains the "center" of the object. In our case, the one that contains the center of the bound sphere. The object is allowed to overlap onto adjacent cells, thus when we test for collisions, we need to compare to the current cell and all of its adjacents. The advantage is significantly simpler and faster bookkeeping.

To use the TQuadTree just use the initialize method:

#initializeWithSpace: space frame: frame.

This will figure out the proper size of the quadtree from the elements inside of frame and it will place the TBoundSpheres into their proper slots. Then just add the TQuadTree to another frame, usually the TSpace, and you are done.

TRay tests only work if the TRay is a downRay.

The TQuadTree  is a hierarchical structure made up of smaller TQuadTrees. If a TQuadTree is empty, it's value is set to nil in its containing TQuadTree.
quadCenter - the center of this quad.
quadSize - the 2D x,z size of this  quad
quadCorner - the location of the corner
inBox - box containing the centers of objects in this quad
outbox -box containing the entire objects in this quad
radius - radius of the quad
center - center of the quad
spheres - collection of all the bound spheres in this quad
depth - maximum depth of quad tree
qtTL - quad tree Top Left 
qtTR - quad tree Top Right
qtBL - quad tree Bottom Left
qtBR - quad tree Bottom Right
boundSphere - bound sphere of the quad
quadOn - flag for rendering. If false, just render normally.
 
DAS