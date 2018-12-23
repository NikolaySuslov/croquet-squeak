Architecture:
================

LogCurrent the class is also a ProcessSpecific variable that returns an different instance of LogCurrent for each process. Each of these maintains a buffer for that process's log output.

Users use 'self log' to obtain a LogCurrent buffer instance for the current process from 'LogCurrent value'. Since LogCurrent buffers are per-process they are threadsafe, and can maintain state between calls (self log properties).

Each LogCurrent instance maintains a stream (on its buffer) and provides the users front end interface for convenient logging.

Each LogCurrent instance maintains an adapter, when a log line is completed (#endEntry), the line is sent to the adapter, the adapter being the backend interface.

The adapter may be any class that implements  #logTime: stamp line: line level: level category: category sender: sender pid: pid
e.g. Transcript.

The adapter may also be a LogAdapterSet, in which case, the line is sent to each adapter contained in the set in turn. LogAdapterSets may be used to allow a number of processes to share the same set of adapters. LogAdapterSets may be arbitrarily nested, and may define a filterBlock. e.g. self filterBlock: [ :level :category |  #(#error #debug #info) includes: level ]. AdapterSet may be subclassed if more specific filtering behaviour is required.

Any changes to LogAdapterSets anywhere are protected by a single Semaphore, but use of adapters for output is protected instead by using a safer implementation of #do: to iterate over the set should an adapter be removed by a different thread.

All processes that do not have a LogCurrent instance defined will copy the default LogCurrent instance, and will therefore share the same adapter/adapterset as the default.

When you assign a bespoke  LogCurrent instance to a specific process, it is up to you to set its adapter. It can include the global adapter/adapterset, nested within the new set you give it.

Additional logging utilities and tools may be defined by subclassing LogCurrent. LogAdapterSet may be subclassed to provide more interesting filtering behaviour. And individual Adapters may also be configured or subclassed as desired.

Adapters:
===========

1) LogHistory e.g. LogHistory size: 20.
If the LogHistory adapter is present in a LogAdapterSet, then any new adapters added to that set have the recorded history sent to them immediately. Only one LogHistory adapter per set is allowed.

2) Blocks, LogAdapterSet may contain a block which returns a real adaper or nil. This enables adapters to be written to if enabled, or ignored if not available (see SLLogMorph below).

3) Transcript - the standard Transcript is used, and the line is output in one hit within the Transcripts own protection semaphore.  

4) LogEngine e.g. LogEngine for: 'seaside'.
This adapter is for the LogEngine backend.

5) SLLog
This adapter is for the SimpleLog backend.

6) Toothpick
This adapter is for the Toothpick backend. (Not yet supported)

Direct to 'SimpleLog' Components
7) SLSyslogSender e,g, SLSyslogSender new addHost: 'log.somewhere.else'.
or SLSyslogSender localhost.

8) SLLogWatchdog e.g. SLLogWatchdog default.
Emails log entries over the given threshold

9) SLLogMorph e.g. [ SLLogMorph current ].
The block will be evaluated for every log entry. Therefore this construct
will only write to LogMorph if it is open.

10) SLLogFile named: 'current.log'.
Subclass and override #output*, or add #output* methods for additional file output formats.
Or use (SLLogFile named: 'custom.log') output: [ :entry | entry stamp, '-', entry line ]

Configuration:

To change the global, or local LogCurrent instance

LogCurrent default: MyLogBuffer new
LogCurrent value: MyLogBuffer new

To change the global adapters:

LogCurrent default adapter: (LogAdapterSet with: Transcript).
LogCurrent default adapter add: (LogHistory size: 20).

To change the local adapter, logging to the current global adapters, and the local transcript, with a custom policy.

newLog := MyOwnLogCurrent new.
newLog adapter: (LogAdapterSet with: (LogCurrent default adapter) with: Transcript).
LogCurrent value: newLog.

Usable LogCurrent instance is returned from <code>self log<code> in whatever context it is used. The buffer is instanciated on a per process basis, therefore I am threadsafe already, and can reuse my buffers and maintain state as we progress through the code which we are logging. Unusually for a logging framework this allows us to perform timing tasks for our clients. If the code forks then a new buffer instance will handle the new forked process.

For timing use:

= self log timeTotal: #eventA.
= self log timeDelta: #eventB.

Convenient usage: 'annotated values'

This uses the logging level defined by LogRouter-temp, and is considered a temporary log message for debugging purposes. For temporary log messages the specific level is rarely important. There is by default a global preference for disabling temporary log level messages. Of course your subclasses can override this behaviour.

= self log x: 10 y: 20 z: 30.

To select a specific log severity level (i.e. not the temporary one featured above).

= self log info x: 10 y: 20 z: 30.

To log the current method's input parameters.

Rectangle-#corner: topLeftPoint extent: heightWidthPoint

= self log debug this.

would be the same as

= self log corner: topLeftPoint extent: heightWidthPoint.

To log the current methods variables:

= self log debug it instance.
= self log debug it temps.
= self log debug it classVar.
= self class log debug it instance.
= self log debug vars all.

Levels of detail:

When logging it is useful to be able to specify easily the level of detail that we desire from the items we are given.
Here we define 4 levels of detail.

1. Annotated values: the data points are simple values intended to be displayed on one line.
the method selector is used to annotate the vaues for readability.

= self log info r: 20 theta: 0.5.

2. Verbatim: Stream to the Log

= (self log info << 'User Directory:' << aFilePath) write.

3. Detailed: human readable presentation: A detailed presentation of the objects internal state intended for human readability.
    The detail printed is based upon the object's explorer contents, as defined in #logDetailedOn:

= self log info detailed: myDictionary.

4. Data Dumper: A machine readable serialized text format.
    The format printed is defined in #logDumperOn:

    For those perl coders out there who really like being able to recreate their data from logs!

= self log info dumper: myTransaction.
