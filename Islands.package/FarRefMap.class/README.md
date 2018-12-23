FarRefMap maps objects to their associated far refs. It is essentially a mixture of dictionary and set. 

[**** TBD: Fix this so that we're not having the array be roots for almost all the refs being stored in it (it defeats the point of using weak refs after all) ****]
[**** TBD: Fix this so we're not endlessly growing the array ****]

