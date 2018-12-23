The CroquetEvent includes a complete description of a user event including which mouse and keyboard buttons have been selected, a complete description of the 3D target objects inside of the selection, and the avatarID. It is the object passed to the Croquet objects to act upon when an event occurs.

The shiftPressed instance variable is there because the mouse scrollwheel does not return the correct value of the shift key. This requires a fix of the VM at some later date.

DAS