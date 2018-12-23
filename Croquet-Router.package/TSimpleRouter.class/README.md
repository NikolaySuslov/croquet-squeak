I am a simplified router which exposes all the facets if provided with the right login facet. I can be used for testing Croquet in an environment where actual authorization schemes haven't been chosen. For now, TSimpleRouter can be provided with a set of user names/passwords or their md5 hashes for authentification.

The model provided here is overly simplified since we NEVER want to give unrestricted access to anything in a real-life use. But for now it is convenient while we're looking for better ways of doing it.
