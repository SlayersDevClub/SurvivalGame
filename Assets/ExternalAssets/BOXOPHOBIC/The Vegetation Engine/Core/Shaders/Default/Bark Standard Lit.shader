// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Default/Bark Standard Lit"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Render Settings, 5, 10)]_CategoryRender("[ Category Render ]", Float) = 1
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,Same,2)]_RenderNormals("Render Normals", Float) = 0
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Render Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Space(10)]_RenderDirect("Render Lighting", Range( 0 , 1)) = 1
		_RenderAmbient("Render Ambient", Range( 0 , 1)) = 1
		_RenderShadow("Render Shadow", Range( 0 , 1)) = 1
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Alpha To Mask", Float) = 0
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceRenderFade("# Space Render Fade", Float) = 0
		_FadeConstantValue("Fade Constant", Range( 0 , 1)) = 0
		_FadeCameraValue("Fade Proximity", Range( 0 , 1)) = 1
		[StyledCategory(Global Settings)]_CategoryGlobals("[ Category Globals ]", Float) = 1
		[StyledMessage(Info, Procedural Variation in use. The Variation might not work as expected when switching from one LOD to another., 0, 10)]_MessageGlobalsVariation("# Message Globals Variation", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		_OverlayProjectionValue("Overlay Projection", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceGlobalOptions("# Space Global Options", Float) = 0
		[StyledToggle]_ExtrasPositionMode("Use Pivot Position for Extras", Float) = 0
		[StyledCategory(Main Settings)]_CategoryMain("[Category Main ]", Float) = 1
		[StyledMessage(Info, Use the Main Mask remap sliders to control the mask for Global Color__ Gradient Tinting and Subsurface Scattering. The mask is stored in Main Mask Blue channel. , 0, 10)]_MessageMainMask("# Message Main Mask", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainNormalTex("Main Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		_MainAlbedoValue("Main Albedo", Range( 0 , 1)) = 1
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_MainMaskMinValue, _MainMaskMaxValue, 0, 1, 0, 0)]_MainMaskRemap("Main Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Detail Settings)]_CategoryDetail("[ Category Detail ]", Float) = 1
		[StyledMessage(Info, Use the Detail Mask remap sliders to control the mask for Global Color__ Gradient Tinting and Subsurface Scattering. The mask is stored in Detail Mask Blue channel., 0, 10)]_MessageSecondMask("# Message Second Mask", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[Enum(Overlay,0,Replace,1)]_DetailAlphaMode("Detail Alpha", Float) = 1
		[Space(10)][StyledToggle]_DetailFadeMode("Use Global Alpha and Fade", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondNormalTex("Detail Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Enum(Main UVs,0,Detail UVs,1,Planar UVs,2)][Space(10)]_SecondUVsMode("Detail UVs", Float) = 0
		[StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[HDR]_SecondColor("Detail Color", Color) = (1,1,1,1)
		_SecondAlbedoValue("Detail Albedo", Range( 0 , 1)) = 1
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondOcclusionValue("Detail Occlusion", Range( 0 , 1)) = 0
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_SecondMaskMinValue, _SecondMaskMaxValue, 0, 1, 0, 0)]_SecondMaskRemap("Detail Mask Remap", Vector) = (0,0,0,0)
		[Space(10)]_DetailValue("Detail Blend Intensity", Range( 0 , 1)) = 1
		_DetailNormalValue("Detail Blend Normals", Range( 0 , 1)) = 1
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blend Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailBlendMinValue("Detail Blend Min", Range( 0 , 1)) = 0.4
		[HideInInspector]_DetailBlendMaxValue("Detail Blend Max", Range( 0 , 1)) = 0.6
		[Enum(Vertex Blue,0,Projection,1)][Space(10)]_DetailMeshMode("Detail Surface Mask", Float) = 0
		[StyledRemapSlider(_DetailMeshMinValue, _DetailMeshMaxValue,0,1)]_DetailMeshRemap("Detail Surface Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMeshMinValue("Detail Surface Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMeshMaxValue("Detail Surface Max", Range( 0 , 1)) = 1
		[Enum(Main Mask,0,Detail Mask,1)]_DetailMaskMode("Detail Texture Mask", Float) = 0
		[StyledRemapSlider(_DetailMaskMinValue, _DetailMaskMaxValue,0,1)]_DetailMaskRemap("Detail Texture Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMaskMinValue("Detail Texture Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMaskMaxValue("Detail Texture Max", Range( 0 , 1)) = 1
		[HideInInspector]_second_uvs_mode("_second_uvs_mode", Vector) = (0,0,0,0)
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 1
		[StyledMessage(Info, Use the Occlusion Color for tinting and the Occlusion Alpha as Global Color and Global Overlay mask control. The mask is stored in Vertex Green channel. , 0, 10)]_MessageOcclusion("# Message Occlusion", Float) = 0
		[HDR]_VertexOcclusionColor("Occlusion Color", Color) = (1,1,1,0.5019608)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1, 0, 0)]_VertexOcclusionRemap("Occlusion Remap", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Occlusion Min", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Occlusion Max", Range( 0 , 1)) = 1
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 1
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Noise Settings)]_CategoryNoise("[ Category Noise ]", Float) = 1
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 1
		[StyledMessage(Info, In HDRP__ the Subsurface Color and Power are fake effects used for artistic control. For physically correct subsurface scattering the Power slider need to be set to 0., 0, 10)]_MessageSubsurface("# Message Subsurface", Float) = 0
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# SpaceSubsurface", Float) = 0
		_SubsurfaceScatteringValue("Subsurface Power", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		[StyledCategory(Matcap Settings)]_CategoryMatcap("[ Category Matcap ]", Float) = 1
		[StyledCategory(Rim Light Settings)]_CategoryRimLight("[ Category Rim Light ]", Float) = 1
		[StyledRemapSlider(_RimLightMinValue, _RimLightMaxValue, 0, 1, 0, 0)]_RimLightRemap("Rim Light Remap", Vector) = (0,0,0,0)
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive]", Float) = 1
		[Enum(None,0,Any,1,Baked,2,Realtime,3)]_EmissiveFlagMode("Emissive GI", Float) = 0
		[Enum(Nits,0,EV100,1)]_EmissiveIntensityMode("Emissive Value", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		_EmissiveIntensityValue("Emissive Power", Float) = 1
		_EmissivePhaseValue("Emissive Phase", Range( 0 , 1)) = 1
		_EmissiveExposureValue("Emissive Weight", Range( 0 , 1)) = 1
		[StyledRemapSlider(_EmissiveTexMinValue, _EmissiveTexMaxValue,0,1)]_EmissiveTexRemap("Emissive Remap", Vector) = (0,0,0,0)
		[HideInInspector]_EmissiveTexMinValue("Emissive Tex Min", Range( 0 , 1)) = 0
		[HideInInspector]_EmissiveTexMaxValue("Emissive Tex Max", Range( 0 , 1)) = 1
		[HideInInspector]_emissive_intensity_value("_emissive_intensity_value", Float) = 1
		[StyledCategory(Perspective Settings)]_CategoryPerspective("[ Category Perspective ]", Float) = 1
		[StyledCategory(Size Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 1
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 1
		[StyledMessage(Info, Procedural variation in use. Use the Scale settings if the Variation is splitting the mesh., 0, 10)]_MessageMotionVariation("# Message Motion Variation", Float) = 0
		_MotionFacingValue("Motion Direction Mask", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceMotionGlobals("# SpaceMotionGlobals", Float) = 0
		_MotionAmplitude_10("Motion Bending", Range( 0 , 2)) = 0.2
		_MotionPosition_10("Motion Rigidity", Range( 0 , 1)) = 0.5
		[IntRange]_MotionSpeed_10("Motion Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Motion Scale", Range( 0 , 20)) = 1
		_MotionVariation_10("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_20("Motion Squash", Range( 0 , 2)) = 0.2
		_MotionAmplitude_22("Motion Rolling", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_20("Motion Speed", Range( 0 , 40)) = 6
		_MotionScale_20("Motion Scale", Range( 0 , 20)) = 3
		_MotionVariation_20("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 0
		[StyledSpace(10)]_SpaceMotionLocals("# SpaceMotionLocals", Float) = 0
		[ASEEnd][StyledToggle]_MotionValue_20("Use Branch Motion Settings", Float) = 1
		[HideInInspector][StyledToggle]_VertexPivotMode("Enable Pre Baked Pivots", Float) = 0
		[HideInInspector][StyledToggle]_VertexDynamicMode("Enable Dynamic Support", Float) = 0
		[HideInInspector]_render_normals("_render_normals", Vector) = (1,1,1,0)
		[HideInInspector]_Cutoff("Legacy Cutoff", Float) = 0.5
		[HideInInspector]_Color("Legacy Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("Legacy MainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("Legacy BumpMap", 2D) = "white" {}
		[HideInInspector]_MaxBoundsInfo("_MaxBoundsInfo", Vector) = (1,1,1,1)
		[HideInInspector]_ColorsMaskMinValue("_ColorsMaskMinValue", Range( 0 , 1)) = 1
		[HideInInspector]_ColorsMaskMaxValue("_ColorsMaskMaxValue", Range( 0 , 1)) = 0
		[HideInInspector]_DetailTypeMode("_DetailTypeMode", Float) = 2
		[HideInInspector]_DetailCoordMode("_DetailCoordMode", Float) = 0
		[HideInInspector]_DetailOpaqueMode("_DetailOpaqueMode", Float) = 0
		[HideInInspector]_DetailMeshInvertMode("_DetailMeshInvertMode", Float) = 0
		[HideInInspector]_DetailMaskInvertMode("_DetailMaskInvertMode", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsCustomShader("_IsCustomShader", Float) = 0
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1200
		[HideInInspector]_IsCoreShader("_IsCoreShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsBarkShader("_IsBarkShader", Float) = 1

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1.0
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4 				// DEPRECATED
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4	// DEPRECATED
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4 // Less equal
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4 // Less equal
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][ToggleUI] _EnableBlendModePreserveSpecularLighting("Enable Blend Mode Preserve Specular Lighting", Float) = 1
		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)

		[HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0 //DoubleSidedGIMode added in api 12x and higher

		[HideInInspector][ToggleUI] _AlphaToMaskInspectorValue("_AlphaToMaskInspectorValue", Float) = 0 // Property used to save the alpha to mask state in the inspector
        [HideInInspector][ToggleUI] _AlphaToMask("__alphaToMask", Float) = 0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 BaseColor;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float DiffusionProfile;
			// Transmission + Diffusion Profile
			float Thickness;
			float SubsurfaceMask;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
			//Virtual Texturing
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			
			ColorMask [_LightLayersMaskBuffer4] 4
			ColorMask [_LightLayersMaskBuffer5] 5
		

			HLSLPROGRAM

            #define _MATERIAL_FEATURE_SPECULAR_COLOR 1
            #define _ENERGY_CONSERVING_SPECULAR 1
            #define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 120106
            #if !defined(ASE_NEED_CULLFACE)
            #define ASE_NEED_CULLFACE 1
            #endif //ASE_NEED_CULLFACE
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
            #pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
            #pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			//#pragma shader_feature_local _DOUBLESIDED_ON
			//#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment _ LIGHT_LAYERS
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_GBUFFER

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

		    // Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_OverlayNormalValue;
			half TVE_WetnessNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON
				builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.ase_texcoord.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.uv1.z , inputMesh.uv1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord6.xy = vertexToFrag11_g76431;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = vertexToFrag3890_g76401;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = vertexToFrag4224_g76401;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord6.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76401;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord5.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				float3 lerpResult6223_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76401).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76401 = ( (_MainColor).rgb * lerpResult6223_g76401 );
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord6.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				float3 lerpResult6225_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76401).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76401 = ( (_SecondColor).rgb * lerpResult6225_g76401 );
				float3 lerpResult4834_g76401 = lerp( ( Main_Albedo99_g76401 * Second_Albedo153_g76401 * 4.594794 ) , Second_Albedo153_g76401 , _DetailBlendMode);
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldBitangent = packedInput.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g76401 = lerp( Main_Albedo99_g76401 , lerpResult4834_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76401 = lerpResult235_g76401;
				#else
				float3 staticSwitch255_g76401 = Main_Albedo99_g76401;
				#endif
				half3 Blend_Albedo265_g76401 = staticSwitch255_g76401;
				half3 Tint_Gradient_Color5769_g76401 = float3(1,1,1);
				half3 Tint_Noise_Color5770_g76401 = float3(1,1,1);
				float Mesh_Occlusion318_g76401 = packedInput.ase_color.g;
				float clampResult17_g76460 = clamp( Mesh_Occlusion318_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76470 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76470 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76470 );
				half Occlusion_Mask6432_g76401 = saturate( ( ( clampResult17_g76460 - temp_output_7_0_g76470 ) / ( temp_output_10_0_g76470 + 0.0001 ) ) );
				float3 lerpResult2945_g76401 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76401);
				half3 Occlusion_Color648_g76401 = lerpResult2945_g76401;
				half3 Matcap_Color7428_g76401 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76401 = ( ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 * Occlusion_Color648_g76401 ) + Matcap_Color7428_g76401 );
				half3 Blend_Albedo_Colored863_g76401 = Blend_Albedo_Tinted2808_g76401;
				half3 Global_OverlayColor1758_g76401 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76419 = _LayerExtrasValue;
				float temp_output_19_0_g76423 = TVE_ExtrasUsage[(int)temp_output_84_0_g76419];
				float4 temp_output_93_19_g76419 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord8.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 vertexToFrag4224_g76401 = packedInput.ase_texcoord9.xyz;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 lerpResult4827_g76401 = lerp( WorldPosition3905_g76401 , ObjectPosition4223_g76401 , _ExtrasPositionMode);
				half2 UV96_g76419 = ( (temp_output_93_19_g76419).zw + ( (temp_output_93_19_g76419).xy * (lerpResult4827_g76401).xz ) );
				float4 tex2DArrayNode48_g76419 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76419,temp_output_84_0_g76419, 0.0 );
				float4 temp_output_17_0_g76423 = tex2DArrayNode48_g76419;
				float4 temp_output_94_85_g76419 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76423 = temp_output_94_85_g76419;
				float4 ifLocalVar18_g76423 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76423 >= 0.5 )
				ifLocalVar18_g76423 = temp_output_17_0_g76423;
				else
				ifLocalVar18_g76423 = temp_output_3_0_g76423;
				float4 lerpResult22_g76423 = lerp( temp_output_3_0_g76423 , temp_output_17_0_g76423 , temp_output_19_0_g76423);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76423 = lerpResult22_g76423;
				#else
				float4 staticSwitch24_g76423 = ifLocalVar18_g76423;
				#endif
				half4 Global_Extras_Params5440_g76401 = staticSwitch24_g76423;
				float4 break456_g76437 = Global_Extras_Params5440_g76401;
				half Global_Extras_Overlay156_g76401 = break456_g76437.z;
				half Overlay_Variation4560_g76401 = 1.0;
				half Overlay_Value5738_g76401 = ( _GlobalOverlay * Global_Extras_Overlay156_g76401 * Overlay_Variation4560_g76401 );
				half2 Main_Normal137_g76401 = temp_output_6555_0_g76401;
				float2 lerpResult3372_g76401 = lerp( float2( 0,0 ) , Main_Normal137_g76401 , _DetailNormalValue);
				half4 Normal_Packed45_g76430 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				float2 appendResult58_g76430 = (float2(( (Normal_Packed45_g76430).x * (Normal_Packed45_g76430).w ) , (Normal_Packed45_g76430).y));
				half2 Normal_Default50_g76430 = appendResult58_g76430;
				half2 Normal_ASTC41_g76430 = (Normal_Packed45_g76430).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76430 = Normal_ASTC41_g76430;
				#else
				float2 staticSwitch38_g76430 = Normal_Default50_g76430;
				#endif
				half2 Normal_NO_DTX544_g76430 = (Normal_Packed45_g76430).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76430 = Normal_NO_DTX544_g76430;
				#else
				float2 staticSwitch37_g76430 = staticSwitch38_g76430;
				#endif
				half2 Second_Normal179_g76401 = ( (staticSwitch37_g76430*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g76450 = ( lerpResult3372_g76401 + Second_Normal179_g76401 );
				float2 lerpResult3376_g76401 = lerp( Main_Normal137_g76401 , temp_output_36_0_g76450 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76401 = lerpResult3376_g76401;
				#else
				float2 staticSwitch267_g76401 = Main_Normal137_g76401;
				#endif
				half2 Blend_Normal312_g76401 = staticSwitch267_g76401;
				float3 appendResult7377_g76401 = (float3(Blend_Normal312_g76401 , 1.0));
				float3 tanNormal7376_g76401 = appendResult7377_g76401;
				float3 worldNormal7376_g76401 = float3(dot(tanToWorld0,tanNormal7376_g76401), dot(tanToWorld1,tanNormal7376_g76401), dot(tanToWorld2,tanNormal7376_g76401));
				half3 Blend_NormalWS7375_g76401 = worldNormal7376_g76401;
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				float lerpResult7446_g76401 = lerp( (Blend_NormalWS7375_g76401).y , packedInput.ase_normal.y , Vertex_DynamicMode5112_g76401);
				float lerpResult6757_g76401 = lerp( 1.0 , saturate( lerpResult7446_g76401 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76401 = lerpResult6757_g76401;
				float3 temp_output_3_0_g76459 = ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 );
				float dotResult20_g76459 = dot( temp_output_3_0_g76459 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76401 = clamp( saturate( ( dotResult20_g76459 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76401 = clampResult6740_g76401;
				half Overlay_Shading6688_g76401 = Blend_Albedo_Globals6410_g76401;
				half Overlay_Custom6707_g76401 = 1.0;
				half Occlusion_Alpha6463_g76401 = _VertexOcclusionColor.a;
				float lerpResult6467_g76401 = lerp( Occlusion_Alpha6463_g76401 , 1.0 , Occlusion_Mask6432_g76401);
				half Occlusion_Overlay6471_g76401 = lerpResult6467_g76401;
				float temp_output_7_0_g76468 = 0.1;
				float temp_output_10_0_g76468 = ( 0.2 - temp_output_7_0_g76468 );
				half Overlay_Mask_High6064_g76401 = saturate( ( ( ( Overlay_Value5738_g76401 * Overlay_Projection6081_g76401 * Overlay_Shading6688_g76401 * Overlay_Custom6707_g76401 * Occlusion_Overlay6471_g76401 ) - temp_output_7_0_g76468 ) / ( temp_output_10_0_g76468 + 0.0001 ) ) );
				half Overlay_Mask269_g76401 = Overlay_Mask_High6064_g76401;
				float3 lerpResult336_g76401 = lerp( Blend_Albedo_Colored863_g76401 , Global_OverlayColor1758_g76401 , Overlay_Mask269_g76401);
				half3 Blend_Albedo_Overlay359_g76401 = lerpResult336_g76401;
				half Global_WetnessContrast6502_g76401 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76401 = break456_g76437.y;
				half Wetness_Value6343_g76401 = ( Global_Extras_Wetness305_g76401 * _GlobalWetness );
				float3 lerpResult6367_g76401 = lerp( Blend_Albedo_Overlay359_g76401 , ( Blend_Albedo_Overlay359_g76401 * Blend_Albedo_Overlay359_g76401 ) , ( Global_WetnessContrast6502_g76401 * Wetness_Value6343_g76401 ));
				half3 Blend_Albedo_Wetness6351_g76401 = lerpResult6367_g76401;
				float3 _Vector10 = float3(1,1,1);
				half3 Tint_Highlight_Color5771_g76401 = _Vector10;
				float3 temp_output_6309_0_g76401 = ( Blend_Albedo_Wetness6351_g76401 * Tint_Highlight_Color5771_g76401 );
				half3 Blend_Albedo_Subsurface149_g76401 = temp_output_6309_0_g76401;
				half3 Blend_Albedo_RimLight7316_g76401 = Blend_Albedo_Subsurface149_g76401;
				
				half Global_OverlayNormalScale6581_g76401 = TVE_OverlayNormalValue;
				float lerpResult6585_g76401 = lerp( 1.0 , Global_OverlayNormalScale6581_g76401 , Overlay_Mask269_g76401);
				half2 Blend_Normal_Overlay366_g76401 = ( Blend_Normal312_g76401 * lerpResult6585_g76401 );
				half Global_WetnessNormalScale6571_g76401 = TVE_WetnessNormalValue;
				float lerpResult6579_g76401 = lerp( 1.0 , Global_WetnessNormalScale6571_g76401 , ( Wetness_Value6343_g76401 * Wetness_Value6343_g76401 ));
				half2 Blend_Normal_Wetness6372_g76401 = ( Blend_Normal_Overlay366_g76401 * lerpResult6579_g76401 );
				float3 appendResult6568_g76401 = (float3(Blend_Normal_Wetness6372_g76401 , 1.0));
				float3 temp_output_13_0_g76438 = appendResult6568_g76401;
				float3 temp_output_33_0_g76438 = ( temp_output_13_0_g76438 * _render_normals );
				float3 switchResult12_g76438 = (((isFrontFace>0)?(temp_output_13_0_g76438):(temp_output_33_0_g76438)));
				
				half Render_Specular4861_g76401 = _RenderSpecular;
				float3 temp_cast_6 = (( 0.04 * Render_Specular4861_g76401 )).xxx;
				
				half3 Emissive_Color7162_g76401 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g76401 = ( ( packedInput.ase_texcoord5.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g76527 = _EmissiveTexMinValue;
				float3 temp_cast_7 = (temp_output_7_0_g76527).xxx;
				float temp_output_10_0_g76527 = ( _EmissiveTexMaxValue - temp_output_7_0_g76527 );
				half3 Emissive_Texture7022_g76401 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76401 )).rgb - temp_cast_7 ) / ( temp_output_10_0_g76527 + 0.0001 ) ) );
				half Global_Extras_Emissive4203_g76401 = break456_g76437.x;
				float lerpResult4206_g76401 = lerp( 1.0 , Global_Extras_Emissive4203_g76401 , _GlobalEmissive);
				half Emissive_Value7024_g76401 = ( ( lerpResult4206_g76401 * _EmissivePhaseValue ) - 1.0 );
				half3 Emissive_Mask6968_g76401 = saturate( ( Emissive_Texture7022_g76401 + Emissive_Value7024_g76401 ) );
				float3 temp_output_3_0_g76436 = ( Emissive_Color7162_g76401 * Emissive_Mask6968_g76401 );
				float temp_output_15_0_g76436 = _emissive_intensity_value;
				float3 hdEmission22_g76436 = ASEGetEmissionHDRColor(temp_output_3_0_g76436,temp_output_15_0_g76436,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half3 Final_Emissive2476_g76401 = hdEmission22_g76436;
				
				half Main_Smoothness227_g76401 = ( tex2DNode35_g76401.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76401 = ( tex2DNode33_g76401.a * _SecondSmoothnessValue );
				float lerpResult266_g76401 = lerp( Main_Smoothness227_g76401 , Second_Smoothness236_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g76401 = lerpResult266_g76401;
				#else
				float staticSwitch297_g76401 = Main_Smoothness227_g76401;
				#endif
				half Blend_Smoothness314_g76401 = staticSwitch297_g76401;
				half Global_OverlaySmoothness311_g76401 = TVE_OverlaySmoothness;
				float lerpResult343_g76401 = lerp( Blend_Smoothness314_g76401 , Global_OverlaySmoothness311_g76401 , Overlay_Mask269_g76401);
				half Blend_Smoothness_Overlay371_g76401 = lerpResult343_g76401;
				float temp_output_6499_0_g76401 = ( 1.0 - Wetness_Value6343_g76401 );
				half Blend_Smoothness_Wetness4130_g76401 = saturate( ( Blend_Smoothness_Overlay371_g76401 + ( 1.0 - ( temp_output_6499_0_g76401 * temp_output_6499_0_g76401 ) ) ) );
				
				float lerpResult240_g76401 = lerp( 1.0 , tex2DNode35_g76401.g , _MainOcclusionValue);
				half Main_Occlusion247_g76401 = lerpResult240_g76401;
				float lerpResult239_g76401 = lerp( 1.0 , tex2DNode33_g76401.g , _SecondOcclusionValue);
				half Second_Occlusion251_g76401 = lerpResult239_g76401;
				float lerpResult294_g76401 = lerp( Main_Occlusion247_g76401 , Second_Occlusion251_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g76401 = lerpResult294_g76401;
				#else
				float staticSwitch310_g76401 = Main_Occlusion247_g76401;
				#endif
				half Blend_Occlusion323_g76401 = staticSwitch310_g76401;
				
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.BaseColor = Blend_Albedo_RimLight7316_g76401;
				surfaceDescription.Normal = switchResult12_g76438;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = temp_cast_6;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g76401;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76401;
				surfaceDescription.Occlusion = Blend_Occlusion323_g76401;
				surfaceDescription.Alpha = Final_Clip914_g76401;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 0;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120106
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			//#pragma shader_feature_local _DOUBLESIDED_ON
			//#pragma shader_feature_local _ALPHATEST_ON

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_OverlayNormalValue;
			half TVE_WetnessNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT
			#define SCENEPICKINGPASS
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.uv3.x , inputMesh.uv3.z , inputMesh.uv3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.uv0.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.uv0.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.uv0.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.uv1.z , inputMesh.uv1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = vertexToFrag11_g76431;
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = vertexToFrag3890_g76401;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = vertexToFrag4224_g76401;
				
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2 = inputMesh.uv0;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76401;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				outputPackedVaryingsMeshToPS.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);


				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					outputPackedVaryingsMeshToPS.VizUV.xy = vizUV;
					outputPackedVaryingsMeshToPS.LightCoord = lightCoord;
				#endif

				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				float3 lerpResult6223_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76401).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76401 = ( (_MainColor).rgb * lerpResult6223_g76401 );
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord3.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				float3 lerpResult6225_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76401).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76401 = ( (_SecondColor).rgb * lerpResult6225_g76401 );
				float3 lerpResult4834_g76401 = lerp( ( Main_Albedo99_g76401 * Second_Albedo153_g76401 * 4.594794 ) , Second_Albedo153_g76401 , _DetailBlendMode);
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldTangent = packedInput.ase_texcoord4.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord5.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g76401 = lerp( Main_Albedo99_g76401 , lerpResult4834_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76401 = lerpResult235_g76401;
				#else
				float3 staticSwitch255_g76401 = Main_Albedo99_g76401;
				#endif
				half3 Blend_Albedo265_g76401 = staticSwitch255_g76401;
				half3 Tint_Gradient_Color5769_g76401 = float3(1,1,1);
				half3 Tint_Noise_Color5770_g76401 = float3(1,1,1);
				float Mesh_Occlusion318_g76401 = packedInput.ase_color.g;
				float clampResult17_g76460 = clamp( Mesh_Occlusion318_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76470 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76470 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76470 );
				half Occlusion_Mask6432_g76401 = saturate( ( ( clampResult17_g76460 - temp_output_7_0_g76470 ) / ( temp_output_10_0_g76470 + 0.0001 ) ) );
				float3 lerpResult2945_g76401 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76401);
				half3 Occlusion_Color648_g76401 = lerpResult2945_g76401;
				half3 Matcap_Color7428_g76401 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76401 = ( ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 * Occlusion_Color648_g76401 ) + Matcap_Color7428_g76401 );
				half3 Blend_Albedo_Colored863_g76401 = Blend_Albedo_Tinted2808_g76401;
				half3 Global_OverlayColor1758_g76401 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76419 = _LayerExtrasValue;
				float temp_output_19_0_g76423 = TVE_ExtrasUsage[(int)temp_output_84_0_g76419];
				float4 temp_output_93_19_g76419 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord7.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 vertexToFrag4224_g76401 = packedInput.ase_texcoord8.xyz;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 lerpResult4827_g76401 = lerp( WorldPosition3905_g76401 , ObjectPosition4223_g76401 , _ExtrasPositionMode);
				half2 UV96_g76419 = ( (temp_output_93_19_g76419).zw + ( (temp_output_93_19_g76419).xy * (lerpResult4827_g76401).xz ) );
				float4 tex2DArrayNode48_g76419 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76419,temp_output_84_0_g76419, 0.0 );
				float4 temp_output_17_0_g76423 = tex2DArrayNode48_g76419;
				float4 temp_output_94_85_g76419 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76423 = temp_output_94_85_g76419;
				float4 ifLocalVar18_g76423 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76423 >= 0.5 )
				ifLocalVar18_g76423 = temp_output_17_0_g76423;
				else
				ifLocalVar18_g76423 = temp_output_3_0_g76423;
				float4 lerpResult22_g76423 = lerp( temp_output_3_0_g76423 , temp_output_17_0_g76423 , temp_output_19_0_g76423);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76423 = lerpResult22_g76423;
				#else
				float4 staticSwitch24_g76423 = ifLocalVar18_g76423;
				#endif
				half4 Global_Extras_Params5440_g76401 = staticSwitch24_g76423;
				float4 break456_g76437 = Global_Extras_Params5440_g76401;
				half Global_Extras_Overlay156_g76401 = break456_g76437.z;
				half Overlay_Variation4560_g76401 = 1.0;
				half Overlay_Value5738_g76401 = ( _GlobalOverlay * Global_Extras_Overlay156_g76401 * Overlay_Variation4560_g76401 );
				half2 Main_Normal137_g76401 = temp_output_6555_0_g76401;
				float2 lerpResult3372_g76401 = lerp( float2( 0,0 ) , Main_Normal137_g76401 , _DetailNormalValue);
				half4 Normal_Packed45_g76430 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				float2 appendResult58_g76430 = (float2(( (Normal_Packed45_g76430).x * (Normal_Packed45_g76430).w ) , (Normal_Packed45_g76430).y));
				half2 Normal_Default50_g76430 = appendResult58_g76430;
				half2 Normal_ASTC41_g76430 = (Normal_Packed45_g76430).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76430 = Normal_ASTC41_g76430;
				#else
				float2 staticSwitch38_g76430 = Normal_Default50_g76430;
				#endif
				half2 Normal_NO_DTX544_g76430 = (Normal_Packed45_g76430).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76430 = Normal_NO_DTX544_g76430;
				#else
				float2 staticSwitch37_g76430 = staticSwitch38_g76430;
				#endif
				half2 Second_Normal179_g76401 = ( (staticSwitch37_g76430*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g76450 = ( lerpResult3372_g76401 + Second_Normal179_g76401 );
				float2 lerpResult3376_g76401 = lerp( Main_Normal137_g76401 , temp_output_36_0_g76450 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76401 = lerpResult3376_g76401;
				#else
				float2 staticSwitch267_g76401 = Main_Normal137_g76401;
				#endif
				half2 Blend_Normal312_g76401 = staticSwitch267_g76401;
				float3 appendResult7377_g76401 = (float3(Blend_Normal312_g76401 , 1.0));
				float3 tanNormal7376_g76401 = appendResult7377_g76401;
				float3 worldNormal7376_g76401 = float3(dot(tanToWorld0,tanNormal7376_g76401), dot(tanToWorld1,tanNormal7376_g76401), dot(tanToWorld2,tanNormal7376_g76401));
				half3 Blend_NormalWS7375_g76401 = worldNormal7376_g76401;
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				float lerpResult7446_g76401 = lerp( (Blend_NormalWS7375_g76401).y , packedInput.ase_normal.y , Vertex_DynamicMode5112_g76401);
				float lerpResult6757_g76401 = lerp( 1.0 , saturate( lerpResult7446_g76401 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76401 = lerpResult6757_g76401;
				float3 temp_output_3_0_g76459 = ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 );
				float dotResult20_g76459 = dot( temp_output_3_0_g76459 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76401 = clamp( saturate( ( dotResult20_g76459 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76401 = clampResult6740_g76401;
				half Overlay_Shading6688_g76401 = Blend_Albedo_Globals6410_g76401;
				half Overlay_Custom6707_g76401 = 1.0;
				half Occlusion_Alpha6463_g76401 = _VertexOcclusionColor.a;
				float lerpResult6467_g76401 = lerp( Occlusion_Alpha6463_g76401 , 1.0 , Occlusion_Mask6432_g76401);
				half Occlusion_Overlay6471_g76401 = lerpResult6467_g76401;
				float temp_output_7_0_g76468 = 0.1;
				float temp_output_10_0_g76468 = ( 0.2 - temp_output_7_0_g76468 );
				half Overlay_Mask_High6064_g76401 = saturate( ( ( ( Overlay_Value5738_g76401 * Overlay_Projection6081_g76401 * Overlay_Shading6688_g76401 * Overlay_Custom6707_g76401 * Occlusion_Overlay6471_g76401 ) - temp_output_7_0_g76468 ) / ( temp_output_10_0_g76468 + 0.0001 ) ) );
				half Overlay_Mask269_g76401 = Overlay_Mask_High6064_g76401;
				float3 lerpResult336_g76401 = lerp( Blend_Albedo_Colored863_g76401 , Global_OverlayColor1758_g76401 , Overlay_Mask269_g76401);
				half3 Blend_Albedo_Overlay359_g76401 = lerpResult336_g76401;
				half Global_WetnessContrast6502_g76401 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76401 = break456_g76437.y;
				half Wetness_Value6343_g76401 = ( Global_Extras_Wetness305_g76401 * _GlobalWetness );
				float3 lerpResult6367_g76401 = lerp( Blend_Albedo_Overlay359_g76401 , ( Blend_Albedo_Overlay359_g76401 * Blend_Albedo_Overlay359_g76401 ) , ( Global_WetnessContrast6502_g76401 * Wetness_Value6343_g76401 ));
				half3 Blend_Albedo_Wetness6351_g76401 = lerpResult6367_g76401;
				float3 _Vector10 = float3(1,1,1);
				half3 Tint_Highlight_Color5771_g76401 = _Vector10;
				float3 temp_output_6309_0_g76401 = ( Blend_Albedo_Wetness6351_g76401 * Tint_Highlight_Color5771_g76401 );
				half3 Blend_Albedo_Subsurface149_g76401 = temp_output_6309_0_g76401;
				half3 Blend_Albedo_RimLight7316_g76401 = Blend_Albedo_Subsurface149_g76401;
				
				half Global_OverlayNormalScale6581_g76401 = TVE_OverlayNormalValue;
				float lerpResult6585_g76401 = lerp( 1.0 , Global_OverlayNormalScale6581_g76401 , Overlay_Mask269_g76401);
				half2 Blend_Normal_Overlay366_g76401 = ( Blend_Normal312_g76401 * lerpResult6585_g76401 );
				half Global_WetnessNormalScale6571_g76401 = TVE_WetnessNormalValue;
				float lerpResult6579_g76401 = lerp( 1.0 , Global_WetnessNormalScale6571_g76401 , ( Wetness_Value6343_g76401 * Wetness_Value6343_g76401 ));
				half2 Blend_Normal_Wetness6372_g76401 = ( Blend_Normal_Overlay366_g76401 * lerpResult6579_g76401 );
				float3 appendResult6568_g76401 = (float3(Blend_Normal_Wetness6372_g76401 , 1.0));
				float3 temp_output_13_0_g76438 = appendResult6568_g76401;
				float3 temp_output_33_0_g76438 = ( temp_output_13_0_g76438 * _render_normals );
				float3 switchResult12_g76438 = (((isFrontFace>0)?(temp_output_13_0_g76438):(temp_output_33_0_g76438)));
				
				half Render_Specular4861_g76401 = _RenderSpecular;
				float3 temp_cast_6 = (( 0.04 * Render_Specular4861_g76401 )).xxx;
				
				half3 Emissive_Color7162_g76401 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g76401 = ( ( packedInput.ase_texcoord2.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g76527 = _EmissiveTexMinValue;
				float3 temp_cast_7 = (temp_output_7_0_g76527).xxx;
				float temp_output_10_0_g76527 = ( _EmissiveTexMaxValue - temp_output_7_0_g76527 );
				half3 Emissive_Texture7022_g76401 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76401 )).rgb - temp_cast_7 ) / ( temp_output_10_0_g76527 + 0.0001 ) ) );
				half Global_Extras_Emissive4203_g76401 = break456_g76437.x;
				float lerpResult4206_g76401 = lerp( 1.0 , Global_Extras_Emissive4203_g76401 , _GlobalEmissive);
				half Emissive_Value7024_g76401 = ( ( lerpResult4206_g76401 * _EmissivePhaseValue ) - 1.0 );
				half3 Emissive_Mask6968_g76401 = saturate( ( Emissive_Texture7022_g76401 + Emissive_Value7024_g76401 ) );
				float3 temp_output_3_0_g76436 = ( Emissive_Color7162_g76401 * Emissive_Mask6968_g76401 );
				float temp_output_15_0_g76436 = _emissive_intensity_value;
				float3 hdEmission22_g76436 = ASEGetEmissionHDRColor(temp_output_3_0_g76436,temp_output_15_0_g76436,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half3 Final_Emissive2476_g76401 = hdEmission22_g76436;
				
				half Main_Smoothness227_g76401 = ( tex2DNode35_g76401.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76401 = ( tex2DNode33_g76401.a * _SecondSmoothnessValue );
				float lerpResult266_g76401 = lerp( Main_Smoothness227_g76401 , Second_Smoothness236_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g76401 = lerpResult266_g76401;
				#else
				float staticSwitch297_g76401 = Main_Smoothness227_g76401;
				#endif
				half Blend_Smoothness314_g76401 = staticSwitch297_g76401;
				half Global_OverlaySmoothness311_g76401 = TVE_OverlaySmoothness;
				float lerpResult343_g76401 = lerp( Blend_Smoothness314_g76401 , Global_OverlaySmoothness311_g76401 , Overlay_Mask269_g76401);
				half Blend_Smoothness_Overlay371_g76401 = lerpResult343_g76401;
				float temp_output_6499_0_g76401 = ( 1.0 - Wetness_Value6343_g76401 );
				half Blend_Smoothness_Wetness4130_g76401 = saturate( ( Blend_Smoothness_Overlay371_g76401 + ( 1.0 - ( temp_output_6499_0_g76401 * temp_output_6499_0_g76401 ) ) ) );
				
				float lerpResult240_g76401 = lerp( 1.0 , tex2DNode35_g76401.g , _MainOcclusionValue);
				half Main_Occlusion247_g76401 = lerpResult240_g76401;
				float lerpResult239_g76401 = lerp( 1.0 , tex2DNode33_g76401.g , _SecondOcclusionValue);
				half Second_Occlusion251_g76401 = lerpResult239_g76401;
				float lerpResult294_g76401 = lerp( Main_Occlusion247_g76401 , Second_Occlusion251_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g76401 = lerpResult294_g76401;
				#else
				float staticSwitch310_g76401 = Main_Occlusion247_g76401;
				#endif
				half Blend_Occlusion323_g76401 = staticSwitch310_g76401;
				
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = packedInput.ase_texcoord9.xyz;
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.BaseColor = Blend_Albedo_RimLight7316_g76401;
				surfaceDescription.Normal = switchResult12_g76438;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = temp_cast_6;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g76401;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76401;
				surfaceDescription.Occlusion = Blend_Occlusion323_g76401;
				surfaceDescription.Alpha = Final_Clip914_g76401;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;

			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			//#pragma shader_feature_local _DOUBLESIDED_ON
			//#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			//#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_SHADOWS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
			#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.ase_texcoord.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.ase_texcoord1.z , inputMesh.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord2.xy = vertexToFrag11_g76431;
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag3890_g76401;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76401;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord1.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord2.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldTangent = packedInput.ase_texcoord3.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord4.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord6.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.Alpha = Final_Clip914_g76401;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmesh.positionCS.z;

				#ifdef _ALPHATOMASK_ON
				depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

            #define _MATERIAL_FEATURE_SPECULAR_COLOR 1
            #define _ENERGY_CONSERVING_SPECULAR 1
            #define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 120106
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			//#pragma shader_feature_local _DOUBLESIDED_ON
			//#pragma shader_feature_local _ALPHATEST_ON

			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
		    #define SCENESELECTIONPASS 1

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.ase_texcoord.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.ase_texcoord1.z , inputMesh.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord2.xy = vertexToFrag11_g76431;
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag3890_g76401;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76401;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord1.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord2.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldTangent = packedInput.ase_texcoord3.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord4.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord6.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.Alpha = Final_Clip914_g76401;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

            #define _MATERIAL_FEATURE_SPECULAR_COLOR 1
            #define _ENERGY_CONSERVING_SPECULAR 1
            #define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 120106
            #if !defined(ASE_NEED_CULLFACE)
            #define ASE_NEED_CULLFACE 1
            #endif //ASE_NEED_CULLFACE
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			//#pragma shader_feature_local _DOUBLESIDED_ON
			//#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			half TVE_OverlayNormalValue;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			half TVE_WetnessNormalValue;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif
			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.ase_texcoord.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.ase_texcoord1.z , inputMesh.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord4.xy = vertexToFrag11_g76431;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag3890_g76401;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = vertexToFrag4224_g76401;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord4.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76401;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g76401 = temp_output_6555_0_g76401;
				float2 lerpResult3372_g76401 = lerp( float2( 0,0 ) , Main_Normal137_g76401 , _DetailNormalValue);
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord4.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				half4 Normal_Packed45_g76430 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				float2 appendResult58_g76430 = (float2(( (Normal_Packed45_g76430).x * (Normal_Packed45_g76430).w ) , (Normal_Packed45_g76430).y));
				half2 Normal_Default50_g76430 = appendResult58_g76430;
				half2 Normal_ASTC41_g76430 = (Normal_Packed45_g76430).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76430 = Normal_ASTC41_g76430;
				#else
				float2 staticSwitch38_g76430 = Normal_Default50_g76430;
				#endif
				half2 Normal_NO_DTX544_g76430 = (Normal_Packed45_g76430).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76430 = Normal_NO_DTX544_g76430;
				#else
				float2 staticSwitch37_g76430 = staticSwitch38_g76430;
				#endif
				half2 Second_Normal179_g76401 = ( (staticSwitch37_g76430*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g76450 = ( lerpResult3372_g76401 + Second_Normal179_g76401 );
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldBitangent = packedInput.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float2 lerpResult3376_g76401 = lerp( Main_Normal137_g76401 , temp_output_36_0_g76450 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76401 = lerpResult3376_g76401;
				#else
				float2 staticSwitch267_g76401 = Main_Normal137_g76401;
				#endif
				half2 Blend_Normal312_g76401 = staticSwitch267_g76401;
				half Global_OverlayNormalScale6581_g76401 = TVE_OverlayNormalValue;
				float temp_output_84_0_g76419 = _LayerExtrasValue;
				float temp_output_19_0_g76423 = TVE_ExtrasUsage[(int)temp_output_84_0_g76419];
				float4 temp_output_93_19_g76419 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord6.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 vertexToFrag4224_g76401 = packedInput.ase_texcoord7.xyz;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 lerpResult4827_g76401 = lerp( WorldPosition3905_g76401 , ObjectPosition4223_g76401 , _ExtrasPositionMode);
				half2 UV96_g76419 = ( (temp_output_93_19_g76419).zw + ( (temp_output_93_19_g76419).xy * (lerpResult4827_g76401).xz ) );
				float4 tex2DArrayNode48_g76419 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76419,temp_output_84_0_g76419, 0.0 );
				float4 temp_output_17_0_g76423 = tex2DArrayNode48_g76419;
				float4 temp_output_94_85_g76419 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76423 = temp_output_94_85_g76419;
				float4 ifLocalVar18_g76423 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76423 >= 0.5 )
				ifLocalVar18_g76423 = temp_output_17_0_g76423;
				else
				ifLocalVar18_g76423 = temp_output_3_0_g76423;
				float4 lerpResult22_g76423 = lerp( temp_output_3_0_g76423 , temp_output_17_0_g76423 , temp_output_19_0_g76423);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76423 = lerpResult22_g76423;
				#else
				float4 staticSwitch24_g76423 = ifLocalVar18_g76423;
				#endif
				half4 Global_Extras_Params5440_g76401 = staticSwitch24_g76423;
				float4 break456_g76437 = Global_Extras_Params5440_g76401;
				half Global_Extras_Overlay156_g76401 = break456_g76437.z;
				half Overlay_Variation4560_g76401 = 1.0;
				half Overlay_Value5738_g76401 = ( _GlobalOverlay * Global_Extras_Overlay156_g76401 * Overlay_Variation4560_g76401 );
				float3 appendResult7377_g76401 = (float3(Blend_Normal312_g76401 , 1.0));
				float3 tanNormal7376_g76401 = appendResult7377_g76401;
				float3 worldNormal7376_g76401 = float3(dot(tanToWorld0,tanNormal7376_g76401), dot(tanToWorld1,tanNormal7376_g76401), dot(tanToWorld2,tanNormal7376_g76401));
				half3 Blend_NormalWS7375_g76401 = worldNormal7376_g76401;
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				float lerpResult7446_g76401 = lerp( (Blend_NormalWS7375_g76401).y , packedInput.ase_normal.y , Vertex_DynamicMode5112_g76401);
				float lerpResult6757_g76401 = lerp( 1.0 , saturate( lerpResult7446_g76401 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76401 = lerpResult6757_g76401;
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				float3 lerpResult6223_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76401).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76401 = ( (_MainColor).rgb * lerpResult6223_g76401 );
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				float3 lerpResult6225_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76401).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76401 = ( (_SecondColor).rgb * lerpResult6225_g76401 );
				float3 lerpResult4834_g76401 = lerp( ( Main_Albedo99_g76401 * Second_Albedo153_g76401 * 4.594794 ) , Second_Albedo153_g76401 , _DetailBlendMode);
				float3 lerpResult235_g76401 = lerp( Main_Albedo99_g76401 , lerpResult4834_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76401 = lerpResult235_g76401;
				#else
				float3 staticSwitch255_g76401 = Main_Albedo99_g76401;
				#endif
				half3 Blend_Albedo265_g76401 = staticSwitch255_g76401;
				half3 Tint_Gradient_Color5769_g76401 = float3(1,1,1);
				half3 Tint_Noise_Color5770_g76401 = float3(1,1,1);
				float3 temp_output_3_0_g76459 = ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 );
				float dotResult20_g76459 = dot( temp_output_3_0_g76459 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76401 = clamp( saturate( ( dotResult20_g76459 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76401 = clampResult6740_g76401;
				half Overlay_Shading6688_g76401 = Blend_Albedo_Globals6410_g76401;
				half Overlay_Custom6707_g76401 = 1.0;
				half Occlusion_Alpha6463_g76401 = _VertexOcclusionColor.a;
				float Mesh_Occlusion318_g76401 = packedInput.ase_color.g;
				float clampResult17_g76460 = clamp( Mesh_Occlusion318_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76470 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76470 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76470 );
				half Occlusion_Mask6432_g76401 = saturate( ( ( clampResult17_g76460 - temp_output_7_0_g76470 ) / ( temp_output_10_0_g76470 + 0.0001 ) ) );
				float lerpResult6467_g76401 = lerp( Occlusion_Alpha6463_g76401 , 1.0 , Occlusion_Mask6432_g76401);
				half Occlusion_Overlay6471_g76401 = lerpResult6467_g76401;
				float temp_output_7_0_g76468 = 0.1;
				float temp_output_10_0_g76468 = ( 0.2 - temp_output_7_0_g76468 );
				half Overlay_Mask_High6064_g76401 = saturate( ( ( ( Overlay_Value5738_g76401 * Overlay_Projection6081_g76401 * Overlay_Shading6688_g76401 * Overlay_Custom6707_g76401 * Occlusion_Overlay6471_g76401 ) - temp_output_7_0_g76468 ) / ( temp_output_10_0_g76468 + 0.0001 ) ) );
				half Overlay_Mask269_g76401 = Overlay_Mask_High6064_g76401;
				float lerpResult6585_g76401 = lerp( 1.0 , Global_OverlayNormalScale6581_g76401 , Overlay_Mask269_g76401);
				half2 Blend_Normal_Overlay366_g76401 = ( Blend_Normal312_g76401 * lerpResult6585_g76401 );
				half Global_WetnessNormalScale6571_g76401 = TVE_WetnessNormalValue;
				half Global_Extras_Wetness305_g76401 = break456_g76437.y;
				half Wetness_Value6343_g76401 = ( Global_Extras_Wetness305_g76401 * _GlobalWetness );
				float lerpResult6579_g76401 = lerp( 1.0 , Global_WetnessNormalScale6571_g76401 , ( Wetness_Value6343_g76401 * Wetness_Value6343_g76401 ));
				half2 Blend_Normal_Wetness6372_g76401 = ( Blend_Normal_Overlay366_g76401 * lerpResult6579_g76401 );
				float3 appendResult6568_g76401 = (float3(Blend_Normal_Wetness6372_g76401 , 1.0));
				float3 temp_output_13_0_g76438 = appendResult6568_g76401;
				float3 temp_output_33_0_g76438 = ( temp_output_13_0_g76438 * _render_normals );
				float3 switchResult12_g76438 = (((isFrontFace>0)?(temp_output_13_0_g76438):(temp_output_33_0_g76438)));
				
				half Main_Smoothness227_g76401 = ( tex2DNode35_g76401.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76401 = ( tex2DNode33_g76401.a * _SecondSmoothnessValue );
				float lerpResult266_g76401 = lerp( Main_Smoothness227_g76401 , Second_Smoothness236_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g76401 = lerpResult266_g76401;
				#else
				float staticSwitch297_g76401 = Main_Smoothness227_g76401;
				#endif
				half Blend_Smoothness314_g76401 = staticSwitch297_g76401;
				half Global_OverlaySmoothness311_g76401 = TVE_OverlaySmoothness;
				float lerpResult343_g76401 = lerp( Blend_Smoothness314_g76401 , Global_OverlaySmoothness311_g76401 , Overlay_Mask269_g76401);
				half Blend_Smoothness_Overlay371_g76401 = lerpResult343_g76401;
				float temp_output_6499_0_g76401 = ( 1.0 - Wetness_Value6343_g76401 );
				half Blend_Smoothness_Wetness4130_g76401 = saturate( ( Blend_Smoothness_Overlay371_g76401 + ( 1.0 - ( temp_output_6499_0_g76401 * temp_output_6499_0_g76401 ) ) ) );
				
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.Normal = switchResult12_g76438;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76401;
				surfaceDescription.Alpha = Final_Clip914_g76401;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#ifdef _ALPHATOMASK_ON
						depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM

            #define _MATERIAL_FEATURE_SPECULAR_COLOR 1
            #define _ENERGY_CONSERVING_SPECULAR 1
            #define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 120106
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			//#pragma shader_feature_local _DOUBLESIDED_ON
			//#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_MOTION_VECTORS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			half TVE_OverlayNormalValue;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			half TVE_WetnessNormalValue;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.ase_texcoord.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.ase_texcoord1.z , inputMesh.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord4.xy = vertexToFrag11_g76431;
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = vertexToFrag3890_g76401;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = vertexToFrag4224_g76401;
				
				outputPackedVaryingsMeshToPS.ase_texcoord10.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord4.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord10.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76401;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						if (_TransparentCameraOnlyMotionVectors > 0)
						{
							previousPositionRWS = VMESHpositionRWS.xyz;
						}
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif

			#if ( 0 ) // TEMPORARY: defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
				, bool ase_vface : SV_IsFrontFace
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g76401 = temp_output_6555_0_g76401;
				float2 lerpResult3372_g76401 = lerp( float2( 0,0 ) , Main_Normal137_g76401 , _DetailNormalValue);
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord4.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				half4 Normal_Packed45_g76430 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				float2 appendResult58_g76430 = (float2(( (Normal_Packed45_g76430).x * (Normal_Packed45_g76430).w ) , (Normal_Packed45_g76430).y));
				half2 Normal_Default50_g76430 = appendResult58_g76430;
				half2 Normal_ASTC41_g76430 = (Normal_Packed45_g76430).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76430 = Normal_ASTC41_g76430;
				#else
				float2 staticSwitch38_g76430 = Normal_Default50_g76430;
				#endif
				half2 Normal_NO_DTX544_g76430 = (Normal_Packed45_g76430).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76430 = Normal_NO_DTX544_g76430;
				#else
				float2 staticSwitch37_g76430 = staticSwitch38_g76430;
				#endif
				half2 Second_Normal179_g76401 = ( (staticSwitch37_g76430*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g76450 = ( lerpResult3372_g76401 + Second_Normal179_g76401 );
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldTangent = packedInput.ase_texcoord5.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord6.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float2 lerpResult3376_g76401 = lerp( Main_Normal137_g76401 , temp_output_36_0_g76450 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76401 = lerpResult3376_g76401;
				#else
				float2 staticSwitch267_g76401 = Main_Normal137_g76401;
				#endif
				half2 Blend_Normal312_g76401 = staticSwitch267_g76401;
				half Global_OverlayNormalScale6581_g76401 = TVE_OverlayNormalValue;
				float temp_output_84_0_g76419 = _LayerExtrasValue;
				float temp_output_19_0_g76423 = TVE_ExtrasUsage[(int)temp_output_84_0_g76419];
				float4 temp_output_93_19_g76419 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord8.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 vertexToFrag4224_g76401 = packedInput.ase_texcoord9.xyz;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 lerpResult4827_g76401 = lerp( WorldPosition3905_g76401 , ObjectPosition4223_g76401 , _ExtrasPositionMode);
				half2 UV96_g76419 = ( (temp_output_93_19_g76419).zw + ( (temp_output_93_19_g76419).xy * (lerpResult4827_g76401).xz ) );
				float4 tex2DArrayNode48_g76419 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76419,temp_output_84_0_g76419, 0.0 );
				float4 temp_output_17_0_g76423 = tex2DArrayNode48_g76419;
				float4 temp_output_94_85_g76419 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76423 = temp_output_94_85_g76419;
				float4 ifLocalVar18_g76423 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76423 >= 0.5 )
				ifLocalVar18_g76423 = temp_output_17_0_g76423;
				else
				ifLocalVar18_g76423 = temp_output_3_0_g76423;
				float4 lerpResult22_g76423 = lerp( temp_output_3_0_g76423 , temp_output_17_0_g76423 , temp_output_19_0_g76423);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76423 = lerpResult22_g76423;
				#else
				float4 staticSwitch24_g76423 = ifLocalVar18_g76423;
				#endif
				half4 Global_Extras_Params5440_g76401 = staticSwitch24_g76423;
				float4 break456_g76437 = Global_Extras_Params5440_g76401;
				half Global_Extras_Overlay156_g76401 = break456_g76437.z;
				half Overlay_Variation4560_g76401 = 1.0;
				half Overlay_Value5738_g76401 = ( _GlobalOverlay * Global_Extras_Overlay156_g76401 * Overlay_Variation4560_g76401 );
				float3 appendResult7377_g76401 = (float3(Blend_Normal312_g76401 , 1.0));
				float3 tanNormal7376_g76401 = appendResult7377_g76401;
				float3 worldNormal7376_g76401 = float3(dot(tanToWorld0,tanNormal7376_g76401), dot(tanToWorld1,tanNormal7376_g76401), dot(tanToWorld2,tanNormal7376_g76401));
				half3 Blend_NormalWS7375_g76401 = worldNormal7376_g76401;
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				float lerpResult7446_g76401 = lerp( (Blend_NormalWS7375_g76401).y , packedInput.ase_normal.y , Vertex_DynamicMode5112_g76401);
				float lerpResult6757_g76401 = lerp( 1.0 , saturate( lerpResult7446_g76401 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76401 = lerpResult6757_g76401;
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				float3 lerpResult6223_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76401).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76401 = ( (_MainColor).rgb * lerpResult6223_g76401 );
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				float3 lerpResult6225_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76401).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76401 = ( (_SecondColor).rgb * lerpResult6225_g76401 );
				float3 lerpResult4834_g76401 = lerp( ( Main_Albedo99_g76401 * Second_Albedo153_g76401 * 4.594794 ) , Second_Albedo153_g76401 , _DetailBlendMode);
				float3 lerpResult235_g76401 = lerp( Main_Albedo99_g76401 , lerpResult4834_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76401 = lerpResult235_g76401;
				#else
				float3 staticSwitch255_g76401 = Main_Albedo99_g76401;
				#endif
				half3 Blend_Albedo265_g76401 = staticSwitch255_g76401;
				half3 Tint_Gradient_Color5769_g76401 = float3(1,1,1);
				half3 Tint_Noise_Color5770_g76401 = float3(1,1,1);
				float3 temp_output_3_0_g76459 = ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 );
				float dotResult20_g76459 = dot( temp_output_3_0_g76459 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76401 = clamp( saturate( ( dotResult20_g76459 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76401 = clampResult6740_g76401;
				half Overlay_Shading6688_g76401 = Blend_Albedo_Globals6410_g76401;
				half Overlay_Custom6707_g76401 = 1.0;
				half Occlusion_Alpha6463_g76401 = _VertexOcclusionColor.a;
				float Mesh_Occlusion318_g76401 = packedInput.ase_color.g;
				float clampResult17_g76460 = clamp( Mesh_Occlusion318_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76470 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76470 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76470 );
				half Occlusion_Mask6432_g76401 = saturate( ( ( clampResult17_g76460 - temp_output_7_0_g76470 ) / ( temp_output_10_0_g76470 + 0.0001 ) ) );
				float lerpResult6467_g76401 = lerp( Occlusion_Alpha6463_g76401 , 1.0 , Occlusion_Mask6432_g76401);
				half Occlusion_Overlay6471_g76401 = lerpResult6467_g76401;
				float temp_output_7_0_g76468 = 0.1;
				float temp_output_10_0_g76468 = ( 0.2 - temp_output_7_0_g76468 );
				half Overlay_Mask_High6064_g76401 = saturate( ( ( ( Overlay_Value5738_g76401 * Overlay_Projection6081_g76401 * Overlay_Shading6688_g76401 * Overlay_Custom6707_g76401 * Occlusion_Overlay6471_g76401 ) - temp_output_7_0_g76468 ) / ( temp_output_10_0_g76468 + 0.0001 ) ) );
				half Overlay_Mask269_g76401 = Overlay_Mask_High6064_g76401;
				float lerpResult6585_g76401 = lerp( 1.0 , Global_OverlayNormalScale6581_g76401 , Overlay_Mask269_g76401);
				half2 Blend_Normal_Overlay366_g76401 = ( Blend_Normal312_g76401 * lerpResult6585_g76401 );
				half Global_WetnessNormalScale6571_g76401 = TVE_WetnessNormalValue;
				half Global_Extras_Wetness305_g76401 = break456_g76437.y;
				half Wetness_Value6343_g76401 = ( Global_Extras_Wetness305_g76401 * _GlobalWetness );
				float lerpResult6579_g76401 = lerp( 1.0 , Global_WetnessNormalScale6571_g76401 , ( Wetness_Value6343_g76401 * Wetness_Value6343_g76401 ));
				half2 Blend_Normal_Wetness6372_g76401 = ( Blend_Normal_Overlay366_g76401 * lerpResult6579_g76401 );
				float3 appendResult6568_g76401 = (float3(Blend_Normal_Wetness6372_g76401 , 1.0));
				float3 temp_output_13_0_g76438 = appendResult6568_g76401;
				float3 temp_output_33_0_g76438 = ( temp_output_13_0_g76438 * _render_normals );
				float3 switchResult12_g76438 = (((ase_vface>0)?(temp_output_13_0_g76438):(temp_output_33_0_g76438)));
				
				half Main_Smoothness227_g76401 = ( tex2DNode35_g76401.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76401 = ( tex2DNode33_g76401.a * _SecondSmoothnessValue );
				float lerpResult266_g76401 = lerp( Main_Smoothness227_g76401 , Second_Smoothness236_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g76401 = lerpResult266_g76401;
				#else
				float staticSwitch297_g76401 = Main_Smoothness227_g76401;
				#endif
				half Blend_Smoothness314_g76401 = staticSwitch297_g76401;
				half Global_OverlaySmoothness311_g76401 = TVE_OverlaySmoothness;
				float lerpResult343_g76401 = lerp( Blend_Smoothness314_g76401 , Global_OverlaySmoothness311_g76401 , Overlay_Mask269_g76401);
				half Blend_Smoothness_Overlay371_g76401 = lerpResult343_g76401;
				float temp_output_6499_0_g76401 = ( 1.0 - Wetness_Value6343_g76401 );
				half Blend_Smoothness_Wetness4130_g76401 = saturate( ( Blend_Smoothness_Overlay371_g76401 + ( 1.0 - ( temp_output_6499_0_g76401 * temp_output_6499_0_g76401 ) ) ) );
				
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = packedInput.ase_texcoord10.xyz;
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.Normal = switchResult12_g76438;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76401;
				surfaceDescription.Alpha = Final_Clip914_g76401;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				// Depth and Alpha to coverage
				#ifdef WRITE_MSAA_DEPTH
					// In case we are rendering in MSAA, reading the an MSAA depth buffer is way too expensive. To avoid that, we export the depth to a color buffer
					depthColor = packedInput.vmeshPositionCS.z;
					#ifdef _ALPHATOMASK_ON
					// Alpha channel is used for alpha to coverage
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				// Normal Buffer Processing
				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					#endif
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);

					#if ASE_SRP_VERSION >= 120107
					outDecalBuffer.w = (GetMeshRenderingLightLayer() & 0x000000FF) / 255.0;
					#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]

			

			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			

			
            ColorMask [_ColorMaskTransparentVelOne] 1
            ColorMask [_ColorMaskTransparentVelTwo] 2
		

			HLSLPROGRAM

            #define _MATERIAL_FEATURE_SPECULAR_COLOR 1
            #define _ENERGY_CONSERVING_SPECULAR 1
            #define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_ABSOLUTE_VERTEX_POS 1
            #define _SPECULAR_OCCLUSION_FROM_AO 1
            #define _AMBIENT_OCCLUSION 1
            #define HAVE_MESH_MODIFICATION
            #define ASE_SRP_VERSION 120106
            #if !defined(ASE_NEED_CULLFACE)
            #define ASE_NEED_CULLFACE 1
            #endif //ASE_NEED_CULLFACE
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ENABLE_FOG_ON_TRANSPARENT
			//#pragma shader_feature_local _DOUBLESIDED_ON
			//#pragma shader_feature_local _ALPHATEST_ON

			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH SHADOW_VERY_HIGH
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_FORWARD
		    #define HAS_LIGHTLOOP 1

			// Setup for Fog Enabled to apply in sky refletions in LightLoopDef.hlsl
            #define APPLY_FOG_ON_SKY_REFLECTIONS

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if (SHADERPASS == SHADERPASS_PATH_TRACING) && !defined(_DOUBLESIDED_ON) && (defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE))
			#undef  _REFRACTION_PLANE
			#undef  _REFRACTION_SPHERE
			#define _REFRACTION_THIN
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
            #ifdef SCENEPICKINGPASS
			float4 _SelectionID;
            #endif

			// Properties used by SceneSelectionPass
            #ifdef SCENESELECTIONPASS
			int _ObjectId;
			int _PassValue;
            #endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_OverlayNormalValue;
			half TVE_WetnessNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// Setup DECALS_OFF so the shader stripper can remove variants
            #define HAVE_DECALS ( (defined(DECALS_3RT) || defined(DECALS_4RT)) && !defined(_DISABLE_DECALS) )
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float3 previousPositionOS : TEXCOORD4;
				float3 precomputedVelocity : TEXCOORD5;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = 				surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.ase_texcoord.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.uv1.z , inputMesh.uv1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord8.xy = vertexToFrag11_g76431;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = ase_worldBitangent;
				outputPackedVaryingsMeshToPS.ase_texcoord10.xyz = vertexToFrag3890_g76401;
				outputPackedVaryingsMeshToPS.ase_texcoord11.xyz = vertexToFrag4224_g76401;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord8.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord10.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord11.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g76401;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

            #ifdef UNITY_VIRTUAL_TEXTURING
                #ifdef OUTPUT_SPLIT_LIGHTING
                   #define DIFFUSE_LIGHTING_TARGET SV_Target2
                   #define SSS_BUFFER_TARGET SV_Target3
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                   #define MOTION_VECTOR_TARGET SV_Target2
            	#endif

				
            #else
                #ifdef OUTPUT_SPLIT_LIGHTING
                #define DIFFUSE_LIGHTING_TARGET SV_Target1
                #define SSS_BUFFER_TARGET SV_Target2
                #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
                #define MOTION_VECTOR_TARGET SV_Target1
                #endif
            #endif

			void Frag(PackedVaryingsMeshToPS packedInput
				, out float4 outColor:SV_Target0
            #ifdef UNITY_VIRTUAL_TEXTURING
				, out float4 outVTFeedback : SV_Target1
            #endif
            #ifdef OUTPUT_SPLIT_LIGHTING
				, out float4 outDiffuseLighting : DIFFUSE_LIGHTING_TARGET
				, OUTPUT_SSSBUFFER(outSSSBuffer) : SSS_BUFFER_TARGET
            #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
				, out float4 outMotionVec : MOTION_VECTOR_TARGET
            #endif

            #ifdef _DEPTHOFFSET_ON
				, out float outputDepth : DEPTH_OFFSET_SEMANTIC
            #endif

		    
						)
			{
				
                #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				   outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
                #endif
			

			    

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (uint2)round(input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord7.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				float3 lerpResult6223_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76401).rgb , _MainAlbedoValue);
				half3 Main_Albedo99_g76401 = ( (_MainColor).rgb * lerpResult6223_g76401 );
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord8.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				float3 lerpResult6225_g76401 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76401).rgb , _SecondAlbedoValue);
				half3 Second_Albedo153_g76401 = ( (_SecondColor).rgb * lerpResult6225_g76401 );
				float3 lerpResult4834_g76401 = lerp( ( Main_Albedo99_g76401 * Second_Albedo153_g76401 * 4.594794 ) , Second_Albedo153_g76401 , _DetailBlendMode);
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldBitangent = packedInput.ase_texcoord9.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g76401 = lerp( Main_Albedo99_g76401 , lerpResult4834_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76401 = lerpResult235_g76401;
				#else
				float3 staticSwitch255_g76401 = Main_Albedo99_g76401;
				#endif
				half3 Blend_Albedo265_g76401 = staticSwitch255_g76401;
				half3 Tint_Gradient_Color5769_g76401 = float3(1,1,1);
				half3 Tint_Noise_Color5770_g76401 = float3(1,1,1);
				float Mesh_Occlusion318_g76401 = packedInput.ase_color.g;
				float clampResult17_g76460 = clamp( Mesh_Occlusion318_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76470 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76470 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76470 );
				half Occlusion_Mask6432_g76401 = saturate( ( ( clampResult17_g76460 - temp_output_7_0_g76470 ) / ( temp_output_10_0_g76470 + 0.0001 ) ) );
				float3 lerpResult2945_g76401 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76401);
				half3 Occlusion_Color648_g76401 = lerpResult2945_g76401;
				half3 Matcap_Color7428_g76401 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76401 = ( ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 * Occlusion_Color648_g76401 ) + Matcap_Color7428_g76401 );
				half3 Blend_Albedo_Colored863_g76401 = Blend_Albedo_Tinted2808_g76401;
				half3 Global_OverlayColor1758_g76401 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76419 = _LayerExtrasValue;
				float temp_output_19_0_g76423 = TVE_ExtrasUsage[(int)temp_output_84_0_g76419];
				float4 temp_output_93_19_g76419 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord10.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 vertexToFrag4224_g76401 = packedInput.ase_texcoord11.xyz;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 lerpResult4827_g76401 = lerp( WorldPosition3905_g76401 , ObjectPosition4223_g76401 , _ExtrasPositionMode);
				half2 UV96_g76419 = ( (temp_output_93_19_g76419).zw + ( (temp_output_93_19_g76419).xy * (lerpResult4827_g76401).xz ) );
				float4 tex2DArrayNode48_g76419 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76419,temp_output_84_0_g76419, 0.0 );
				float4 temp_output_17_0_g76423 = tex2DArrayNode48_g76419;
				float4 temp_output_94_85_g76419 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76423 = temp_output_94_85_g76419;
				float4 ifLocalVar18_g76423 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76423 >= 0.5 )
				ifLocalVar18_g76423 = temp_output_17_0_g76423;
				else
				ifLocalVar18_g76423 = temp_output_3_0_g76423;
				float4 lerpResult22_g76423 = lerp( temp_output_3_0_g76423 , temp_output_17_0_g76423 , temp_output_19_0_g76423);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76423 = lerpResult22_g76423;
				#else
				float4 staticSwitch24_g76423 = ifLocalVar18_g76423;
				#endif
				half4 Global_Extras_Params5440_g76401 = staticSwitch24_g76423;
				float4 break456_g76437 = Global_Extras_Params5440_g76401;
				half Global_Extras_Overlay156_g76401 = break456_g76437.z;
				half Overlay_Variation4560_g76401 = 1.0;
				half Overlay_Value5738_g76401 = ( _GlobalOverlay * Global_Extras_Overlay156_g76401 * Overlay_Variation4560_g76401 );
				half2 Main_Normal137_g76401 = temp_output_6555_0_g76401;
				float2 lerpResult3372_g76401 = lerp( float2( 0,0 ) , Main_Normal137_g76401 , _DetailNormalValue);
				half4 Normal_Packed45_g76430 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				float2 appendResult58_g76430 = (float2(( (Normal_Packed45_g76430).x * (Normal_Packed45_g76430).w ) , (Normal_Packed45_g76430).y));
				half2 Normal_Default50_g76430 = appendResult58_g76430;
				half2 Normal_ASTC41_g76430 = (Normal_Packed45_g76430).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76430 = Normal_ASTC41_g76430;
				#else
				float2 staticSwitch38_g76430 = Normal_Default50_g76430;
				#endif
				half2 Normal_NO_DTX544_g76430 = (Normal_Packed45_g76430).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76430 = Normal_NO_DTX544_g76430;
				#else
				float2 staticSwitch37_g76430 = staticSwitch38_g76430;
				#endif
				half2 Second_Normal179_g76401 = ( (staticSwitch37_g76430*2.0 + -1.0) * _SecondNormalValue );
				float2 temp_output_36_0_g76450 = ( lerpResult3372_g76401 + Second_Normal179_g76401 );
				float2 lerpResult3376_g76401 = lerp( Main_Normal137_g76401 , temp_output_36_0_g76450 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76401 = lerpResult3376_g76401;
				#else
				float2 staticSwitch267_g76401 = Main_Normal137_g76401;
				#endif
				half2 Blend_Normal312_g76401 = staticSwitch267_g76401;
				float3 appendResult7377_g76401 = (float3(Blend_Normal312_g76401 , 1.0));
				float3 tanNormal7376_g76401 = appendResult7377_g76401;
				float3 worldNormal7376_g76401 = float3(dot(tanToWorld0,tanNormal7376_g76401), dot(tanToWorld1,tanNormal7376_g76401), dot(tanToWorld2,tanNormal7376_g76401));
				half3 Blend_NormalWS7375_g76401 = worldNormal7376_g76401;
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				float lerpResult7446_g76401 = lerp( (Blend_NormalWS7375_g76401).y , packedInput.ase_normal.y , Vertex_DynamicMode5112_g76401);
				float lerpResult6757_g76401 = lerp( 1.0 , saturate( lerpResult7446_g76401 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76401 = lerpResult6757_g76401;
				float3 temp_output_3_0_g76459 = ( Blend_Albedo265_g76401 * Tint_Gradient_Color5769_g76401 * Tint_Noise_Color5770_g76401 );
				float dotResult20_g76459 = dot( temp_output_3_0_g76459 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76401 = clamp( saturate( ( dotResult20_g76459 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76401 = clampResult6740_g76401;
				half Overlay_Shading6688_g76401 = Blend_Albedo_Globals6410_g76401;
				half Overlay_Custom6707_g76401 = 1.0;
				half Occlusion_Alpha6463_g76401 = _VertexOcclusionColor.a;
				float lerpResult6467_g76401 = lerp( Occlusion_Alpha6463_g76401 , 1.0 , Occlusion_Mask6432_g76401);
				half Occlusion_Overlay6471_g76401 = lerpResult6467_g76401;
				float temp_output_7_0_g76468 = 0.1;
				float temp_output_10_0_g76468 = ( 0.2 - temp_output_7_0_g76468 );
				half Overlay_Mask_High6064_g76401 = saturate( ( ( ( Overlay_Value5738_g76401 * Overlay_Projection6081_g76401 * Overlay_Shading6688_g76401 * Overlay_Custom6707_g76401 * Occlusion_Overlay6471_g76401 ) - temp_output_7_0_g76468 ) / ( temp_output_10_0_g76468 + 0.0001 ) ) );
				half Overlay_Mask269_g76401 = Overlay_Mask_High6064_g76401;
				float3 lerpResult336_g76401 = lerp( Blend_Albedo_Colored863_g76401 , Global_OverlayColor1758_g76401 , Overlay_Mask269_g76401);
				half3 Blend_Albedo_Overlay359_g76401 = lerpResult336_g76401;
				half Global_WetnessContrast6502_g76401 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76401 = break456_g76437.y;
				half Wetness_Value6343_g76401 = ( Global_Extras_Wetness305_g76401 * _GlobalWetness );
				float3 lerpResult6367_g76401 = lerp( Blend_Albedo_Overlay359_g76401 , ( Blend_Albedo_Overlay359_g76401 * Blend_Albedo_Overlay359_g76401 ) , ( Global_WetnessContrast6502_g76401 * Wetness_Value6343_g76401 ));
				half3 Blend_Albedo_Wetness6351_g76401 = lerpResult6367_g76401;
				float3 _Vector10 = float3(1,1,1);
				half3 Tint_Highlight_Color5771_g76401 = _Vector10;
				float3 temp_output_6309_0_g76401 = ( Blend_Albedo_Wetness6351_g76401 * Tint_Highlight_Color5771_g76401 );
				half3 Blend_Albedo_Subsurface149_g76401 = temp_output_6309_0_g76401;
				half3 Blend_Albedo_RimLight7316_g76401 = Blend_Albedo_Subsurface149_g76401;
				
				half Global_OverlayNormalScale6581_g76401 = TVE_OverlayNormalValue;
				float lerpResult6585_g76401 = lerp( 1.0 , Global_OverlayNormalScale6581_g76401 , Overlay_Mask269_g76401);
				half2 Blend_Normal_Overlay366_g76401 = ( Blend_Normal312_g76401 * lerpResult6585_g76401 );
				half Global_WetnessNormalScale6571_g76401 = TVE_WetnessNormalValue;
				float lerpResult6579_g76401 = lerp( 1.0 , Global_WetnessNormalScale6571_g76401 , ( Wetness_Value6343_g76401 * Wetness_Value6343_g76401 ));
				half2 Blend_Normal_Wetness6372_g76401 = ( Blend_Normal_Overlay366_g76401 * lerpResult6579_g76401 );
				float3 appendResult6568_g76401 = (float3(Blend_Normal_Wetness6372_g76401 , 1.0));
				float3 temp_output_13_0_g76438 = appendResult6568_g76401;
				float3 temp_output_33_0_g76438 = ( temp_output_13_0_g76438 * _render_normals );
				float3 switchResult12_g76438 = (((isFrontFace>0)?(temp_output_13_0_g76438):(temp_output_33_0_g76438)));
				
				half Render_Specular4861_g76401 = _RenderSpecular;
				float3 temp_cast_6 = (( 0.04 * Render_Specular4861_g76401 )).xxx;
				
				half3 Emissive_Color7162_g76401 = (_EmissiveColor).rgb;
				half2 Emissive_UVs2468_g76401 = ( ( packedInput.ase_texcoord7.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g76527 = _EmissiveTexMinValue;
				float3 temp_cast_7 = (temp_output_7_0_g76527).xxx;
				float temp_output_10_0_g76527 = ( _EmissiveTexMaxValue - temp_output_7_0_g76527 );
				half3 Emissive_Texture7022_g76401 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76401 )).rgb - temp_cast_7 ) / ( temp_output_10_0_g76527 + 0.0001 ) ) );
				half Global_Extras_Emissive4203_g76401 = break456_g76437.x;
				float lerpResult4206_g76401 = lerp( 1.0 , Global_Extras_Emissive4203_g76401 , _GlobalEmissive);
				half Emissive_Value7024_g76401 = ( ( lerpResult4206_g76401 * _EmissivePhaseValue ) - 1.0 );
				half3 Emissive_Mask6968_g76401 = saturate( ( Emissive_Texture7022_g76401 + Emissive_Value7024_g76401 ) );
				float3 temp_output_3_0_g76436 = ( Emissive_Color7162_g76401 * Emissive_Mask6968_g76401 );
				float temp_output_15_0_g76436 = _emissive_intensity_value;
				float3 hdEmission22_g76436 = ASEGetEmissionHDRColor(temp_output_3_0_g76436,temp_output_15_0_g76436,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half3 Final_Emissive2476_g76401 = hdEmission22_g76436;
				
				half Main_Smoothness227_g76401 = ( tex2DNode35_g76401.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76401 = ( tex2DNode33_g76401.a * _SecondSmoothnessValue );
				float lerpResult266_g76401 = lerp( Main_Smoothness227_g76401 , Second_Smoothness236_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g76401 = lerpResult266_g76401;
				#else
				float staticSwitch297_g76401 = Main_Smoothness227_g76401;
				#endif
				half Blend_Smoothness314_g76401 = staticSwitch297_g76401;
				half Global_OverlaySmoothness311_g76401 = TVE_OverlaySmoothness;
				float lerpResult343_g76401 = lerp( Blend_Smoothness314_g76401 , Global_OverlaySmoothness311_g76401 , Overlay_Mask269_g76401);
				half Blend_Smoothness_Overlay371_g76401 = lerpResult343_g76401;
				float temp_output_6499_0_g76401 = ( 1.0 - Wetness_Value6343_g76401 );
				half Blend_Smoothness_Wetness4130_g76401 = saturate( ( Blend_Smoothness_Overlay371_g76401 + ( 1.0 - ( temp_output_6499_0_g76401 * temp_output_6499_0_g76401 ) ) ) );
				
				float lerpResult240_g76401 = lerp( 1.0 , tex2DNode35_g76401.g , _MainOcclusionValue);
				half Main_Occlusion247_g76401 = lerpResult240_g76401;
				float lerpResult239_g76401 = lerp( 1.0 , tex2DNode33_g76401.g , _SecondOcclusionValue);
				half Second_Occlusion251_g76401 = lerpResult239_g76401;
				float lerpResult294_g76401 = lerp( Main_Occlusion247_g76401 , Second_Occlusion251_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g76401 = lerpResult294_g76401;
				#else
				float staticSwitch310_g76401 = Main_Occlusion247_g76401;
				#endif
				half Blend_Occlusion323_g76401 = staticSwitch310_g76401;
				
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.BaseColor = Blend_Albedo_RimLight7316_g76401;
				surfaceDescription.Normal = switchResult12_g76438;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = temp_cast_6;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g76401;
				surfaceDescription.Smoothness = Blend_Smoothness_Wetness4130_g76401;
				surfaceDescription.Occlusion = Blend_Occlusion323_g76401;
				surfaceDescription.Alpha = Final_Clip914_g76401;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);

            #ifdef DEBUG_DISPLAY
            #ifdef OUTPUT_SPLIT_LIGHTING
				outDiffuseLighting = float4(0, 0, 0, 1);
				ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
            #endif

				bool viewMaterial = false;
				int bufferSize = _DebugViewMaterialArray[0].x;
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = _DebugViewMaterialArray[index].x;

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB && _DebugAOVOutput == 0)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);
						GetPBRValidatorDebug(surfaceData, result);
						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
                #endif
					{
                #ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
                #else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
                #endif
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;

						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

                #ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = float4(0, 0, 0, 1);
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
                #else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
                #endif

				

				
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);
						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
                #if defined(HAVE_VFX_MODIFICATION) && !VFX_FEATURE_MOTION_VECTORS
                        forceNoMotion = true;
                #endif
				        if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
			
				}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
					outVTFeedback = builtinData.vtPackedFeedback;
				#endif

			#if ASE_SRP_VERSION >= 130000
                #ifdef UNITY_VIRTUAL_TEXTURING
				    float vtAlphaValue = builtinData.opacity;
                    #if defined(HAS_REFRACTION) && HAS_REFRACTION
					vtAlphaValue = 1.0f - bsdfData.transmittanceMask;
                #endif
				outVTFeedback = PackVTFeedbackWithAlpha(builtinData.vtPackedFeedback, input.positionSS.xy, vtAlphaValue);
                #endif
			#endif
			}
			ENDHLSL
		}

		
		Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

            Cull [_CullMode]

            HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120106
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_TANGENT_TO_WORLD

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		    #define VARYINGS_NEED_CULLFACE
			#endif
			#endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
			#define WRITE_NORMAL_BUFFER
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
		    #endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

			float4 _SelectionID;
            CBUFFER_START( UnityPerMaterial )
			half4 _DetailMaskRemap;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _DetailMeshRemap;
			half4 _EmissiveTexRemap;
			half4 _RimLightRemap;
			half4 _VertexOcclusionRemap;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _SecondColor;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _NoiseMaskRemap;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half3 _render_normals;
			half _MotionScale_20;
			half _MotionVariation_20;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MotionFacingValue;
			half _EmissiveTexMinValue;
			half _MotionAmplitude_20;
			half _MotionAmplitude_22;
			half _LayerVertexValue;
			half _GlobalSize;
			half _InteractionAmplitude;
			half _InteractionMaskValue;
			half _LayerMotionValue;
			half _DetailAlphaMode;
			half _VertexDynamicMode;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			float _MotionScale_10;
			half _MotionPosition_10;
			half _VertexPivotMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _AlphaClipValue;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _SecondOcclusionValue;
			half _MainAlbedoValue;
			half _MainOcclusionValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			half _RenderSpecular;
			half _GlobalWetness;
			half _OverlayProjectionValue;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _ExtrasPositionMode;
			half _LayerExtrasValue;
			half _GlobalOverlay;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			float _emissive_intensity_value;
			half _EmissiveTexMaxValue;
			half _DetailValue;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMeshMaxValue;
			half _DetailMeshMinValue;
			half _DetailMeshMode;
			half _MainNormalValue;
			half _EmissiveExposureValue;
			half _DetailMaskMinValue;
			half _DetailMaskMode;
			half _DetailBlendMode;
			half _SecondAlbedoValue;
			half _MainSmoothnessValue;
			half _SecondSmoothnessValue;
			half _DetailMode;
			half _DetailMaskMaxValue;
			half _IsStandardShader;
			half _FadeConstantValue;
			half _SpaceSubsurface;
			half _SpaceGlobalLocals;
			half _SpaceGlobalLayers;
			half _SecondUVsMode;
			half _RenderCoverage;
			half _IsVersion;
			half _VertexVariationMode;
			half _IsShared;
			half _IsCollected;
			half _IsIdentifier;
			half _IsCustomShader;
			half _HasEmissive;
			half _HasGradient;
			half _HasOcclusion;
			half _IsTVEShader;
			half _MessageSubsurface;
			half _MessageGlobalsVariation;
			float _IsBarkShader;
			float _SubsurfaceDiffusion;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderZWrite;
			half _RenderClip;
			half _SpaceMotionLocals;
			half _RenderCull;
			half _RenderPriority;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageOcclusion;
			half _MessageMotionVariation;
			half _RenderQueue;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _CategoryGlobals;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _ColorsMaskMinValue;
			half _CategoryMatcap;
			half _ColorsMaskMaxValue;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _DetailMaskInvertMode;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _DetailTypeMode;
			half _Cutoff;
			half _CategoryRimLight;
			half _SubsurfaceScatteringValue;
			half _CategoryMain;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryPerspective;
			half _RenderDirect;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _CategoryMotion;
			half _DetailFadeMode;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
            #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
			float _EnableBlendModePreserveSpecularLighting;
            #endif
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef ASE_TESSELLATION
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			#endif
			CBUFFER_END

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
			#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_BARK_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 tangentWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

            struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
				float DepthOffset;
			};

			struct SurfaceDescriptionInputs
			{
				float3 ObjectSpaceNormal;
				float3 WorldSpaceNormal;
				float3 TangentSpaceNormal;
				float3 ObjectSpaceViewDirection;
				float3 WorldSpaceViewDirection;
				float3 ObjectSpacePosition;
			};


            void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {

                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif

                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
				float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
				ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);
                #endif

                #ifdef _ALPHATEST_ON
				float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
				alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                #endif
				GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif

                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

                #ifdef FRAG_INPUTS_USE_TEXCOORD1
				float4 lightmapTexCoord1 = fragInputs.texCoord1;
                #else
				float4 lightmapTexCoord1 = float4(0, 0, 0, 0);
                #endif

                #ifdef FRAG_INPUTS_USE_TEXCOORD2
				float4 lightmapTexCoord2 = fragInputs.texCoord2;
                #else
				float4 lightmapTexCoord2 = float4(0, 0, 0, 0);
                #endif

				//InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], lightmapTexCoord1, lightmapTexCoord2, builtinData);

                //#else
                //BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

                ZERO_INITIALIZE(SurfaceData, surfaceData);

                ZERO_BUILTIN_INITIALIZE(builtinData);
                builtinData.opacity = surfaceDescription.Alpha;

                #if defined(DEBUG_DISPLAY)
				builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif

                #ifdef _ALPHATEST_ON
				builtinData.alphaClipTreshold = alphaCutoff;
                #endif

                #ifdef UNITY_VIRTUAL_TEXTURING
                #endif

                #if _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

                #if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif

                #ifndef SHADER_UNLIT
				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
				ApplyDebugToBuiltinData(builtinData);
                #endif

				RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS

            }


			VertexOutput VertexFunction(VertexInput inputMesh  )
			{

				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o );

				float3 VertexPosition3588_g76401 = inputMesh.positionOS;
				float3 appendResult60_g76411 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76401 = ( appendResult60_g76411 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76401 = Mesh_PivotsData2831_g76401;
				float3 temp_output_2283_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				half3 VertexPos40_g76514 = temp_output_2283_0_g76401;
				half3 VertexPos40_g76515 = VertexPos40_g76514;
				float3 appendResult74_g76515 = (float3(VertexPos40_g76515.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76515 = appendResult74_g76515;
				float3 break84_g76515 = VertexPos40_g76515;
				float3 appendResult81_g76515 = (float3(0.0 , break84_g76515.y , break84_g76515.z));
				half3 VertexPosOtherAxis82_g76515 = appendResult81_g76515;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 vertexToFrag3890_g76401 = ase_worldPos;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float3 WorldPosition_Shifted7477_g76401 = ( WorldPosition3905_g76401 - TVE_WorldOrigin );
				float3 localObjectPosition_UNITY_MATRIX_M14_g76477 = ObjectPosition_UNITY_MATRIX_M();
				float3 temp_output_122_0_g76477 = Mesh_PivotsData2831_g76401;
				float3 PivotsOnly105_g76477 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76477 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g76477 = ( ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g76477 = ( localObjectPosition_UNITY_MATRIX_M14_g76477 + PivotsOnly105_g76477 );
				#endif
				half3 ObjectData20_g76479 = staticSwitch13_g76477;
				half3 WorldData19_g76479 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76479 = WorldData19_g76479;
				#else
				float3 staticSwitch14_g76479 = ObjectData20_g76479;
				#endif
				float3 temp_output_114_0_g76477 = staticSwitch14_g76479;
				float3 vertexToFrag4224_g76401 = temp_output_114_0_g76477;
				float3 ObjectPosition4223_g76401 = vertexToFrag4224_g76401;
				float3 ObjectPosition_Shifted7481_g76401 = ( ObjectPosition4223_g76401 - TVE_WorldOrigin );
				float3 lerpResult6766_g76401 = lerp( WorldPosition_Shifted7477_g76401 , ObjectPosition_Shifted7481_g76401 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76401 = lerpResult6766_g76401;
				half3 Input_Position419_g76497 = Motion_10_Position6738_g76401;
				float Input_MotionScale287_g76497 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g76497 = (( Input_Position419_g76497 * Input_MotionScale287_g76497 * 0.0075 )).xz;
				float2 temp_output_447_0_g76406 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76401 = temp_output_447_0_g76406;
				half2 Input_DirectionWS423_g76497 = Global_Wind_DirectionWS4683_g76401;
				float lerpResult115_g76498 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76497 = _MotionSpeed_10;
				half Input_MotionVariation284_g76497 = _MotionVariation_10;
				half3 Input_Position167_g76472 = ObjectPosition_Shifted7481_g76401;
				float dotResult156_g76472 = dot( (Input_Position167_g76472).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76401 = _VertexDynamicMode;
				half Input_DynamicMode120_g76472 = Vertex_DynamicMode5112_g76401;
				float Postion_Random162_g76472 = ( sin( dotResult156_g76472 ) * ( 1.0 - Input_DynamicMode120_g76472 ) );
				float Mesh_Variation16_g76401 = inputMesh.ase_color.r;
				half Input_Variation124_g76472 = Mesh_Variation16_g76401;
				half ObjectData20_g76474 = frac( ( Postion_Random162_g76472 + Input_Variation124_g76472 ) );
				half WorldData19_g76474 = Input_Variation124_g76472;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76474 = WorldData19_g76474;
				#else
				float staticSwitch14_g76474 = ObjectData20_g76474;
				#endif
				float temp_output_112_0_g76472 = staticSwitch14_g76474;
				float clampResult171_g76472 = clamp( temp_output_112_0_g76472 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76401 = clampResult171_g76472;
				half Input_GlobalMeshVariation569_g76497 = Global_MeshVariation5104_g76401;
				float temp_output_630_0_g76497 = ( ( ( lerpResult115_g76498 * Input_MotionSpeed62_g76497 ) + ( Input_MotionVariation284_g76497 * Input_GlobalMeshVariation569_g76497 ) ) * 0.03 );
				float temp_output_607_0_g76497 = frac( temp_output_630_0_g76497 );
				float4 lerpResult590_g76497 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * temp_output_607_0_g76497 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76497 + ( -Input_DirectionWS423_g76497 * frac( ( temp_output_630_0_g76497 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76497 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76497 = lerpResult590_g76497;
				float2 temp_output_645_0_g76497 = ((Noise_Complex703_g76497).rg*2.0 + -1.0);
				float2 break650_g76497 = temp_output_645_0_g76497;
				float3 appendResult649_g76497 = (float3(break650_g76497.x , 0.0 , break650_g76497.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76497 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76520 = Global_Noise_OS5548_g76401;
				float2 break448_g76406 = temp_output_447_0_g76406;
				float3 appendResult452_g76406 = (float3(break448_g76406.x , 0.0 , break448_g76406.y));
				half2 Global_Wind_DirectionOS5692_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76520 = Global_Wind_DirectionOS5692_g76401;
				float temp_output_84_0_g76414 = _LayerMotionValue;
				float temp_output_19_0_g76418 = TVE_MotionUsage[(int)temp_output_84_0_g76414];
				float4 temp_output_91_19_g76414 = TVE_MotionCoords;
				half2 UV94_g76414 = ( (temp_output_91_19_g76414).zw + ( (temp_output_91_19_g76414).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76414 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76414,temp_output_84_0_g76414, 0.0 );
				float4 temp_output_17_0_g76418 = tex2DArrayNode50_g76414;
				float4 temp_output_112_19_g76414 = TVE_MotionParams;
				float4 temp_output_3_0_g76418 = temp_output_112_19_g76414;
				float4 ifLocalVar18_g76418 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76418 >= 0.5 )
				ifLocalVar18_g76418 = temp_output_17_0_g76418;
				else
				ifLocalVar18_g76418 = temp_output_3_0_g76418;
				float4 lerpResult22_g76418 = lerp( temp_output_3_0_g76418 , temp_output_17_0_g76418 , temp_output_19_0_g76418);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76418 = lerpResult22_g76418;
				#else
				float4 staticSwitch24_g76418 = ifLocalVar18_g76418;
				#endif
				half4 Global_Motion_Params3909_g76401 = staticSwitch24_g76418;
				float4 break322_g76406 = Global_Motion_Params3909_g76401;
				half Global_Wind_Power2223_g76401 = break322_g76406.z;
				half Input_WindPower449_g76520 = Global_Wind_Power2223_g76401;
				float temp_output_565_0_g76520 = ( 1.0 - Input_WindPower449_g76520 );
				float2 lerpResult516_g76520 = lerp( Input_Noise_DirectionOS487_g76520 , Input_Wind_DirectionOS458_g76520 , ( ( 1.0 - ( temp_output_565_0_g76520 * temp_output_565_0_g76520 * temp_output_565_0_g76520 ) ) * 0.6 ));
				half Mesh_Motion_107572_g76401 = inputMesh.ase_color.a;
				half Input_MeshHeight388_g76520 = Mesh_Motion_107572_g76401;
				half ObjectData20_g76521 = Input_MeshHeight388_g76520;
				float enc62_g76525 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76525 = DecodeFloatToVector2( enc62_g76525 );
				float2 break63_g76525 = ( localDecodeFloatToVector262_g76525 * 100.0 );
				float Bounds_Height5230_g76401 = break63_g76525.x;
				half Input_BoundsHeight390_g76520 = Bounds_Height5230_g76401;
				half WorldData19_g76521 = ( Input_MeshHeight388_g76520 * Input_MeshHeight388_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76521 = WorldData19_g76521;
				#else
				float staticSwitch14_g76521 = ObjectData20_g76521;
				#endif
				half Final_Motion10_Mask321_g76520 = ( staticSwitch14_g76521 * 2.0 );
				half Input_BendingAmplitude376_g76520 = _MotionAmplitude_10;
				half Global_MotionValue640_g76520 = TVE_MotionValue_10;
				half2 Final_Bending631_g76520 = ( lerpResult516_g76520 * ( Final_Motion10_Mask321_g76520 * Input_BendingAmplitude376_g76520 * Input_WindPower449_g76520 * Input_WindPower449_g76520 * Global_MotionValue640_g76520 ) );
				float2 appendResult433_g76406 = (float2(break322_g76406.x , break322_g76406.y));
				float2 temp_output_436_0_g76406 = (appendResult433_g76406*2.0 + -1.0);
				float2 break441_g76406 = temp_output_436_0_g76406;
				float3 appendResult440_g76406 = (float3(break441_g76406.x , 0.0 , break441_g76406.y));
				half2 Global_React_DirectionOS39_g76401 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76406 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76520 = Global_React_DirectionOS39_g76401;
				float clampResult17_g76523 = clamp( Input_MeshHeight388_g76520 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76522 = 0.0;
				half Input_InteractionUseMask62_g76520 = _InteractionMaskValue;
				float temp_output_10_0_g76522 = ( Input_InteractionUseMask62_g76520 - temp_output_7_0_g76522 );
				half Final_InteractionRemap594_g76520 = saturate( ( ( clampResult17_g76523 - temp_output_7_0_g76522 ) / ( temp_output_10_0_g76522 + 0.0001 ) ) );
				half ObjectData20_g76524 = Final_InteractionRemap594_g76520;
				half WorldData19_g76524 = ( Final_InteractionRemap594_g76520 * Final_InteractionRemap594_g76520 * Input_BoundsHeight390_g76520 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76524 = WorldData19_g76524;
				#else
				float staticSwitch14_g76524 = ObjectData20_g76524;
				#endif
				half Final_InteractionMask373_g76520 = ( staticSwitch14_g76524 * 2.0 );
				half Input_InteractionAmplitude58_g76520 = _InteractionAmplitude;
				half2 Final_Interaction632_g76520 = ( Input_React_DirectionOS358_g76520 * Final_InteractionMask373_g76520 * Input_InteractionAmplitude58_g76520 );
				half Global_Interaction_Mask66_g76401 = ( break322_g76406.w * break322_g76406.w * break322_g76406.w * break322_g76406.w );
				float Input_InteractionGlobalMask330_g76520 = Global_Interaction_Mask66_g76401;
				half Final_InteractionValue525_g76520 = saturate( ( Input_InteractionAmplitude58_g76520 * Input_InteractionGlobalMask330_g76520 ) );
				float2 lerpResult551_g76520 = lerp( Final_Bending631_g76520 , Final_Interaction632_g76520 , Final_InteractionValue525_g76520);
				float2 break364_g76520 = lerpResult551_g76520;
				float3 appendResult638_g76520 = (float3(break364_g76520.x , 0.0 , break364_g76520.y));
				half3 Motion_10_Interaction7519_g76401 = appendResult638_g76520;
				half3 Angle44_g76514 = Motion_10_Interaction7519_g76401;
				half Angle44_g76515 = (Angle44_g76514).z;
				half3 VertexPos40_g76516 = ( VertexPosRotationAxis50_g76515 + ( VertexPosOtherAxis82_g76515 * cos( Angle44_g76515 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76515 ) * sin( Angle44_g76515 ) ) );
				float3 appendResult74_g76516 = (float3(0.0 , 0.0 , VertexPos40_g76516.z));
				half3 VertexPosRotationAxis50_g76516 = appendResult74_g76516;
				float3 break84_g76516 = VertexPos40_g76516;
				float3 appendResult81_g76516 = (float3(break84_g76516.x , break84_g76516.y , 0.0));
				half3 VertexPosOtherAxis82_g76516 = appendResult81_g76516;
				half Angle44_g76516 = -(Angle44_g76514).x;
				half3 Input_Position419_g76506 = WorldPosition_Shifted7477_g76401;
				float3 break459_g76506 = Input_Position419_g76506;
				float Sum_Position446_g76506 = ( break459_g76506.x + break459_g76506.y + break459_g76506.z );
				half Input_MotionScale321_g76506 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76506 = _MotionVariation_20;
				half Input_GlobalVariation400_g76506 = Global_MeshVariation5104_g76401;
				float lerpResult115_g76507 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76506 = _MotionSpeed_20;
				float temp_output_404_0_g76506 = ( lerpResult115_g76507 * Input_MotionSpeed62_g76506 );
				half Motion_SineA450_g76506 = sin( ( ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) + ( Input_MotionVariation330_g76506 * Input_GlobalVariation400_g76506 ) + temp_output_404_0_g76506 ) );
				half Motion_SineB395_g76506 = sin( ( ( temp_output_404_0_g76506 * 0.6842 ) + ( Sum_Position446_g76506 * Input_MotionScale321_g76506 ) ) );
				half3 Input_Position419_g76412 = VertexPosition3588_g76401;
				float3 normalizeResult518_g76412 = normalize( Input_Position419_g76412 );
				half2 Input_DirectionOS423_g76412 = Global_React_DirectionOS39_g76401;
				float2 break521_g76412 = -Input_DirectionOS423_g76412;
				float3 appendResult522_g76412 = (float3(break521_g76412.x , 0.0 , break521_g76412.y));
				float dotResult519_g76412 = dot( normalizeResult518_g76412 , appendResult522_g76412 );
				half Input_Value62_g76412 = _MotionFacingValue;
				float lerpResult524_g76412 = lerp( 1.0 , (dotResult519_g76412*0.5 + 0.5) , Input_Value62_g76412);
				half ObjectData20_g76413 = max( lerpResult524_g76412 , 0.001 );
				half WorldData19_g76413 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76413 = WorldData19_g76413;
				#else
				float staticSwitch14_g76413 = ObjectData20_g76413;
				#endif
				half Motion_FacingMask5214_g76401 = staticSwitch14_g76413;
				half Motion_20_Amplitude4381_g76401 = ( _MotionValue_20 * Motion_FacingMask5214_g76401 );
				half Input_MotionAmplitude384_g76506 = Motion_20_Amplitude4381_g76401;
				half Input_GlobalWind407_g76506 = Global_Wind_Power2223_g76401;
				float4 break638_g76497 = abs( Noise_Complex703_g76497 );
				half Global_Noise_B5526_g76401 = break638_g76497.b;
				half Input_GlobalNoise411_g76506 = Global_Noise_B5526_g76401;
				float lerpResult413_g76506 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76506);
				half Motion_Amplitude418_g76506 = ( Input_MotionAmplitude384_g76506 * Input_GlobalWind407_g76506 * pow( Input_GlobalNoise411_g76506 , lerpResult413_g76506 ) );
				half Input_Squash58_g76506 = _MotionAmplitude_20;
				float enc59_g76525 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76525 = DecodeFloatToVector2( enc59_g76525 );
				float2 break61_g76525 = localDecodeFloatToVector259_g76525;
				half Mesh_Motion_2060_g76401 = break61_g76525.x;
				half Input_MeshMotion_20388_g76506 = Mesh_Motion_2060_g76401;
				float Bounds_Radius5231_g76401 = break63_g76525.y;
				half Input_BoundsRadius390_g76506 = Bounds_Radius5231_g76401;
				half Global_MotionValue462_g76506 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76506 = Global_React_DirectionOS39_g76401;
				float2 break371_g76506 = Input_DirectionOS366_g76506;
				float3 appendResult372_g76506 = (float3(break371_g76506.x , ( Motion_SineA450_g76506 * 0.3 ) , break371_g76506.y));
				half3 Motion_20_Squash4418_g76401 = ( ( (max( Motion_SineA450_g76506 , Motion_SineB395_g76506 )*0.5 + 0.5) * Motion_Amplitude418_g76506 * Input_Squash58_g76506 * Input_MeshMotion_20388_g76506 * Input_BoundsRadius390_g76506 * Global_MotionValue462_g76506 ) * appendResult372_g76506 );
				half3 VertexPos40_g76505 = ( ( VertexPosRotationAxis50_g76516 + ( VertexPosOtherAxis82_g76516 * cos( Angle44_g76516 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76516 ) * sin( Angle44_g76516 ) ) ) + Motion_20_Squash4418_g76401 );
				float3 appendResult74_g76505 = (float3(0.0 , VertexPos40_g76505.y , 0.0));
				float3 VertexPosRotationAxis50_g76505 = appendResult74_g76505;
				float3 break84_g76505 = VertexPos40_g76505;
				float3 appendResult81_g76505 = (float3(break84_g76505.x , 0.0 , break84_g76505.z));
				float3 VertexPosOtherAxis82_g76505 = appendResult81_g76505;
				half Input_Rolling379_g76506 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76401 = ( Motion_SineA450_g76506 * Motion_Amplitude418_g76506 * Input_Rolling379_g76506 * Input_MeshMotion_20388_g76506 * Global_MotionValue462_g76506 );
				half Angle44_g76505 = Motion_20_Rolling5257_g76401;
				float3 Vertex_Motion_Object833_g76401 = ( VertexPosRotationAxis50_g76505 + ( VertexPosOtherAxis82_g76505 * cos( Angle44_g76505 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76505 ) * sin( Angle44_g76505 ) ) );
				half3 ObjectData20_g76491 = Vertex_Motion_Object833_g76401;
				float3 temp_output_3474_0_g76401 = ( VertexPosition3588_g76401 - Mesh_PivotsOS2291_g76401 );
				float3 Vertex_Motion_World1118_g76401 = ( ( temp_output_3474_0_g76401 + Motion_10_Interaction7519_g76401 ) + Motion_20_Squash4418_g76401 );
				half3 WorldData19_g76491 = Vertex_Motion_World1118_g76401;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76491 = WorldData19_g76491;
				#else
				float3 staticSwitch14_g76491 = ObjectData20_g76491;
				#endif
				float3 temp_output_7495_0_g76401 = staticSwitch14_g76491;
				float3 Vertex_Motion7493_g76401 = temp_output_7495_0_g76401;
				half3 Grass_Perspective2661_g76401 = half3(0,0,0);
				float temp_output_84_0_g76439 = _LayerVertexValue;
				float temp_output_19_0_g76443 = TVE_VertexUsage[(int)temp_output_84_0_g76439];
				float4 temp_output_94_19_g76439 = TVE_VertexCoords;
				half2 UV97_g76439 = ( (temp_output_94_19_g76439).zw + ( (temp_output_94_19_g76439).xy * (ObjectPosition4223_g76401).xz ) );
				float4 tex2DArrayNode50_g76439 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76439,temp_output_84_0_g76439, 0.0 );
				float4 temp_output_17_0_g76443 = tex2DArrayNode50_g76439;
				float4 temp_output_111_19_g76439 = TVE_VertexParams;
				float4 temp_output_3_0_g76443 = temp_output_111_19_g76439;
				float4 ifLocalVar18_g76443 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76443 >= 0.5 )
				ifLocalVar18_g76443 = temp_output_17_0_g76443;
				else
				ifLocalVar18_g76443 = temp_output_3_0_g76443;
				float4 lerpResult22_g76443 = lerp( temp_output_3_0_g76443 , temp_output_17_0_g76443 , temp_output_19_0_g76443);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76443 = lerpResult22_g76443;
				#else
				float4 staticSwitch24_g76443 = ifLocalVar18_g76443;
				#endif
				half4 Global_Vertex_Params4173_g76401 = staticSwitch24_g76443;
				float4 break322_g76444 = Global_Vertex_Params4173_g76401;
				half Global_VertexSize174_g76401 = saturate( break322_g76444.w );
				float lerpResult346_g76401 = lerp( 1.0 , Global_VertexSize174_g76401 , _GlobalSize);
				float3 appendResult3480_g76401 = (float3(lerpResult346_g76401 , lerpResult346_g76401 , lerpResult346_g76401));
				half3 ObjectData20_g76488 = appendResult3480_g76401;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76488 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76488 = WorldData19_g76488;
				#else
				float3 staticSwitch14_g76488 = ObjectData20_g76488;
				#endif
				half3 Vertex_Size1741_g76401 = staticSwitch14_g76488;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76401 = _Vector5;
				float3 lerpResult16_g76492 = lerp( VertexPosition3588_g76401 , ( ( ( Vertex_Motion7493_g76401 + Grass_Perspective2661_g76401 ) * Vertex_Size1741_g76401 * Vertex_SizeFade1740_g76401 ) + Mesh_PivotsOS2291_g76401 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76401 = lerpResult16_g76492;
				float3 Final_VertexPosition890_g76401 = ( temp_output_4912_0_g76401 + _DisableSRPBatcher );
				
				float4 break33_g76432 = _second_uvs_mode;
				float2 temp_output_30_0_g76432 = ( inputMesh.ase_texcoord.xy * break33_g76432.x );
				float2 appendResult21_g76525 = (float2(inputMesh.ase_texcoord1.z , inputMesh.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76401 = appendResult21_g76525;
				float2 temp_output_29_0_g76432 = ( Mesh_DetailCoord3_g76401 * break33_g76432.y );
				float2 temp_output_31_0_g76432 = ( (WorldPosition_Shifted7477_g76401).xz * break33_g76432.z );
				float2 vertexToFrag11_g76431 = ( ( ( temp_output_30_0_g76432 + temp_output_29_0_g76432 + temp_output_31_0_g76432 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				o.ase_texcoord3.xy = vertexToFrag11_g76431;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				o.ase_texcoord5.xyz = ase_worldPos;
				o.ase_texcoord6.xyz = vertexToFrag3890_g76401;
				
				o.ase_texcoord2 = inputMesh.ase_texcoord;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  Final_VertexPosition890_g76401;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				o.positionCS = TransformWorldToHClip(positionRWS);
				o.normalWS.xyz =  normalWS;
				o.tangentWS.xyzw =  tangentWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(	VertexOutput packedInput
						, out float4 outColor : SV_Target0
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS.xyzw, packedInput.normalWS.xyz);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float localCustomAlphaClip19_g76456 = ( 0.0 );
				half2 Main_UVs15_g76401 = ( ( packedInput.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76401 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76401 );
				half Main_Alpha316_g76401 = tex2DNode29_g76401.a;
				float2 vertexToFrag11_g76431 = packedInput.ase_texcoord3.xy;
				half2 Second_UVs17_g76401 = vertexToFrag11_g76431;
				float4 tex2DNode89_g76401 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76401 );
				half Second_Alpha5007_g76401 = tex2DNode89_g76401.a;
				float4 tex2DNode35_g76401 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				half Main_Mask57_g76401 = tex2DNode35_g76401.b;
				float4 tex2DNode33_g76401 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76401 );
				half Second_Mask81_g76401 = tex2DNode33_g76401.b;
				float lerpResult6885_g76401 = lerp( Main_Mask57_g76401 , Second_Mask81_g76401 , _DetailMaskMode);
				float clampResult17_g76511 = clamp( lerpResult6885_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76510 = _DetailMaskMinValue;
				float temp_output_10_0_g76510 = ( _DetailMaskMaxValue - temp_output_7_0_g76510 );
				half Blend_Mask_Texture6794_g76401 = saturate( ( ( clampResult17_g76511 - temp_output_7_0_g76510 ) / ( temp_output_10_0_g76510 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76401 = packedInput.ase_color.b;
				half4 Normal_Packed45_g76429 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76401 );
				float2 appendResult58_g76429 = (float2(( (Normal_Packed45_g76429).x * (Normal_Packed45_g76429).w ) , (Normal_Packed45_g76429).y));
				half2 Normal_Default50_g76429 = appendResult58_g76429;
				half2 Normal_ASTC41_g76429 = (Normal_Packed45_g76429).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76429 = Normal_ASTC41_g76429;
				#else
				float2 staticSwitch38_g76429 = Normal_Default50_g76429;
				#endif
				half2 Normal_NO_DTX544_g76429 = (Normal_Packed45_g76429).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76429 = Normal_NO_DTX544_g76429;
				#else
				float2 staticSwitch37_g76429 = staticSwitch38_g76429;
				#endif
				float2 temp_output_6555_0_g76401 = ( (staticSwitch37_g76429*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76401 = (float3(temp_output_6555_0_g76401 , 1.0));
				float3 ase_worldBitangent = packedInput.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( packedInput.tangentWS.xyz.x, ase_worldBitangent.x, packedInput.normalWS.x );
				float3 tanToWorld1 = float3( packedInput.tangentWS.xyz.y, ase_worldBitangent.y, packedInput.normalWS.y );
				float3 tanToWorld2 = float3( packedInput.tangentWS.xyz.z, ase_worldBitangent.z, packedInput.normalWS.z );
				float3 tanNormal7389_g76401 = appendResult7388_g76401;
				float3 worldNormal7389_g76401 = float3(dot(tanToWorld0,tanNormal7389_g76401), dot(tanToWorld1,tanNormal7389_g76401), dot(tanToWorld2,tanNormal7389_g76401));
				half3 Main_NormalWS7390_g76401 = worldNormal7389_g76401;
				float lerpResult6884_g76401 = lerp( Mesh_DetailMask90_g76401 , ((Main_NormalWS7390_g76401).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76509 = clamp( lerpResult6884_g76401 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76508 = _DetailMeshMinValue;
				float temp_output_10_0_g76508 = ( _DetailMeshMaxValue - temp_output_7_0_g76508 );
				half Blend_Mask_Mesh1540_g76401 = saturate( ( ( clampResult17_g76509 - temp_output_7_0_g76508 ) / ( temp_output_10_0_g76508 + 0.0001 ) ) );
				float clampResult17_g76528 = clamp( ( Blend_Mask_Texture6794_g76401 * Blend_Mask_Mesh1540_g76401 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76529 = _DetailBlendMinValue;
				float temp_output_10_0_g76529 = ( _DetailBlendMaxValue - temp_output_7_0_g76529 );
				half Blend_Mask147_g76401 = ( saturate( ( ( clampResult17_g76528 - temp_output_7_0_g76529 ) / ( temp_output_10_0_g76529 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76401 = lerp( Main_Alpha316_g76401 , Second_Alpha5007_g76401 , Blend_Mask147_g76401);
				float lerpResult6785_g76401 = lerp( ( Main_Alpha316_g76401 * Second_Alpha5007_g76401 ) , lerpResult6153_g76401 , _DetailAlphaMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76401 = lerpResult6785_g76401;
				#else
				float staticSwitch6158_g76401 = Main_Alpha316_g76401;
				#endif
				half Blend_Alpha6157_g76401 = staticSwitch6158_g76401;
				half AlphaTreshold2132_g76401 = _AlphaClipValue;
				half Global_Alpha315_g76401 = 1.0;
				half Fade_Effects_A5360_g76401 = 1.0;
				float3 ase_worldPos = packedInput.ase_texcoord5.xyz;
				float temp_output_7_0_g76469 = TVE_CameraFadeMin;
				float temp_output_10_0_g76469 = ( TVE_CameraFadeMax - temp_output_7_0_g76469 );
				float lerpResult4755_g76401 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76469 ) / ( temp_output_10_0_g76469 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76401 = lerpResult4755_g76401;
				float lerpResult6866_g76401 = lerp( ( 1.0 - Blend_Mask147_g76401 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76401 = lerpResult6866_g76401;
				#else
				float staticSwitch6612_g76401 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76401 = staticSwitch6612_g76401;
				half Fade_Mask5149_g76401 = ( 1.0 * Blend_Mask_Invert6260_g76401 );
				float lerpResult5141_g76401 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76401 * Fade_Camera3743_g76401 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76401);
				half Fade_Effects_B6228_g76401 = lerpResult5141_g76401;
				float3 vertexToFrag3890_g76401 = packedInput.ase_texcoord6.xyz;
				float3 WorldPosition3905_g76401 = vertexToFrag3890_g76401;
				float temp_output_5865_0_g76401 = saturate( ( Fade_Effects_B6228_g76401 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76401 ) ).r ) );
				half Fade_Alpha3727_g76401 = temp_output_5865_0_g76401;
				float Emissive_Alpha6927_g76401 = 1.0;
				half Final_Alpha7344_g76401 = min( min( ( Blend_Alpha6157_g76401 - AlphaTreshold2132_g76401 ) , Global_Alpha315_g76401 ) , min( Fade_Alpha3727_g76401 , Emissive_Alpha6927_g76401 ) );
				float temp_output_3_0_g76456 = Final_Alpha7344_g76401;
				float Alpha19_g76456 = temp_output_3_0_g76456;
				float temp_output_15_0_g76456 = 0.01;
				float Treshold19_g76456 = temp_output_15_0_g76456;
				{
				#if defined (TVE_FEATURE_CLIP)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#else
				clip(Alpha19_g76456 - Treshold19_g76456);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76401 = _MainColor.a;
				half Second_Color_Alpha6152_g76401 = _SecondColor.a;
				float lerpResult6168_g76401 = lerp( Main_Color_Alpha6121_g76401 , Second_Color_Alpha6152_g76401 , Blend_Mask147_g76401);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76401 = lerpResult6168_g76401;
				#else
				float staticSwitch6174_g76401 = Main_Color_Alpha6121_g76401;
				#endif
				half Blend_Color_Alpha6167_g76401 = staticSwitch6174_g76401;
				half Final_Clip914_g76401 = saturate( ( Alpha19_g76456 * Blend_Color_Alpha6167_g76401 ) );
				
				surfaceDescription.Alpha = Final_Clip914_g76401;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;


				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				outColor = _SelectionID;
			}

            ENDHLSL
		}

        Pass
        {

            Name "FullScreenDebug"
            Tags 
            { 
                "LightMode" = "FullScreenDebug" 
            }

            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

            HLSLPROGRAM

			/*ase_pragma_before*/

			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer

			#pragma vertex Vert
			#pragma fragment Frag


			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"

			#ifndef SHADER_UNLIT
			#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
			#endif
			#endif

		    #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
		    #define OUTPUT_SPLIT_LIGHTING
		    #endif

		    #if !( (SHADERPASS == SHADERPASS_FORWARD) || (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT) \
               || (SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT) || (SHADERPASS == SHADERPASS == SHADERPASS_RAYTRACING_INDIRECT)\
               || (SHADERPASS == SHADERPASS_PATH_TRACING) || (SHADERPASS == SHADERPASS_RAYTRACING_SUB_SURFACE) \
               || (SHADERPASS == SHADERPASS_RAYTRACING_GBUFFER) )

		    #define DISABLE_MODIFY_BAKED_DIFFUSE_LIGHTING
		    #endif

			#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
			#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
				#define WRITE_NORMAL_BUFFER
			#endif
			#endif

			#ifndef DEBUG_DISPLAY
				#if !defined(_SURFACE_TYPE_TRANSPARENT)
					#if SHADERPASS == SHADERPASS_FORWARD
					#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
					#elif SHADERPASS == SHADERPASS_GBUFFER
					#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
					#endif
				#endif
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
			#endif

			#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
			#endif

            #ifdef DEBUG_DISPLAY
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
					uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}

            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};

			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}

            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};

			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);

				output.ObjectSpaceNormal =                          input.normalOS;
				output.ObjectSpaceTangent =                         input.tangentOS.xyz;
				output.ObjectSpacePosition =                        input.positionOS;

				return output;
			}

			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);

				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}

			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);

				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS;

				return output;
			}


			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}


            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
			{
				SurfaceDescriptionInputs output;
				ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

				#if defined(SHADER_STAGE_RAY_TRACING)
				#else
				#endif
				output.TangentSpaceNormal =                         float3(0.0f, 0.0f, 1.0f);
				return output;
			}

			void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
				surfaceData.metallic =                  surfaceDescription.Metallic;

				#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
					if (_EnableSSRefraction)
					{

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif


				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
                #ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
					surfaceData.normalWS = float3(0, 1, 0);
                #endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
				#endif


				GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);


				#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
					}
				#endif

				bentNormalWS = surfaceData.normalWS;

				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#ifdef DEBUG_DISPLAY
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{

						surfaceData.metallic = 0;
					}

					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif

                #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                #endif
			}

            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {

                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif

                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif

                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants);
                #endif

                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);

                #ifdef _ALPHATEST_ON
				float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
				alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                #endif
				GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif

                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif

                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

                ZERO_BUILTIN_INITIALIZE(builtinData);
                builtinData.opacity = surfaceDescription.Alpha;

                #if defined(DEBUG_DISPLAY)
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif

                #endif

                #ifdef _ALPHATEST_ON

                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif


                builtinData.emissiveColor = surfaceDescription.Emission;

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif


                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif

                #ifndef SHADER_UNLIT

                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif

            }

			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil]
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}
            ENDHLSL
        }
		
	}
	
	CustomEditor "TVEShaderCoreGUI"
	
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;379;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPrepass;0;7;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;1;False;;1;False;;7;False;;3;False;;1;False;;1;False;;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;372;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;373;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;374;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;375;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefDepth;255;False;;255;True;_StencilWriteMaskDepth;7;False;;3;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;385;-1376,-274;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;10;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;378;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentBackface;0;6;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;_SrcBlend;0;True;_DstBlend;1;0;True;_AlphaSrcBlend;0;True;_AlphaDstBlend;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;False;False;True;0;True;_ZWrite;True;0;True;_ZTestTransparent;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;380;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPostpass;0;8;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;381;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;9;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;_SrcBlend;0;True;_DstBlend;1;0;True;_AlphaSrcBlend;0;True;_AlphaDstBlend;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullModeForward;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;True;True;0;True;_StencilRef;255;False;;255;True;_StencilWriteMask;7;False;;3;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;0;True;_ZWrite;True;0;True;_ZTestDepthEqualForOpaque;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;285;-2176,384;Inherit;False;1280.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1281.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;371;-1088,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;16;BOXOPHOBIC/The Vegetation Engine/Default/Bark Standard Lit;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;0;GBuffer;33;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;_CullMode;False;True;True;True;True;True;0;True;_LightLayersMaskBuffer4;False;False;False;False;False;False;True;True;True;0;True;_StencilRefGBuffer;255;False;;255;True;_StencilWriteMaskGBuffer;7;False;;3;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;False;True;0;True;_ZTestGBuffer;False;True;1;LightMode=GBuffer;False;False;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;0;0;Standard;39;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;637921061174210627;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;4;0;  Energy Conserving Specular;1;0;  Transmission,InvertActionOnDeselection;0;0;Forward Only;0;0;Receive Decals;1;0;Receives SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;1;638036732122370465;Override Baked GI;0;0;Depth Offset;0;0;DOTS Instancing;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position;0;0;0;11;True;True;True;True;True;True;False;False;False;True;True;False;;True;0
Node;AmplifyShaderEditor.FunctionNode;383;-1088,512;Inherit;False;Compile All Shaders;-1;;71629;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;384;-1280,512;Inherit;False;Compile Core;-1;;71632;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;382;-2176,512;Inherit;False;Define Pipeline HD;-1;;71633;7af1bc24c286d754db63fb6a44aba77b;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;386;-1920,512;Inherit;False;Define Lighting Standard;236;;76275;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;388;-1664,512;Inherit;False;Define ShaderType Bark;238;;76400;ecaf18989da3f93409461e4ed9a37a9f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;350;-2176,-384;Inherit;False;Base Shader;0;;76401;856f7164d1c579d43a5cf4968a75ca43;93,7343,0,3880,1,4028,1,3900,1,3908,1,4172,1,4179,1,1298,1,6791,1,1300,1,6792,1,3586,0,4499,1,1708,0,6056,1,3509,1,3873,1,893,0,6230,0,5156,1,5345,0,6116,1,7566,1,1717,1,1715,1,1714,1,1718,1,5075,1,6592,1,6068,1,6076,1,6692,0,6729,1,1776,0,6378,1,6352,1,3475,1,6655,1,4210,1,1745,1,3479,0,1646,0,3501,1,2807,0,6206,0,7565,0,4999,0,6194,0,3887,0,7321,0,7332,0,3957,1,6647,0,6257,0,5357,0,2172,0,3883,0,3728,1,5350,0,2658,0,1742,0,3484,0,6848,1,6622,1,1737,1,1736,1,1735,1,6161,1,4837,1,1734,1,6320,1,6166,1,7429,0,7348,0,860,1,6721,1,2261,1,2260,1,2054,1,2032,1,5258,1,2062,0,2039,0,7548,1,7550,1,3243,0,5220,1,4217,1,6699,1,5339,0,4242,1,5090,1,7492,0;9;7333;FLOAT3;1,1,1;False;6196;FLOAT;1;False;6693;FLOAT;1;False;6201;FLOAT;1;False;6205;FLOAT;1;False;5143;FLOAT;1;False;6231;FLOAT;1;False;6198;FLOAT;1;False;5340;FLOAT3;0,0,0;False;23;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;389;-1088,15;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;MotionVectors;0;5;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_CullMode;False;False;False;False;False;False;False;False;False;True;True;0;True;_StencilRefMV;255;False;;255;True;_StencilWriteMaskMV;7;False;;3;False;;0;False;;0;False;;7;False;;3;False;;0;False;;0;False;;False;True;1;False;;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;371;0;350;0
WireConnection;371;1;350;528
WireConnection;371;5;350;3678
WireConnection;371;6;350;2489
WireConnection;371;7;350;530
WireConnection;371;8;350;531
WireConnection;371;9;350;532
WireConnection;371;11;350;534
ASEEND*/
//CHKSM=494675D22AFB108A914DF643E7A2E4B31BAA23DB
