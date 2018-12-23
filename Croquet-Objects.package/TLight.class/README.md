TLight

- Spaces. Each space can contain any number of lights, but only the closest eight are actually enabled, with the furthest two linearly fading depending upon distance ratios. The limit of eight lights is a hard coded issue with OpenGL. The lights and their frames are stored in an array in the TSpace object. When a TSpace is rendered, it activates the lights first.

- Visibility. Lights are render objects that can be visible or not. This is to help in placing them. A visible light is represented either with a TSphere for positional, a TCylinder for spot, or two TCylinders for directional. These objects are rendered with an alpha value in the color of the light. 

- Locality. A light can be applied only to a frame and its children by setting local to true. Otherwise, it is global to the containing space.

- Attenuation. This assumes constant attenuation for performance reasons.


Things to do:

	- Need to utilize material types for rendering light objects.

type - the kind of light this is.
	#directional - light is positioned at infinity, rays are parallel.
	#point - light is positioned at a specific point location and radiating from this.
	#spot - point light with a focus in a specific direction - a spot light
local - (I don't remember what this is for)
position - OpenGL position flag.
ambientColor - 
diffuseColor - 
specularColor -		light type
spotDirection - 
spotExponent -
spotCutoff -
renderObject - object to use when we render the light. The actual object is determined by the light type.
distance - used to determine the distance from the camera for sorting.

DAS