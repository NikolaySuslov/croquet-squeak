as yet unclassified
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'FFI-Pools';
				package: 'FFI-Kernel';
				package: 'OpenGL-Pools';
				package: 'OpenGL-NameManager';
                package: 'OpenGL-Core' with: [ spec requires: #('FFI-Pools' 'FFI-Kernel' 'OpenGL-Pools' 'OpenGL-NameManager') ];
                package: '3DTransform'
                    with: [ spec requires: #('OpenGL-Core') ];
				package: 'Logging';
				package: 'Script-Preload';
				package: 'Scripting'
                    with: [ spec requires: #('Logging' 'Script-Preload') ];
				package: 'Islands'
					 with: [ spec requires: #('Scripting') ];
				package: 'Croquet-Misc' 
					with: [ spec requires: #('Islands') ];
				package: 'Croquet-Kernel'
					with: [ spec requires: #('Croquet-Misc') ];
				package: 'Croquet-Router'
					with: [ spec requires: #('Croquet-Kernel') ];
				package: 'Croquet-Contacts'
					with: [ spec requires: #('Croquet-Router') ];
				package: 'Croquet-Copier'
					with: [ spec requires: #('Croquet-Contacts') ];
				package: 'Croquet-Objects'
					with: [ spec requires: #('Croquet-Copier') ];
				package: 'Croquet-Demo'
					with: [ spec requires: #('Croquet-Objects') ];
				package: 'Croquet-Window'
					with: [ spec requires: #('Croquet-Demo') ];
				package: 'Croquet-Islands'
					with: [ spec requires: #('Croquet-Window') ];
				package: 'Croquet-Harness'
					with: [ spec requires: #('Croquet-Islands') ];
				package: 'Croquet-Import'
					with: [ spec requires: #('Croquet-Harness') ];
				package: 'Croquet-Embed'
					with: [ spec requires: #('Croquet-Import') ];
				package: 'Croquet-Menus'
					with: [ spec requires: #('Croquet-Embed') ];
				package: 'HedgeHacks-3Body'
					with: [ spec requires: #('Croquet-Menus') ];
				package: 'HedgeHacks-Morphic'
					with: [ spec requires: #('HedgeHacks-3Body') ];
				package: 'HedgeHacks-Painter'
					with: [ spec requires: #('HedgeHacks-Morphic') ];
				package: 'HedgeHacks-Spreadsheet'
					with: [ spec requires: #('HedgeHacks-Painter') ];
				package: 'HedgeHacks-BFD'
					with: [ spec requires: #('HedgeHacks-Spreadsheet') ].
            spec
                group: 'default' with: #('3DTransform' 'HedgeHacks-BFD')]