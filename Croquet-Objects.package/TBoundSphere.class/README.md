This is the main bounds test object. It is used for object culling against view planes, ray testing, and for collision detection. It is defined heirarchically for the collision detection and object picking algorithms. At the moment, this is one of the slower objects to calculate with complex meshes. We need to turn much of this code into primitives. Also, there are a number of instance variables that may go away or be used in a slightly different way. 

Currently, the TBoundSphere global position is set at render time. This is because this is a more efficient method and it also presumes that a TFrame may be instanced in a scene (that is, it may appear as the child of more than one object). If we move to a seperate pass for determining ray collisions, then we will no longer be able to instance TFrames, and the global positions of the TBoundSpheres will need to be set by the TFrame when it's own globalPosition is updated.

Other instance variables are:

radius - the radius of the sphere, which should include all of the associated TFrame contents.
radiusSquared - the square radius, here for performance.
children - complex objects often have a need for a heirarchical collection of bound spheres for quick collision tests. These children are also TBoundSpheres.
vertices - if the contained object is a TMesh, then the leaf children contain copies of the vertex information.
box - in computing the bound sphere hierarchy, we utilize TBoxes in an octree subdivision. We keep these around for now, though they can probably be tossed out.
normal - this is to be used by the hierarchical collision detection method. This is the best fit normal to the surface vertices contained in the sphere.
up and side are the two perpendicular vectors to the normal. 
offset - to be used by the hierarchical collision method, this is the offset of the normal from the sphere center representing the closest fit to the contained faces.

DAS
	

