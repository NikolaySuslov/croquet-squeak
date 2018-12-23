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
                    with: [ spec requires: #('OpenGL-Core') ].
            spec
                group: 'default' with: #('3DTransform')]