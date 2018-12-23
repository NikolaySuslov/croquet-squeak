TParticle

This is a very simple particle system.

size - the length or the particle array, determines max number of particles.
pPosition - B3DVector3Array of particle positions
pVelocity - B3DVector3Array of particle velocities
pAcceleration - B3DVector3Array of particle accelerations
pLifetime - number of seconds (floating point) of life that each particle has left
positionRange - the TBox within which new particles get created (see TBox >> #atRandom:)
velocityRange - the 3D velocity range within which the new particles start life.
accelerationRange - the 3D acceleration range applied to each particle on creation.
lifetimeRange - the lifespan range of each particle.
lastTime - for #the stepAt: method, used to determine time between this and the last cycle.
material - what color are the particles.

To use the particle system you do the following:

	ps _ TParticle initialize: ogl size: 1000
	ps setPositionRangeMin:(-0.1@-0.1@-0.1) max: (0.1@0.1@0.1).
	ps setVelocityRangeMin:(-1.2@6.4@-1.2) max:(1.2@9.6@1.2).
	ps setAccelerationRangeMin:(0@-10@0) max:(0@-8@0).
	ps setLifetimeRange: (1500 to: 2000).

These values are called inside of the initialize method, but this is how you would set your one.

If you want the particle system to move, call  self startStepping.

DAS