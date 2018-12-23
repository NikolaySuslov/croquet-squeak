as yet unclassified
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'FFI-Pools';
				package: 'FFI-Kernel';
                package: 'OpenGL' with: [ spec requires: #('FFI-Pools' 'FFI-Kernel') ];
                package: '3DTransform'
                    with: [ spec requires: #('OpenGL') ].
            spec
                group: 'default' with: #('3DTransform')]