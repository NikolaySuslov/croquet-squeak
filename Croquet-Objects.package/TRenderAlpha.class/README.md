This class is used to render the alpha (transparent) objects. As an alpha object is found, a TRenderAlpha object is created that includes:
tObject - the object
transform - the object's OpenGL global transform
distance - the distance from the TCamera used for sorting
parent - its parent frame (if needed - until we remove multiple parents from the system)

DAS