public
privateViolation
"Log a warning if this method is called from another class. That is, if you have a ''private'' method and want to know if somebody is calling the private method who shouldn't be, use this"

	(sender receiver == sender sender receiver) ifFalse: [self warn << 'PRIVATE VIOLATION: '; this]