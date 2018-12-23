TPostCard is used to find a Croquet router. The method it uses is:

Looks up the routerAddress. If this is a valid address, it will initiate a connection. If it is nil, it will look for the router matching the routerName/routerID on the LAN.

Once the router has been discovered, the Island is synced.

These instance variables MUST be left as references. Every element in them must exist inside of an Island that may be replicated. There can be no controllers or FarRefs placed into this object. The standin must be constructed by the containing Island.

routerAddress
routerID - the routerID is a unique ID associated with a single Island with which it should share the same ID and name.
routerName - the routerName is a user created name that can describe the Island/Router group and help the user find the router again.
viewpointName - the name of an entry point into the island. This will typically be a TFrame of some sort.
viewpointIndex - this is a name constructed of (routerID,viewpointName) and is used to index into a dictionary of viewpoints when rendering. It is a unique name that can be replicated.
standin