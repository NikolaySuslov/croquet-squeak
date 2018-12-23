TFormFind is used to find an image file either locally in cache, or remotely in server, or from another user via the router. It is only used by the TFormManager and is created inside of TFormManager>>#resolve:distance:

sha - sha name used for caching files locally.
url - web based access of object
routerAddress, routerID - used to find the router to ask other users for file.
distance - distance from the camera, used to prioritize search.
bMipmap - is the result mipmapped?
bShrinkFit - is the result shrinkfitted?
extension - any extensions, such as color key?