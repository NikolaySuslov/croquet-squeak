extensions
extensions
	"answer a set of extension strings for this renderer"
	| version |
	^extensions ifNil:[
		extensions := self reportedExtensions.

		"Many extensions are implicit in the reported OpenGL version and may not be reported via the extensions. There seems to be no rule for this - I have seen some extensions listed, some not, so we simply add all of them based on the OpenGL version we find here."
		version := self version.

		version >= 1.1 ifTrue:[
			extensions addAll: #(
				#'GL_EXT_blend_logic_op'
				#'GL_EXT_copy_texture'
				#'GL_EXT_polygon_offset'
				#'GL_EXT_subtexture'
				#'GL_EXT_texture'
				#'GL_EXT_texture_object'
				#'GL_EXT_vertex_array'
			).
		].

		version >= 1.2 ifTrue:[
			extensions addAll: #(
				#'GL_EXT_bgra'
				#'GL_EXT_blend_color'
				#'GL_EXT_draw_range_elements'
				#'GL_EXT_packed_pixels'
				#'GL_EXT_rescale_normal'
				#'GL_EXT_separate_specular_color'
				#'GL_EXT_texture3D'
				#'GL_SGIS_texture_edge_clamp'
			).
		].

		version >= 1.3 ifTrue:[
			extensions addAll: #(
				#'GL_ARB_multisample'
				#'GL_ARB_multitexture'
				#'GL_ARB_texture_border_clamp'
				#'GL_ARB_texture_compression'
				#'GL_ARB_texture_cube_map'
				#'GL_ARB_texture_env_add'
				#'GL_ARB_texture_env_combine'
				#'GL_ARB_texture_env_dot3'
				#'GL_ARB_transpose_matrix'
			).
		].

		version >= 1.4 ifTrue:[
			extensions addAll: #(
				#'GL_ARB_point_parameters'
				#'GL_ARB_texture_env_crossbar'
				#'GL_ARB_window_pos'
				#'GL_EXT_blend_func_separate'
				#'GL_EXT_fog_coord'
				#'GL_EXT_multi_draw_arrays'
				#'GL_EXT_secondary_color'
				#'GL_EXT_stencil_wrap'
				#'GL_NV_blend_square'
				#'GL_SGIS_generate_mipmap'
				#'GL_ARB_depth_texture'
				#'GL_ARB_shadow'
				#'GL_ARB_texture_mirrored_repeat'
				#'GL_EXT_texture_lod_bias'
				#'GL_SGIS_texture_lod'
			).
		].

		version >= 1.5 ifTrue:[
			extensions addAll: #(
				#'GL_ARB_vertex_buffer_object'
				#'GL_ARB_occlusion_query'
				#'GL_EXT_shadow_funcs'
			).
		].

		extensions].