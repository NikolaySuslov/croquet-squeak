To use Toothpick logging.

Toothpick event basics:

category - any symbol
level - one of #(#all #debug #info #notice #warn #error #crit #alert #emerg #panic #fatal #off #none)

Messages are not size limited in toothpick, so.. #cr is rendered inline.
However since we reuse our buffer, we consider > bufferMax (10K) to be exceptional, and reinitialize it
if this is exceeded.

All of these levels are natively supported by the toothpick adaptor. 
Other adaptors will accept these levels on their own terms!

usage:

self log info database query: sqlQuery.
self log database info query: sqlQuery.

Where database is interpreted as a category, and query: is used as an annotation.





