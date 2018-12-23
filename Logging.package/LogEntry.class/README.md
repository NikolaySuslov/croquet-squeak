an entry in a log file

properties <Dictionary>: arbitrary properties the formatter can display how it wants
stamp <DateAndTime>: the log entry timestamp
line <String>: the text of the log entry
level <Symbol>: the verbosity level of the message. Their meaning is defined in LogCurrent
category <Symbol>: a classification of this message, mostly for filtering purposes
sender <ContextPart>: The active stack frame that is making this entry
pid <Integer>: an identifier for the running process; default is "Processor activeProcess identityHash"
source <Object>: the object making this log entry; default is "sender reciever"
processDescription <String>: a description of what the process that made this entry is doing
