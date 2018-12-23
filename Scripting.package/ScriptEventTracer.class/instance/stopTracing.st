tracing
stopTracing
	"For now, just uninstall - we might allow repeated evaluation later"
	traceTarget on: traceEvent traceWith: nil. "uninstall"