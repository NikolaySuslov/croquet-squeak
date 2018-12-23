construct
calcTree: verts faces: faces depth: depth

	| bx epsilon |

" 
CONSTRUCTION FOR SPHERE HIERARCHY

This method is used to compute a heirarchy of bounding spheres for a complex object. This allows for extremely fast picking and collision detection. The object is broken into octrees if the ratio of sides permits. Long thin objects tend to be split into two parts, flat objects into four.

	1.	This is a top down approach. I use aligned boxes (TBox) as the basis of the
		construction, given the assumption that when the boxes are small enough
		their shape and relative orientation doesn't matter as long as they
		completely cover the object. We will construct spheres from these boxes
		(or cubes) that only contain the contents of the cubes, hence, overlap
		is not much of an issue.
	2.	Once the top level containing box is calculated from the underlying objects
		vertices (TBox>>#max is the maximum value corner and TBox>>#min is the
		minimal value corner), we slice the object into smaller boxes and recurse.
		This slicing is only done along the 'longer' dimensions, hence a long
		thin object may only be sliced once perpendicular to its long axis, 
		a flat object may only be sliced twice each perpendicular to each other.
		We determine whether a dimension is 'sliceable' based upon the ratio of
		its length relative to the other dimensions.
	3.	The recursion first determines which surfaces of the containing box 
		overlap the resulting bounding box. These resulting values are stored as 
		an array for use in the same way by the children of this box.
	4.	We test the depth of the recursion at this stage. If the depth is zero or
		the number of surfaces that we overlap is zero we stop the recursion. If
		this cube does not contain any surfaces its parent will delete it.
	5.	Inside the recursion, we determine which of the set of faces overlap
		this box. Once we know this, we calculate the bounding box of these
		surfaces. We then take the intersection between this box and the 
		previously constructed box from the parent. This can only be the same
		size or smaller, which improves the accuracy of the bounding box 
		representation of the object and further improves its value in 
		collision detection.
	6.	Once we construct the child cubes, we calculate the minimal bounding boxes
		of these in attempt to make the current cube size even smaller.
	7.	The last thing to do here is if this cube covers four faces or less, we
		shouldn't bother testing the children, and go directly to these surfaces.
		We set this cube to be a leaf node and destroy all of the children.
	8.	And now, the things we have been waiting for. We construct the sphere
		tree from the cube tree recursively (of course). The boolean leaf value indicates
		whether or not this is a leaf sphere, hence its children are faces.


We use the TBox class to help us out here. The TBox class defines a min and max corner and has a number of useful methods to simplify the code here."

	bx := TBox new.
	faces do:[:f| bx growVertex: (verts at: 1+f).].
" Grow by epsilon to make sure the box has some depth - otherwise, it will fail to construct good boxes."
	epsilon := 0.000001.
	bx growVertex: bx min - (Vector3 x: epsilon y: epsilon z: epsilon).
	bx growVertex: bx max + (Vector3 x: epsilon y: epsilon z: epsilon).
	self calcTree: verts faces: faces box: bx depth: depth.				
	globalPosition := Vector3 new.

	