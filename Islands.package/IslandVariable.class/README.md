I am a variable which can be used with islands for global, class, or pool variables. I manage my value so that the isolation layers between islands stay intact. If the object stored in me is not a passByIdentity: object I store a far reference to the object. When reading my value the far reference gets resolved in the context of the reader's island. Unless used with passByIdentity: objects, island variables are fairly slow.

[**** TBD: We should have an shared variable which ONLY stores passByIdentity: objects and raises an error when anything else is being stored. Then we can actually use that variable directly so reads are zero overhead. IslandVariable would then be the slow default version. ****]

[**** TBD: If we do this, we should have a menu just like for fields and be able to do this on the basis of individual class vars ****]
