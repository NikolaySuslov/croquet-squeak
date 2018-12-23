TPortal3D are a kind of 3D portal. They render a miniature version of a space (or a subset of it). The content of this portal can be manipulated normally.


toSpace - the space we are rendering inside of the TPortal3D
inPortal - used to avoid recursion for now. At some point, we can use this as a recursion counter instead.
scale - scale at which we render the contents of the portal. This can be anything, even a number larger than 1.0. It is initially 0.05.
scaleInverse - the 1.0/scale inverse saved for performance.
transform - the offset position and orientation of the space that we render from. That is, this offset value represents where in the space we render at the center point of the TPortal3D
clipBox - the five sided box that contains the TPortal3D and clips it. I would use six sides, but I need one for the 2D portals. 
boundSphere - the usual suspect
bounsChanged
cube - a subtle cube mapped over the TPortal3D to indicate its presence. 

DAS