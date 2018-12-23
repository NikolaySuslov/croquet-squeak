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
					with: [ spec requires: #('Croquet-Router') ].
            spec
                group: 'default' with: #('3DTransform' 'Croquet-Contacts')]