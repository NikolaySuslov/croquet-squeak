message sends
get: aSymbol

	"Shorthand version of foo send:[:x| x aSymbol].
	Returns nil on any error (usually indicates absence of the field.)
	Note: this differs from Object/CObject get: in that
	the selector is invoked, rather than treated as an instance variable name."

	[[
		^ self syncSend: aSymbol withArguments: #()
	 ] on: MessageNotUnderstood do: [ :ex |

		"Silently return nil - there's no such selector."
		ex return

	]] on: Error do: [ :ex |

		"Something's wrong... report the problem, nondisruptively,
          since we don't want to pollute this Island with other's problems."

		Transcript cr; show: 'Error in TFarRef#get: ', ex description.
		ex return
	].
	^nil