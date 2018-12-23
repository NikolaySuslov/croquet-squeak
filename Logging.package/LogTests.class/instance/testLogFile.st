as yet unclassified
testLogFile
	
	"
	self debug: #testLogFile.
	"
	| levels all some crlf |

	LogCurrent value: LogCurrent new. 
	


	crlf := String with: Character cr with: Character lf.
	levels := {#emergency. #alert. #critical. #error". #warning. #notice. #info. #debug"}.
	FileDirectory default deleteFileNamed: 'testall.log'; deleteFileNamed: 'testsome.log'.
	all := (LogFile named: 'testall.log') output: [:entry |
			entry level , ': ', entry line, ' (', entry sender methodClass name, ')'].

	some := (LogFile named: 'testsome.log') output: [:entry |
				((levels includes: entry level) and: 
				[entry line beginsWith: 'makl'] and:
				[entry sender notNil]) ifTrue: [
					entry level, ': ', entry line, ' (', entry sender methodClass name , ')'
				]
			].
		
	LogCurrent adapters add: all; add: some.	
		
	"Do some stuff"
	self log info: 'Testing info'.
	self log warn: 'Testing warning'.
	self log error: 'makl cannot code!'.
	
	LogCurrent value: nil.

	all := (FileDirectory default) oldFileNamed: 'testall.log'.
	some := (FileDirectory default) oldFileNamed: 'testsome.log'.
	self assert: (all contents  = 	('---------------------------', crlf,
								'info: Testing info (LogTests)', crlf, 
								'warn: Testing warning (LogTests)', crlf, 
								'error: makl cannot code! (LogTests)', crlf)).
	self assert: (some contents = 	('---------------------------', crlf,
								'error: makl cannot code! (LogTests)', crlf)).
	all close.
	some close.

	FileDirectory default deleteFileNamed: 'testall.log'; deleteFileNamed: 'testsome.log'.