class initialization
initialize
	"TCryptoRandom initialize"
	PoolWords := 128.    "Power of 2 - note that this is 32-bit words"
	PoolMask := PoolWords-1.
	PoolBits := PoolWords * 32.

	"The pool is stirred with a primitive polynomial of degree 128
	over GF(2), namely x^128 + x^99 + x^59 + x^31 + x^9 + x^7 + 1."
	TAP1 := 99.     "The polynomial taps"
	TAP2 := 59.
	TAP3 := 31.
	TAP4 := 9.
	TAP5 := 7.

	TwistTable := #(
		16r00000000	16r3B6E20C8	16r76DC4190	16r4DB26158
		16rEDB88320	16rD6D6A3E8	16r9B64C2B0	16rA00AE278
	).

	Default := self new.
