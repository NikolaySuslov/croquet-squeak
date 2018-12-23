TLoad3DSMax Notes:

There are two parts to the class - the parse routines and everything else. The actual #parse: method creates a block hierarchy - essentially a kind of parse tree, from the inputs. 3DS is somewhat regular in its construction, but there are a few things to be careful about. The tree that gets constructed is made up of a field name and a field. The field names are tokenized 3DS field names and the field is the child tree or the actual text field data - not parsed into actual numbers or anything yet. One improvement on performance might be to interleave this step with the next.

Once the tree exists, a second pass is made that converts the text fields and constructs the actual frame hierarchy. The field name of each node is matched and the appropriate #make****: routine is called on its contents. 

Once a raw mesh is set up inside the #makeGeometry: method, the #reconstruct: method is called. This does a lot of massaging and optimization of the raw vertices - including aliasing, etc. 

Anyway, start at:
	#initialize: fileName: scale: shadeAngle: textureMode: 

Based upon the field names in the tree constructed in #parse: you just make the call to the next #makeXXX:.

- Though we have all of the transforms for the heirarchy, the actual locations of the meshes is already transformed. If I can think of a good reason to un-transform the mesh elements and then add the transform to the actual frame, I will do it. For now, treat it as a solid body.

- The texture rotations are face centered. This requires an offset of 0.5, the rotation, and then putting it back. Not sure if I really want to pre-transform the texture uv coordinates. Also, not sure if this is already done, as the meshes are.

- This class will act as a template for importers, though they all seem so different that this may be easier said than done.

- This object is actually never rendered, and really doesn't need to be a subclass of TFrame.

DAS