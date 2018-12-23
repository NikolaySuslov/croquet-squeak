This log emitter has a threshold. If log messages comes in that are higher than the threshold we send an email to an address with the log message. We then set a timer and any messages coming in over the threshold until the timer has run out we bundle together in another email, send it and set the timer again.

If the timer runs out and there are no buffered messages we are done. This approach prevents drowning in emails.

Use like this:

SLLogWatchDog
	fromEmail: 'mysystem@brrrrrrrrrrr.org';
	toEmail: 'me@brrrrrrrrrrr.org';
	start

Stop:

SLLogWatchDog stop