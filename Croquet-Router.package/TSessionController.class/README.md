(c) 2006 Qwaq Inc. TSessionController provides authentication based on the fact that both router and controller share a secret (the password hash) which can be used to initiate a secure connection. To log in, the controller only sends the user name to which the router responds with a challenge - namely an encrypted version of the session key and the list facet (both of which are XORed against the password hash). The controller then requests a list of the available facets which, once the router responds to it, completes the authentification phase. Some interesting notes:
* this scheme never transfers either plain or hashes of passwords over the wire
* the only way to determine whether you responded correctly to the challenge by the router is to see whether the facets are actually listed - if the controller just closes the connection you must assume that password is incorrect

Instance variables:
	password	<TSecureID>	The password hash.