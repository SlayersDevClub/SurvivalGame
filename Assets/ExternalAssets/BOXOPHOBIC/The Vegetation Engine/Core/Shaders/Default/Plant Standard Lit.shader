// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Default/Plant Standard Lit"
{
	Properties
	{
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
		_FadeGlancingValue("Fade Glancing", Range( 0 , 1)) = 0
		[StyledCategory(Global Settings)]_CategoryGlobals("[ Category Globals ]", Float) = 1
		[StyledMessage(Info, Procedural Variation in use. The Variation might not work as expected when switching from one LOD to another., 0, 10)]_MessageGlobalsVariation("# Message Globals Variation", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerColorsValue("Layer Colors", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalColors("Global Color", Range( 0 , 1)) = 1
		_GlobalAlpha("Global Alpha", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		_ColorsVariationValue("Color Variation", Range( 0 , 1)) = 0.5
		_AlphaVariationValue("Alpha Variation", Range( 0 , 1)) = 0.5
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0.5
		_OverlayProjectionValue("Overlay Projection", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceGlobalOptions("# Space Global Options", Float) = 0
		[StyledToggle]_ColorsPositionMode("Use Pivot Position for Colors", Float) = 0
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
		[HideInInspector]_MainMaskMinValue("Main Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainMaskMaxValue("Main Mask Max", Range( 0 , 1)) = 0
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
		[HideInInspector]_SecondMaskMinValue("Detail Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_SecondMaskMaxValue("Detail Mask Max", Range( 0 , 1)) = 0
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1, 0, 0)]_VertexOcclusionRemap("Occlusion Remap", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Occlusion Min", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Occlusion Max", Range( 0 , 1)) = 1
		[Space(10)][StyledToggle]_ColorsMaskMode("Use Inverted Mask for Colors", Float) = 0
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 1
		[HDR]_GradientColorOne("Gradient Color One", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient Color Two", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Mask Max ", Range( 0 , 1)) = 1
		[StyledCategory(Noise Settings)]_CategoryNoise("[ Category Noise ]", Float) = 1
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 1
		[StyledMessage(Info, In HDRP__ the Subsurface Color and Power are fake effects used for artistic control. For physically correct subsurface scattering the Power slider need to be set to 0., 0, 10)]_MessageSubsurface("# Message Subsurface", Float) = 0
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# SpaceSubsurface", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (1,1,1,1)
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
		[StyledRemapSlider(_EmissiveTexMinValue, _EmissiveTexMaxValue,0,1)]_EmissiveTexRemap("Emissive Remap", Vector) = (0,0,0,0)
		[HideInInspector]_EmissiveTexMinValue("Emissive Tex Min", Range( 0 , 1)) = 0
		[HideInInspector]_EmissiveTexMaxValue("Emissive Tex Max", Range( 0 , 1)) = 1
		[HideInInspector]_emissive_intensity_value("_emissive_intensity_value", Float) = 1
		[StyledCategory(Perspective Settings)]_CategoryPerspective("[ Category Perspective ]", Float) = 1
		_PerspectivePushValue("Perspective Push", Range( 0 , 4)) = 0
		_PerspectiveNoiseValue("Perspective Noise", Range( 0 , 4)) = 0
		_PerspectiveAngleValue("Perspective Angle", Range( 0 , 8)) = 1
		[StyledCategory(Size Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 1
		_SizeFadeStartValue("Size Fade Start", Range( 0 , 1000)) = 0
		_SizeFadeEndValue("Size Fade End", Range( 0 , 1000)) = 0
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 1
		[StyledMessage(Info, Procedural variation in use. Use the Scale settings if the Variation is splitting the mesh., 0, 10)]_MessageMotionVariation("# Message Motion Variation", Float) = 0
		[HDR]_MotionHighlightColor("Motion Highlight Color", Color) = (0,0,0,0)
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
		[Space(10)]_MotionAmplitude_32("Motion Flutter", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_32("Motion Speed", Range( 0 , 40)) = 20
		_MotionScale_32("Motion Scale", Range( 0 , 20)) = 10
		_MotionVariation_32("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 0
		[StyledSpace(10)]_SpaceMotionLocals("# SpaceMotionLocals", Float) = 0
		[StyledToggle]_MotionValue_20("Use Branch Motion Settings", Float) = 1
		[StyledToggle]_MotionValue_30("Use Flutter Motion Settings", Float) = 1
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
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1
		[HideInInspector]_render_coverage("_render_coverage", Float) = 0
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsPlantShader("_IsPlantShader", Float) = 1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull [_render_cull]
		ZWrite [_render_zw]
		Blend [_render_src] [_render_dst]
		
		AlphaToMask [_render_coverage]
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 4.5
		#pragma shader_feature_local_fragment TVE_FEATURE_CLIP
		#pragma shader_feature_local_fragment TVE_FEATURE_DETAIL
		//SHADER INJECTION POINT BEGIN
		//SHADER INJECTION POINT END
		#define THE_VEGETATION_ENGINE
		#define TVE_IS_STANDARD_PIPELINE
		#define TVE_IS_STANDARD_SHADER
		#define TVE_IS_PLANT_SHADER
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
		#define SAMPLE_TEXTURE3D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
		#define SAMPLE_TEXTURE3D(tex,samplerTex,coord) tex3D(tex,coord)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
		#endif//ASE Sampling Macros

		#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows dithercrossfade vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float3 worldPos;
			float4 uv_texcoord;
			float2 vertexToFrag11_g77036;
			float4 vertexColor : COLOR;
			float3 worldNormal;
			INTERNAL_DATA
			float3 vertexToFrag3890_g77006;
			float3 vertexToFrag4224_g77006;
			half ASEIsFrontFacing : VFACE;
			float vertexToFrag11_g77053;
		};

		uniform half _render_cull;
		uniform half _render_coverage;
		uniform half _render_zw;
		uniform half _render_src;
		uniform half _render_dst;
		uniform half _IsStandardShader;
		uniform float _IsPlantShader;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		SamplerState sampler_MainTex;
		uniform float4 _SubsurfaceDiffusion_Asset;
		uniform float _SubsurfaceDiffusion;
		uniform half4 _MainMaskRemap;
		uniform half4 _SecondMaskRemap;
		uniform float4 _MaxBoundsInfo;
		uniform half _RenderDecals;
		uniform half _RenderSSR;
		uniform half _RenderZWrite;
		uniform half _RenderClip;
		uniform half _RenderCull;
		uniform half _RenderQueue;
		uniform half _RenderPriority;
		uniform half _RenderMode;
		uniform half _CategoryRender;
		uniform half _RenderNormals;
		uniform half _MessageOcclusion;
		uniform half _MessageMotionVariation;
		uniform half _MessageGlobalsVariation;
		uniform half _MessageSubsurface;
		uniform half _IsTVEShader;
		uniform half _HasOcclusion;
		uniform half _HasGradient;
		uniform half _HasEmissive;
		uniform half _IsCustomShader;
		uniform half _IsIdentifier;
		uniform half _IsCollected;
		uniform half _IsShared;
		uniform half _VertexVariationMode;
		uniform half _IsVersion;
		uniform half _RenderCoverage;
		uniform half _SecondUVsMode;
		uniform half _SpaceGlobalLayers;
		uniform half _SpaceGlobalLocals;
		uniform half _SpaceSubsurface;
		uniform half _SpaceMotionLocals;
		uniform half _SpaceMotionGlobals;
		uniform half _SpaceGlobalOptions;
		uniform half _CategoryGlobals;
		uniform half _CategoryMain;
		uniform half _CategoryDetail;
		uniform half _CategoryOcclusion;
		uniform half _CategoryGradient;
		uniform half _CategoryNoise;
		uniform half _CategoryPerspective;
		uniform half _CategorySizeFade;
		uniform half _CategoryMotion;
		uniform half _SpaceRenderFade;
		uniform half _SubsurfaceNormalValue;
		uniform half _SubsurfaceShadowValue;
		uniform half _SubsurfaceAmbientValue;
		uniform half _SubsurfaceDirectValue;
		uniform half _SubsurfaceAngleValue;
		uniform half _SubsurfaceScatteringValue;
		uniform half4 _VertexOcclusionRemap;
		uniform half4 _RimLightRemap;
		uniform half _RenderDirect;
		uniform half _CategoryRimLight;
		uniform half _CategoryMatcap;
		uniform half _CategorySubsurface;
		uniform half _CategoryEmissive;
		uniform half _RenderAmbient;
		uniform half _RenderShadow;
		uniform half _IsCoreShader;
		uniform half _ColorsMaskMinValue;
		uniform half _ColorsMaskMaxValue;
		uniform half _DetailTypeMode;
		uniform half _DetailOpaqueMode;
		uniform half _DetailCoordMode;
		uniform half _DetailMaskInvertMode;
		uniform half _DetailMeshInvertMode;
		uniform half _MessageMainMask;
		uniform half _MessageSecondMask;
		uniform half4 _EmissiveTexRemap;
		uniform half4 _DetailMaskRemap;
		uniform half4 _DetailMeshRemap;
		uniform half4 _DetailBlendRemap;
		uniform half4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		SamplerState sampler_BumpMap;
		uniform half _Cutoff;
		uniform half4 _NoiseMaskRemap;
		uniform half4 _GradientMaskRemap;
		uniform half _EmissiveIntensityMode;
		uniform half _EmissiveFlagMode;
		uniform half _EmissiveIntensityValue;
		uniform half _VertexPivotMode;
		UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_NoiseTex);
		uniform float3 TVE_WorldOrigin;
		uniform half _MotionPosition_10;
		uniform float _MotionScale_10;
		uniform half4 TVE_MotionParams;
		uniform half4 TVE_TimeParams;
		uniform float _MotionSpeed_10;
		uniform half _MotionVariation_10;
		uniform half _VertexDynamicMode;
		SamplerState sampler_Linear_Repeat;
		uniform half _LayerMotionValue;
		uniform float TVE_MotionUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_MotionTex);
		uniform half4 TVE_MotionCoords;
		SamplerState sampler_Linear_Clamp;
		uniform half _MotionAmplitude_10;
		uniform half TVE_MotionValue_10;
		uniform half _InteractionMaskValue;
		uniform half _InteractionAmplitude;
		uniform half _MotionScale_20;
		uniform half _MotionVariation_20;
		uniform half _MotionSpeed_20;
		uniform half _MotionValue_20;
		uniform half _MotionFacingValue;
		uniform half _MotionAmplitude_20;
		uniform half TVE_MotionValue_20;
		uniform half _MotionAmplitude_22;
		uniform float _MotionScale_32;
		uniform float _MotionVariation_32;
		uniform float _MotionSpeed_32;
		uniform half _MotionValue_30;
		uniform half _MotionAmplitude_32;
		uniform half TVE_MotionFadeEnd;
		uniform half TVE_MotionFadeStart;
		uniform half TVE_MotionValue_30;
		uniform half _PerspectivePushValue;
		uniform half _PerspectiveNoiseValue;
		uniform half _PerspectiveAngleValue;
		uniform half _LayerVertexValue;
		uniform float TVE_VertexUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_VertexTex);
		uniform half4 TVE_VertexCoords;
		uniform half4 TVE_VertexParams;
		uniform half _GlobalSize;
		uniform half TVE_DistanceFadeBias;
		uniform half _SizeFadeEndValue;
		uniform half _SizeFadeStartValue;
		uniform half TVE_IsEnabled;
		uniform half _DisableSRPBatcher;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
		uniform half4 _MainUVs;
		uniform half _MainNormalValue;
		uniform half _DetailNormalValue;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
		uniform half4 _second_uvs_mode;
		uniform half4 _SecondUVs;
		uniform half _SecondNormalValue;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
		uniform half _DetailMaskMode;
		uniform half _DetailMaskMinValue;
		uniform half _DetailMaskMaxValue;
		uniform half _DetailMeshMode;
		uniform half _DetailMeshMinValue;
		uniform half _DetailMeshMaxValue;
		uniform half _DetailBlendMinValue;
		uniform half _DetailBlendMaxValue;
		uniform half _DetailMode;
		uniform half _DetailValue;
		uniform half TVE_OverlayNormalValue;
		uniform half _GlobalOverlay;
		uniform half _LayerExtrasValue;
		uniform float TVE_ExtrasUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
		uniform half4 TVE_ExtrasCoords;
		uniform half _ExtrasPositionMode;
		uniform half4 TVE_ExtrasParams;
		uniform half _OverlayVariationValue;
		uniform half _OverlayProjectionValue;
		uniform half4 _MainColor;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
		SamplerState sampler_MainAlbedoTex;
		uniform half _MainAlbedoValue;
		uniform half4 _SecondColor;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
		SamplerState sampler_SecondAlbedoTex;
		uniform half _SecondAlbedoValue;
		uniform half _DetailBlendMode;
		uniform half4 _GradientColorTwo;
		uniform half4 _GradientColorOne;
		uniform half _GradientMinValue;
		uniform half _GradientMaxValue;
		uniform half _MainMaskMinValue;
		uniform half _MainMaskMaxValue;
		uniform half _SecondMaskMinValue;
		uniform half _SecondMaskMaxValue;
		uniform half4 _VertexOcclusionColor;
		uniform half _VertexOcclusionMinValue;
		uniform half _VertexOcclusionMaxValue;
		uniform half TVE_WetnessNormalValue;
		uniform half _GlobalWetness;
		uniform half3 _render_normals;
		uniform half _LayerColorsValue;
		uniform float TVE_ColorsUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ColorsTex);
		uniform half4 TVE_ColorsCoords;
		uniform half _ColorsPositionMode;
		uniform half4 TVE_ColorsParams;
		uniform half _GlobalColors;
		uniform half _ColorsVariationValue;
		uniform half _ColorsMaskMode;
		uniform half4 TVE_OverlayColor;
		uniform half TVE_WetnessContrast;
		uniform half4 _MotionHighlightColor;
		uniform half4 _SubsurfaceColor;
		uniform half _SubsurfaceValue;
		uniform half TVE_SubsurfaceValue;
		uniform half TVE_OverlaySubsurface;
		uniform half3 TVE_MainLightDirection;
		uniform half4 _EmissiveColor;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
		uniform half4 _EmissiveUVs;
		uniform half _EmissiveTexMinValue;
		uniform half _EmissiveTexMaxValue;
		uniform half _GlobalEmissive;
		uniform half _EmissivePhaseValue;
		uniform float _emissive_intensity_value;
		uniform half _RenderSpecular;
		uniform half _MainSmoothnessValue;
		uniform half _SecondSmoothnessValue;
		uniform half TVE_OverlaySmoothness;
		uniform half _MainOcclusionValue;
		uniform half _SecondOcclusionValue;
		uniform half _DetailAlphaMode;
		uniform half _AlphaClipValue;
		uniform half _AlphaVariationValue;
		uniform half _DetailFadeMode;
		uniform half _GlobalAlpha;
		uniform half _FadeGlancingValue;
		uniform half TVE_CameraFadeMin;
		uniform half TVE_CameraFadeMax;
		uniform half _FadeCameraValue;
		uniform half _FadeConstantValue;
		UNITY_DECLARE_TEX3D_NOSAMPLER(TVE_NoiseTex3D);
		uniform half TVE_NoiseTex3DTilling;


		float2 DecodeFloatToVector2( float enc )
		{
			float2 result ;
			result.y = enc % 2048;
			result.x = floor(enc / 2048);
			return result / (2048 - 1);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VertexPosition3588_g77006 = ase_vertex3Pos;
			float3 appendResult60_g77016 = (float3(v.texcoord3.x , v.texcoord3.z , v.texcoord3.y));
			half3 Mesh_PivotsData2831_g77006 = ( appendResult60_g77016 * _VertexPivotMode );
			half3 Mesh_PivotsOS2291_g77006 = Mesh_PivotsData2831_g77006;
			float3 temp_output_2283_0_g77006 = ( VertexPosition3588_g77006 - Mesh_PivotsOS2291_g77006 );
			half3 VertexPos40_g77119 = temp_output_2283_0_g77006;
			half3 VertexPos40_g77120 = VertexPos40_g77119;
			float3 appendResult74_g77120 = (float3(VertexPos40_g77120.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g77120 = appendResult74_g77120;
			float3 break84_g77120 = VertexPos40_g77120;
			float3 appendResult81_g77120 = (float3(0.0 , break84_g77120.y , break84_g77120.z));
			half3 VertexPosOtherAxis82_g77120 = appendResult81_g77120;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 vertexToFrag3890_g77006 = ase_worldPos;
			float3 WorldPosition3905_g77006 = vertexToFrag3890_g77006;
			float3 WorldPosition_Shifted7477_g77006 = ( WorldPosition3905_g77006 - TVE_WorldOrigin );
			float4x4 break19_g77082 = unity_ObjectToWorld;
			float3 appendResult20_g77082 = (float3(break19_g77082[ 0 ][ 3 ] , break19_g77082[ 1 ][ 3 ] , break19_g77082[ 2 ][ 3 ]));
			float3 temp_output_122_0_g77082 = Mesh_PivotsData2831_g77006;
			float3 PivotsOnly105_g77082 = (mul( unity_ObjectToWorld, float4( temp_output_122_0_g77082 , 0.0 ) ).xyz).xyz;
			half3 ObjectData20_g77084 = ( appendResult20_g77082 + PivotsOnly105_g77082 );
			half3 WorldData19_g77084 = ase_worldPos;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77084 = WorldData19_g77084;
			#else
				float3 staticSwitch14_g77084 = ObjectData20_g77084;
			#endif
			float3 temp_output_114_0_g77082 = staticSwitch14_g77084;
			float3 vertexToFrag4224_g77006 = temp_output_114_0_g77082;
			float3 ObjectPosition4223_g77006 = vertexToFrag4224_g77006;
			float3 ObjectPosition_Shifted7481_g77006 = ( ObjectPosition4223_g77006 - TVE_WorldOrigin );
			float3 lerpResult6766_g77006 = lerp( WorldPosition_Shifted7477_g77006 , ObjectPosition_Shifted7481_g77006 , _MotionPosition_10);
			float3 Motion_10_Position6738_g77006 = lerpResult6766_g77006;
			half3 Input_Position419_g77102 = Motion_10_Position6738_g77006;
			float Input_MotionScale287_g77102 = ( _MotionScale_10 + 0.2 );
			float2 temp_output_597_0_g77102 = (( Input_Position419_g77102 * Input_MotionScale287_g77102 * 0.0075 )).xz;
			float2 temp_output_447_0_g77011 = ((TVE_MotionParams).xy*2.0 + -1.0);
			half2 Global_Wind_DirectionWS4683_g77006 = temp_output_447_0_g77011;
			half2 Input_DirectionWS423_g77102 = Global_Wind_DirectionWS4683_g77006;
			float lerpResult115_g77103 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g77102 = _MotionSpeed_10;
			half Input_MotionVariation284_g77102 = _MotionVariation_10;
			half3 Input_Position167_g77077 = ObjectPosition_Shifted7481_g77006;
			float dotResult156_g77077 = dot( (Input_Position167_g77077).xz , float2( 12.9898,78.233 ) );
			half Vertex_DynamicMode5112_g77006 = _VertexDynamicMode;
			half Input_DynamicMode120_g77077 = Vertex_DynamicMode5112_g77006;
			float Postion_Random162_g77077 = ( sin( dotResult156_g77077 ) * ( 1.0 - Input_DynamicMode120_g77077 ) );
			float Mesh_Variation16_g77006 = v.color.r;
			half Input_Variation124_g77077 = Mesh_Variation16_g77006;
			half ObjectData20_g77079 = frac( ( Postion_Random162_g77077 + Input_Variation124_g77077 ) );
			half WorldData19_g77079 = Input_Variation124_g77077;
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77079 = WorldData19_g77079;
			#else
				float staticSwitch14_g77079 = ObjectData20_g77079;
			#endif
			float temp_output_112_0_g77077 = staticSwitch14_g77079;
			float clampResult171_g77077 = clamp( temp_output_112_0_g77077 , 0.01 , 0.99 );
			float Global_MeshVariation5104_g77006 = clampResult171_g77077;
			half Input_GlobalMeshVariation569_g77102 = Global_MeshVariation5104_g77006;
			float temp_output_630_0_g77102 = ( ( ( lerpResult115_g77103 * Input_MotionSpeed62_g77102 ) + ( Input_MotionVariation284_g77102 * Input_GlobalMeshVariation569_g77102 ) ) * 0.03 );
			float temp_output_607_0_g77102 = frac( temp_output_630_0_g77102 );
			float4 lerpResult590_g77102 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77102 + ( -Input_DirectionWS423_g77102 * temp_output_607_0_g77102 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g77102 + ( -Input_DirectionWS423_g77102 * frac( ( temp_output_630_0_g77102 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g77102 - 0.5 ) ) / 0.5 ));
			half4 Noise_Complex703_g77102 = lerpResult590_g77102;
			float2 temp_output_645_0_g77102 = ((Noise_Complex703_g77102).rg*2.0 + -1.0);
			float2 break650_g77102 = temp_output_645_0_g77102;
			float3 appendResult649_g77102 = (float3(break650_g77102.x , 0.0 , break650_g77102.y));
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half2 Global_Noise_OS5548_g77006 = (( mul( unity_WorldToObject, float4( appendResult649_g77102 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_Noise_DirectionOS487_g77125 = Global_Noise_OS5548_g77006;
			float2 break448_g77011 = temp_output_447_0_g77011;
			float3 appendResult452_g77011 = (float3(break448_g77011.x , 0.0 , break448_g77011.y));
			half2 Global_Wind_DirectionOS5692_g77006 = (( mul( unity_WorldToObject, float4( appendResult452_g77011 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_Wind_DirectionOS458_g77125 = Global_Wind_DirectionOS5692_g77006;
			float temp_output_84_0_g77019 = _LayerMotionValue;
			float temp_output_19_0_g77023 = TVE_MotionUsage[(int)temp_output_84_0_g77019];
			float4 temp_output_91_19_g77019 = TVE_MotionCoords;
			half2 UV94_g77019 = ( (temp_output_91_19_g77019).zw + ( (temp_output_91_19_g77019).xy * (ObjectPosition4223_g77006).xz ) );
			float4 tex2DArrayNode50_g77019 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g77019,temp_output_84_0_g77019), 0.0 );
			float4 temp_output_17_0_g77023 = tex2DArrayNode50_g77019;
			float4 temp_output_112_19_g77019 = TVE_MotionParams;
			float4 temp_output_3_0_g77023 = temp_output_112_19_g77019;
			float4 ifLocalVar18_g77023 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g77023 >= 0.5 )
				ifLocalVar18_g77023 = temp_output_17_0_g77023;
			else
				ifLocalVar18_g77023 = temp_output_3_0_g77023;
			float4 lerpResult22_g77023 = lerp( temp_output_3_0_g77023 , temp_output_17_0_g77023 , temp_output_19_0_g77023);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77023 = lerpResult22_g77023;
			#else
				float4 staticSwitch24_g77023 = ifLocalVar18_g77023;
			#endif
			half4 Global_Motion_Params3909_g77006 = staticSwitch24_g77023;
			float4 break322_g77011 = Global_Motion_Params3909_g77006;
			half Global_Wind_Power2223_g77006 = break322_g77011.z;
			half Input_WindPower449_g77125 = Global_Wind_Power2223_g77006;
			float temp_output_565_0_g77125 = ( 1.0 - Input_WindPower449_g77125 );
			float2 lerpResult516_g77125 = lerp( Input_Noise_DirectionOS487_g77125 , Input_Wind_DirectionOS458_g77125 , ( ( 1.0 - ( temp_output_565_0_g77125 * temp_output_565_0_g77125 * temp_output_565_0_g77125 ) ) * 0.6 ));
			half Mesh_Motion_107572_g77006 = v.color.a;
			half Input_MeshHeight388_g77125 = Mesh_Motion_107572_g77006;
			half ObjectData20_g77126 = Input_MeshHeight388_g77125;
			float enc62_g77130 = v.texcoord.w;
			float2 localDecodeFloatToVector262_g77130 = DecodeFloatToVector2( enc62_g77130 );
			float2 break63_g77130 = ( localDecodeFloatToVector262_g77130 * 100.0 );
			float Bounds_Height5230_g77006 = break63_g77130.x;
			half Input_BoundsHeight390_g77125 = Bounds_Height5230_g77006;
			half WorldData19_g77126 = ( Input_MeshHeight388_g77125 * Input_MeshHeight388_g77125 * Input_BoundsHeight390_g77125 );
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77126 = WorldData19_g77126;
			#else
				float staticSwitch14_g77126 = ObjectData20_g77126;
			#endif
			half Final_Motion10_Mask321_g77125 = ( staticSwitch14_g77126 * 2.0 );
			half Input_BendingAmplitude376_g77125 = _MotionAmplitude_10;
			half Global_MotionValue640_g77125 = TVE_MotionValue_10;
			half2 Final_Bending631_g77125 = ( lerpResult516_g77125 * ( Final_Motion10_Mask321_g77125 * Input_BendingAmplitude376_g77125 * Input_WindPower449_g77125 * Input_WindPower449_g77125 * Global_MotionValue640_g77125 ) );
			float2 appendResult433_g77011 = (float2(break322_g77011.x , break322_g77011.y));
			float2 temp_output_436_0_g77011 = (appendResult433_g77011*2.0 + -1.0);
			float2 break441_g77011 = temp_output_436_0_g77011;
			float3 appendResult440_g77011 = (float3(break441_g77011.x , 0.0 , break441_g77011.y));
			half2 Global_React_DirectionOS39_g77006 = (( mul( unity_WorldToObject, float4( appendResult440_g77011 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_React_DirectionOS358_g77125 = Global_React_DirectionOS39_g77006;
			float clampResult17_g77128 = clamp( Input_MeshHeight388_g77125 , 0.0001 , 0.9999 );
			float temp_output_7_0_g77127 = 0.0;
			half Input_InteractionUseMask62_g77125 = _InteractionMaskValue;
			float temp_output_10_0_g77127 = ( Input_InteractionUseMask62_g77125 - temp_output_7_0_g77127 );
			half Final_InteractionRemap594_g77125 = saturate( ( ( clampResult17_g77128 - temp_output_7_0_g77127 ) / ( temp_output_10_0_g77127 + 0.0001 ) ) );
			half ObjectData20_g77129 = Final_InteractionRemap594_g77125;
			half WorldData19_g77129 = ( Final_InteractionRemap594_g77125 * Final_InteractionRemap594_g77125 * Input_BoundsHeight390_g77125 );
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77129 = WorldData19_g77129;
			#else
				float staticSwitch14_g77129 = ObjectData20_g77129;
			#endif
			half Final_InteractionMask373_g77125 = ( staticSwitch14_g77129 * 2.0 );
			half Input_InteractionAmplitude58_g77125 = _InteractionAmplitude;
			half2 Final_Interaction632_g77125 = ( Input_React_DirectionOS358_g77125 * Final_InteractionMask373_g77125 * Input_InteractionAmplitude58_g77125 );
			half Global_Interaction_Mask66_g77006 = ( break322_g77011.w * break322_g77011.w * break322_g77011.w * break322_g77011.w );
			float Input_InteractionGlobalMask330_g77125 = Global_Interaction_Mask66_g77006;
			half Final_InteractionValue525_g77125 = saturate( ( Input_InteractionAmplitude58_g77125 * Input_InteractionGlobalMask330_g77125 ) );
			float2 lerpResult551_g77125 = lerp( Final_Bending631_g77125 , Final_Interaction632_g77125 , Final_InteractionValue525_g77125);
			float2 break364_g77125 = lerpResult551_g77125;
			float3 appendResult638_g77125 = (float3(break364_g77125.x , 0.0 , break364_g77125.y));
			half3 Motion_10_Interaction7519_g77006 = appendResult638_g77125;
			half3 Angle44_g77119 = Motion_10_Interaction7519_g77006;
			half Angle44_g77120 = (Angle44_g77119).z;
			half3 VertexPos40_g77121 = ( VertexPosRotationAxis50_g77120 + ( VertexPosOtherAxis82_g77120 * cos( Angle44_g77120 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g77120 ) * sin( Angle44_g77120 ) ) );
			float3 appendResult74_g77121 = (float3(0.0 , 0.0 , VertexPos40_g77121.z));
			half3 VertexPosRotationAxis50_g77121 = appendResult74_g77121;
			float3 break84_g77121 = VertexPos40_g77121;
			float3 appendResult81_g77121 = (float3(break84_g77121.x , break84_g77121.y , 0.0));
			half3 VertexPosOtherAxis82_g77121 = appendResult81_g77121;
			half Angle44_g77121 = -(Angle44_g77119).x;
			half3 Input_Position419_g77111 = WorldPosition_Shifted7477_g77006;
			float3 break459_g77111 = Input_Position419_g77111;
			float Sum_Position446_g77111 = ( break459_g77111.x + break459_g77111.y + break459_g77111.z );
			half Input_MotionScale321_g77111 = ( _MotionScale_20 * 0.1 );
			half Input_MotionVariation330_g77111 = _MotionVariation_20;
			half Input_GlobalVariation400_g77111 = Global_MeshVariation5104_g77006;
			float lerpResult115_g77112 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g77111 = _MotionSpeed_20;
			float temp_output_404_0_g77111 = ( lerpResult115_g77112 * Input_MotionSpeed62_g77111 );
			half Motion_SineA450_g77111 = sin( ( ( Sum_Position446_g77111 * Input_MotionScale321_g77111 ) + ( Input_MotionVariation330_g77111 * Input_GlobalVariation400_g77111 ) + temp_output_404_0_g77111 ) );
			half Motion_SineB395_g77111 = sin( ( ( temp_output_404_0_g77111 * 0.6842 ) + ( Sum_Position446_g77111 * Input_MotionScale321_g77111 ) ) );
			half3 Input_Position419_g77017 = VertexPosition3588_g77006;
			float3 normalizeResult518_g77017 = normalize( Input_Position419_g77017 );
			half2 Input_DirectionOS423_g77017 = Global_React_DirectionOS39_g77006;
			float2 break521_g77017 = -Input_DirectionOS423_g77017;
			float3 appendResult522_g77017 = (float3(break521_g77017.x , 0.0 , break521_g77017.y));
			float dotResult519_g77017 = dot( normalizeResult518_g77017 , appendResult522_g77017 );
			half Input_Value62_g77017 = _MotionFacingValue;
			float lerpResult524_g77017 = lerp( 1.0 , (dotResult519_g77017*0.5 + 0.5) , Input_Value62_g77017);
			half ObjectData20_g77018 = max( lerpResult524_g77017 , 0.001 );
			half WorldData19_g77018 = 1.0;
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77018 = WorldData19_g77018;
			#else
				float staticSwitch14_g77018 = ObjectData20_g77018;
			#endif
			half Motion_FacingMask5214_g77006 = staticSwitch14_g77018;
			half Motion_20_Amplitude4381_g77006 = ( _MotionValue_20 * Motion_FacingMask5214_g77006 );
			half Input_MotionAmplitude384_g77111 = Motion_20_Amplitude4381_g77006;
			half Input_GlobalWind407_g77111 = Global_Wind_Power2223_g77006;
			float4 break638_g77102 = abs( Noise_Complex703_g77102 );
			half Global_Noise_B5526_g77006 = break638_g77102.b;
			half Input_GlobalNoise411_g77111 = Global_Noise_B5526_g77006;
			float lerpResult413_g77111 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g77111);
			half Motion_Amplitude418_g77111 = ( Input_MotionAmplitude384_g77111 * Input_GlobalWind407_g77111 * pow( Input_GlobalNoise411_g77111 , lerpResult413_g77111 ) );
			half Input_Squash58_g77111 = _MotionAmplitude_20;
			float enc59_g77130 = v.texcoord.z;
			float2 localDecodeFloatToVector259_g77130 = DecodeFloatToVector2( enc59_g77130 );
			float2 break61_g77130 = localDecodeFloatToVector259_g77130;
			half Mesh_Motion_2060_g77006 = break61_g77130.x;
			half Input_MeshMotion_20388_g77111 = Mesh_Motion_2060_g77006;
			float Bounds_Radius5231_g77006 = break63_g77130.y;
			half Input_BoundsRadius390_g77111 = Bounds_Radius5231_g77006;
			half Global_MotionValue462_g77111 = TVE_MotionValue_20;
			half2 Input_DirectionOS366_g77111 = Global_React_DirectionOS39_g77006;
			float2 break371_g77111 = Input_DirectionOS366_g77111;
			float3 appendResult372_g77111 = (float3(break371_g77111.x , ( Motion_SineA450_g77111 * 0.3 ) , break371_g77111.y));
			half3 Motion_20_Squash4418_g77006 = ( ( (max( Motion_SineA450_g77111 , Motion_SineB395_g77111 )*0.5 + 0.5) * Motion_Amplitude418_g77111 * Input_Squash58_g77111 * Input_MeshMotion_20388_g77111 * Input_BoundsRadius390_g77111 * Global_MotionValue462_g77111 ) * appendResult372_g77111 );
			half3 VertexPos40_g77110 = ( ( VertexPosRotationAxis50_g77121 + ( VertexPosOtherAxis82_g77121 * cos( Angle44_g77121 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g77121 ) * sin( Angle44_g77121 ) ) ) + Motion_20_Squash4418_g77006 );
			float3 appendResult74_g77110 = (float3(0.0 , VertexPos40_g77110.y , 0.0));
			float3 VertexPosRotationAxis50_g77110 = appendResult74_g77110;
			float3 break84_g77110 = VertexPos40_g77110;
			float3 appendResult81_g77110 = (float3(break84_g77110.x , 0.0 , break84_g77110.z));
			float3 VertexPosOtherAxis82_g77110 = appendResult81_g77110;
			half Input_Rolling379_g77111 = _MotionAmplitude_22;
			half Motion_20_Rolling5257_g77006 = ( Motion_SineA450_g77111 * Motion_Amplitude418_g77111 * Input_Rolling379_g77111 * Input_MeshMotion_20388_g77111 * Global_MotionValue462_g77111 );
			half Angle44_g77110 = Motion_20_Rolling5257_g77006;
			half3 Input_Position500_g77106 = WorldPosition_Shifted7477_g77006;
			half Input_MotionScale321_g77106 = _MotionScale_32;
			half Input_MotionVariation330_g77106 = _MotionVariation_32;
			half Input_GlobalVariation372_g77106 = Global_MeshVariation5104_g77006;
			float lerpResult115_g77109 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g77106 = _MotionSpeed_32;
			float4 tex2DNode460_g77106 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g77106).xz * Input_MotionScale321_g77106 * 0.03 ) + ( Input_MotionVariation330_g77106 * Input_GlobalVariation372_g77106 ) + ( lerpResult115_g77109 * Input_MotionSpeed62_g77106 * 0.02 ) ), 0.0 );
			float3 appendResult462_g77106 = (float3(tex2DNode460_g77106.r , tex2DNode460_g77106.g , tex2DNode460_g77106.b));
			half3 Flutter_Texture489_g77106 = (appendResult462_g77106*2.0 + -1.0);
			float temp_output_7_0_g77069 = TVE_MotionFadeEnd;
			float temp_output_10_0_g77069 = ( TVE_MotionFadeStart - temp_output_7_0_g77069 );
			half Motion_FadeOut4005_g77006 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77069 ) / ( temp_output_10_0_g77069 + 0.0001 ) ) );
			half Motion_30_Amplitude4960_g77006 = ( _MotionValue_30 * _MotionAmplitude_32 * Motion_FacingMask5214_g77006 * Motion_FadeOut4005_g77006 );
			half Input_MotionAmplitude58_g77106 = Motion_30_Amplitude4960_g77006;
			half Mesh_Motion_30144_g77006 = break61_g77130.y;
			half Input_MeshMotion_30374_g77106 = Mesh_Motion_30144_g77006;
			half Input_GlobalWind471_g77106 = Global_Wind_Power2223_g77006;
			half Global_MotionValue503_g77106 = TVE_MotionValue_30;
			half Input_GlobalNoise472_g77106 = Global_Noise_B5526_g77006;
			float lerpResult466_g77106 = lerp( 2.0 , 0.6 , Input_GlobalWind471_g77106);
			half Flutter_Amplitude491_g77106 = ( Input_MotionAmplitude58_g77106 * Input_MeshMotion_30374_g77106 * Input_GlobalWind471_g77106 * Global_MotionValue503_g77106 * pow( Input_GlobalNoise472_g77106 , lerpResult466_g77106 ) );
			half3 Motion_30_Flutter263_g77006 = ( Flutter_Texture489_g77106 * Flutter_Amplitude491_g77106 );
			float3 Vertex_Motion_Object833_g77006 = ( ( VertexPosRotationAxis50_g77110 + ( VertexPosOtherAxis82_g77110 * cos( Angle44_g77110 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g77110 ) * sin( Angle44_g77110 ) ) ) + Motion_30_Flutter263_g77006 );
			half3 ObjectData20_g77096 = Vertex_Motion_Object833_g77006;
			float3 temp_output_3474_0_g77006 = ( VertexPosition3588_g77006 - Mesh_PivotsOS2291_g77006 );
			float3 Vertex_Motion_World1118_g77006 = ( ( ( temp_output_3474_0_g77006 + Motion_10_Interaction7519_g77006 ) + Motion_20_Squash4418_g77006 ) + Motion_30_Flutter263_g77006 );
			half3 WorldData19_g77096 = Vertex_Motion_World1118_g77006;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77096 = WorldData19_g77096;
			#else
				float3 staticSwitch14_g77096 = ObjectData20_g77096;
			#endif
			float3 temp_output_7495_0_g77006 = staticSwitch14_g77096;
			float3 Vertex_Motion7493_g77006 = temp_output_7495_0_g77006;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult2169_g77006 = normalize( ase_worldViewDir );
			float3 ViewDirection3963_g77006 = normalizeResult2169_g77006;
			float3 break2709_g77006 = cross( ViewDirection3963_g77006 , half3(0,1,0) );
			float3 appendResult2710_g77006 = (float3(-break2709_g77006.z , 0.0 , break2709_g77006.x));
			float3 appendResult2667_g77006 = (float3(Global_MeshVariation5104_g77006 , 0.5 , Global_MeshVariation5104_g77006));
			half Mesh_Height1524_g77006 = v.color.a;
			float dotResult2212_g77006 = dot( ViewDirection3963_g77006 , float3(0,1,0) );
			half Mask_HView2656_g77006 = dotResult2212_g77006;
			float saferPower2652_g77006 = abs( Mask_HView2656_g77006 );
			half3 Grass_Perspective2661_g77006 = ( ( ( mul( unity_WorldToObject, float4( appendResult2710_g77006 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g77006*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g77006 * pow( saferPower2652_g77006 , _PerspectiveAngleValue ) );
			float temp_output_84_0_g77044 = _LayerVertexValue;
			float temp_output_19_0_g77048 = TVE_VertexUsage[(int)temp_output_84_0_g77044];
			float4 temp_output_94_19_g77044 = TVE_VertexCoords;
			half2 UV97_g77044 = ( (temp_output_94_19_g77044).zw + ( (temp_output_94_19_g77044).xy * (ObjectPosition4223_g77006).xz ) );
			float4 tex2DArrayNode50_g77044 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g77044,temp_output_84_0_g77044), 0.0 );
			float4 temp_output_17_0_g77048 = tex2DArrayNode50_g77044;
			float4 temp_output_111_19_g77044 = TVE_VertexParams;
			float4 temp_output_3_0_g77048 = temp_output_111_19_g77044;
			float4 ifLocalVar18_g77048 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g77048 >= 0.5 )
				ifLocalVar18_g77048 = temp_output_17_0_g77048;
			else
				ifLocalVar18_g77048 = temp_output_3_0_g77048;
			float4 lerpResult22_g77048 = lerp( temp_output_3_0_g77048 , temp_output_17_0_g77048 , temp_output_19_0_g77048);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77048 = lerpResult22_g77048;
			#else
				float4 staticSwitch24_g77048 = ifLocalVar18_g77048;
			#endif
			half4 Global_Vertex_Params4173_g77006 = staticSwitch24_g77048;
			float4 break322_g77049 = Global_Vertex_Params4173_g77006;
			half Global_VertexSize174_g77006 = saturate( break322_g77049.w );
			float lerpResult346_g77006 = lerp( 1.0 , Global_VertexSize174_g77006 , _GlobalSize);
			float3 appendResult3480_g77006 = (float3(lerpResult346_g77006 , lerpResult346_g77006 , lerpResult346_g77006));
			half3 ObjectData20_g77093 = appendResult3480_g77006;
			half3 _Vector11 = half3(1,1,1);
			half3 WorldData19_g77093 = _Vector11;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77093 = WorldData19_g77093;
			#else
				float3 staticSwitch14_g77093 = ObjectData20_g77093;
			#endif
			half3 Vertex_Size1741_g77006 = staticSwitch14_g77093;
			float temp_output_7_0_g77094 = _SizeFadeEndValue;
			float temp_output_10_0_g77094 = ( _SizeFadeStartValue - temp_output_7_0_g77094 );
			float temp_output_7453_0_g77006 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g77006 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g77094 ) / ( temp_output_10_0_g77094 + 0.0001 ) ) );
			float3 appendResult3482_g77006 = (float3(temp_output_7453_0_g77006 , temp_output_7453_0_g77006 , temp_output_7453_0_g77006));
			half3 ObjectData20_g77092 = appendResult3482_g77006;
			half3 _Vector5 = half3(1,1,1);
			half3 WorldData19_g77092 = _Vector5;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g77092 = WorldData19_g77092;
			#else
				float3 staticSwitch14_g77092 = ObjectData20_g77092;
			#endif
			float3 Vertex_SizeFade1740_g77006 = staticSwitch14_g77092;
			float3 lerpResult16_g77097 = lerp( VertexPosition3588_g77006 , ( ( ( Vertex_Motion7493_g77006 + Grass_Perspective2661_g77006 ) * Vertex_Size1741_g77006 * Vertex_SizeFade1740_g77006 ) + Mesh_PivotsOS2291_g77006 ) , TVE_IsEnabled);
			float3 temp_output_4912_0_g77006 = lerpResult16_g77097;
			float3 Final_VertexPosition890_g77006 = ( temp_output_4912_0_g77006 + _DisableSRPBatcher );
			v.vertex.xyz = Final_VertexPosition890_g77006;
			v.vertex.w = 1;
			float4 break33_g77037 = _second_uvs_mode;
			float2 temp_output_30_0_g77037 = ( v.texcoord.xy * break33_g77037.x );
			float2 appendResult21_g77130 = (float2(v.texcoord1.z , v.texcoord1.w));
			float2 Mesh_DetailCoord3_g77006 = appendResult21_g77130;
			float2 temp_output_29_0_g77037 = ( Mesh_DetailCoord3_g77006 * break33_g77037.y );
			float2 temp_output_31_0_g77037 = ( (WorldPosition_Shifted7477_g77006).xz * break33_g77037.z );
			o.vertexToFrag11_g77036 = ( ( ( temp_output_30_0_g77037 + temp_output_29_0_g77037 + temp_output_31_0_g77037 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
			o.vertexToFrag3890_g77006 = ase_worldPos;
			o.vertexToFrag4224_g77006 = temp_output_114_0_g77082;
			half Global_Noise_A4860_g77006 = break638_g77102.a;
			half Tint_Highlight_Value3231_g77006 = ( Global_Noise_A4860_g77006 * Global_Wind_Power2223_g77006 * Motion_FadeOut4005_g77006 * Mesh_Height1524_g77006 );
			o.vertexToFrag11_g77053 = Tint_Highlight_Value3231_g77006;
		}

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			half2 Main_UVs15_g77006 = ( ( i.uv_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
			half4 Normal_Packed45_g77034 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g77006 );
			float2 appendResult58_g77034 = (float2(( (Normal_Packed45_g77034).x * (Normal_Packed45_g77034).w ) , (Normal_Packed45_g77034).y));
			half2 Normal_Default50_g77034 = appendResult58_g77034;
			half2 Normal_ASTC41_g77034 = (Normal_Packed45_g77034).xy;
			#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g77034 = Normal_ASTC41_g77034;
			#else
				float2 staticSwitch38_g77034 = Normal_Default50_g77034;
			#endif
			half2 Normal_NO_DTX544_g77034 = (Normal_Packed45_g77034).wy;
			#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g77034 = Normal_NO_DTX544_g77034;
			#else
				float2 staticSwitch37_g77034 = staticSwitch38_g77034;
			#endif
			float2 temp_output_6555_0_g77006 = ( (staticSwitch37_g77034*2.0 + -1.0) * _MainNormalValue );
			half2 Main_Normal137_g77006 = temp_output_6555_0_g77006;
			float2 lerpResult3372_g77006 = lerp( float2( 0,0 ) , Main_Normal137_g77006 , _DetailNormalValue);
			half2 Second_UVs17_g77006 = i.vertexToFrag11_g77036;
			half4 Normal_Packed45_g77035 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g77006 );
			float2 appendResult58_g77035 = (float2(( (Normal_Packed45_g77035).x * (Normal_Packed45_g77035).w ) , (Normal_Packed45_g77035).y));
			half2 Normal_Default50_g77035 = appendResult58_g77035;
			half2 Normal_ASTC41_g77035 = (Normal_Packed45_g77035).xy;
			#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g77035 = Normal_ASTC41_g77035;
			#else
				float2 staticSwitch38_g77035 = Normal_Default50_g77035;
			#endif
			half2 Normal_NO_DTX544_g77035 = (Normal_Packed45_g77035).wy;
			#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g77035 = Normal_NO_DTX544_g77035;
			#else
				float2 staticSwitch37_g77035 = staticSwitch38_g77035;
			#endif
			half2 Second_Normal179_g77006 = ( (staticSwitch37_g77035*2.0 + -1.0) * _SecondNormalValue );
			float2 temp_output_36_0_g77055 = ( lerpResult3372_g77006 + Second_Normal179_g77006 );
			float4 tex2DNode35_g77006 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g77006 );
			half Main_Mask57_g77006 = tex2DNode35_g77006.b;
			float4 tex2DNode33_g77006 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g77006 );
			half Second_Mask81_g77006 = tex2DNode33_g77006.b;
			float lerpResult6885_g77006 = lerp( Main_Mask57_g77006 , Second_Mask81_g77006 , _DetailMaskMode);
			float clampResult17_g77116 = clamp( lerpResult6885_g77006 , 0.0001 , 0.9999 );
			float temp_output_7_0_g77115 = _DetailMaskMinValue;
			float temp_output_10_0_g77115 = ( _DetailMaskMaxValue - temp_output_7_0_g77115 );
			half Blend_Mask_Texture6794_g77006 = saturate( ( ( clampResult17_g77116 - temp_output_7_0_g77115 ) / ( temp_output_10_0_g77115 + 0.0001 ) ) );
			half Mesh_DetailMask90_g77006 = i.vertexColor.b;
			float3 appendResult7388_g77006 = (float3(temp_output_6555_0_g77006 , 1.0));
			half3 Main_NormalWS7390_g77006 = (WorldNormalVector( i , appendResult7388_g77006 ));
			float lerpResult6884_g77006 = lerp( Mesh_DetailMask90_g77006 , ((Main_NormalWS7390_g77006).y*0.5 + 0.5) , _DetailMeshMode);
			float clampResult17_g77114 = clamp( lerpResult6884_g77006 , 0.0001 , 0.9999 );
			float temp_output_7_0_g77113 = _DetailMeshMinValue;
			float temp_output_10_0_g77113 = ( _DetailMeshMaxValue - temp_output_7_0_g77113 );
			half Blend_Mask_Mesh1540_g77006 = saturate( ( ( clampResult17_g77114 - temp_output_7_0_g77113 ) / ( temp_output_10_0_g77113 + 0.0001 ) ) );
			float clampResult17_g77133 = clamp( ( Blend_Mask_Texture6794_g77006 * Blend_Mask_Mesh1540_g77006 ) , 0.0001 , 0.9999 );
			float temp_output_7_0_g77134 = _DetailBlendMinValue;
			float temp_output_10_0_g77134 = ( _DetailBlendMaxValue - temp_output_7_0_g77134 );
			half Blend_Mask147_g77006 = ( saturate( ( ( clampResult17_g77133 - temp_output_7_0_g77134 ) / ( temp_output_10_0_g77134 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
			float2 lerpResult3376_g77006 = lerp( Main_Normal137_g77006 , temp_output_36_0_g77055 , Blend_Mask147_g77006);
			#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g77006 = lerpResult3376_g77006;
			#else
				float2 staticSwitch267_g77006 = Main_Normal137_g77006;
			#endif
			half2 Blend_Normal312_g77006 = staticSwitch267_g77006;
			half Global_OverlayNormalScale6581_g77006 = TVE_OverlayNormalValue;
			float temp_output_84_0_g77024 = _LayerExtrasValue;
			float temp_output_19_0_g77028 = TVE_ExtrasUsage[(int)temp_output_84_0_g77024];
			float4 temp_output_93_19_g77024 = TVE_ExtrasCoords;
			float3 WorldPosition3905_g77006 = i.vertexToFrag3890_g77006;
			float3 ObjectPosition4223_g77006 = i.vertexToFrag4224_g77006;
			float3 lerpResult4827_g77006 = lerp( WorldPosition3905_g77006 , ObjectPosition4223_g77006 , _ExtrasPositionMode);
			half2 UV96_g77024 = ( (temp_output_93_19_g77024).zw + ( (temp_output_93_19_g77024).xy * (lerpResult4827_g77006).xz ) );
			float4 tex2DArrayNode48_g77024 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g77024,temp_output_84_0_g77024), 0.0 );
			float4 temp_output_17_0_g77028 = tex2DArrayNode48_g77024;
			float4 temp_output_94_85_g77024 = TVE_ExtrasParams;
			float4 temp_output_3_0_g77028 = temp_output_94_85_g77024;
			float4 ifLocalVar18_g77028 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g77028 >= 0.5 )
				ifLocalVar18_g77028 = temp_output_17_0_g77028;
			else
				ifLocalVar18_g77028 = temp_output_3_0_g77028;
			float4 lerpResult22_g77028 = lerp( temp_output_3_0_g77028 , temp_output_17_0_g77028 , temp_output_19_0_g77028);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77028 = lerpResult22_g77028;
			#else
				float4 staticSwitch24_g77028 = ifLocalVar18_g77028;
			#endif
			half4 Global_Extras_Params5440_g77006 = staticSwitch24_g77028;
			float4 break456_g77042 = Global_Extras_Params5440_g77006;
			half Global_Extras_Overlay156_g77006 = break456_g77042.z;
			float3 ObjectPosition_Shifted7481_g77006 = ( ObjectPosition4223_g77006 - TVE_WorldOrigin );
			half3 Input_Position167_g77077 = ObjectPosition_Shifted7481_g77006;
			float dotResult156_g77077 = dot( (Input_Position167_g77077).xz , float2( 12.9898,78.233 ) );
			half Vertex_DynamicMode5112_g77006 = _VertexDynamicMode;
			half Input_DynamicMode120_g77077 = Vertex_DynamicMode5112_g77006;
			float Postion_Random162_g77077 = ( sin( dotResult156_g77077 ) * ( 1.0 - Input_DynamicMode120_g77077 ) );
			float Mesh_Variation16_g77006 = i.vertexColor.r;
			half Input_Variation124_g77077 = Mesh_Variation16_g77006;
			half ObjectData20_g77079 = frac( ( Postion_Random162_g77077 + Input_Variation124_g77077 ) );
			half WorldData19_g77079 = Input_Variation124_g77077;
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g77079 = WorldData19_g77079;
			#else
				float staticSwitch14_g77079 = ObjectData20_g77079;
			#endif
			float temp_output_112_0_g77077 = staticSwitch14_g77079;
			float clampResult171_g77077 = clamp( temp_output_112_0_g77077 , 0.01 , 0.99 );
			float Global_MeshVariation5104_g77006 = clampResult171_g77077;
			float lerpResult1065_g77006 = lerp( 1.0 , Global_MeshVariation5104_g77006 , _OverlayVariationValue);
			half Overlay_Variation4560_g77006 = lerpResult1065_g77006;
			half Overlay_Value5738_g77006 = ( _GlobalOverlay * Global_Extras_Overlay156_g77006 * Overlay_Variation4560_g77006 );
			float3 appendResult7377_g77006 = (float3(Blend_Normal312_g77006 , 1.0));
			half3 Blend_NormalWS7375_g77006 = (WorldNormalVector( i , appendResult7377_g77006 ));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			ase_vertexNormal = normalize( ase_vertexNormal );
			float lerpResult7446_g77006 = lerp( (Blend_NormalWS7375_g77006).y , ase_vertexNormal.y , Vertex_DynamicMode5112_g77006);
			float lerpResult6757_g77006 = lerp( 1.0 , saturate( lerpResult7446_g77006 ) , _OverlayProjectionValue);
			half Overlay_Projection6081_g77006 = lerpResult6757_g77006;
			float4 tex2DNode29_g77006 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g77006 );
			float3 lerpResult6223_g77006 = lerp( float3( 1,1,1 ) , (tex2DNode29_g77006).rgb , _MainAlbedoValue);
			half3 Main_Albedo99_g77006 = ( (_MainColor).rgb * lerpResult6223_g77006 );
			float4 tex2DNode89_g77006 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g77006 );
			float3 lerpResult6225_g77006 = lerp( float3( 1,1,1 ) , (tex2DNode89_g77006).rgb , _SecondAlbedoValue);
			half3 Second_Albedo153_g77006 = ( (_SecondColor).rgb * lerpResult6225_g77006 );
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77054 = 2.0;
			#else
				float staticSwitch1_g77054 = 4.594794;
			#endif
			float3 lerpResult4834_g77006 = lerp( ( Main_Albedo99_g77006 * Second_Albedo153_g77006 * staticSwitch1_g77054 ) , Second_Albedo153_g77006 , _DetailBlendMode);
			float3 lerpResult235_g77006 = lerp( Main_Albedo99_g77006 , lerpResult4834_g77006 , Blend_Mask147_g77006);
			#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g77006 = lerpResult235_g77006;
			#else
				float3 staticSwitch255_g77006 = Main_Albedo99_g77006;
			#endif
			half3 Blend_Albedo265_g77006 = staticSwitch255_g77006;
			half Mesh_Height1524_g77006 = i.vertexColor.a;
			float temp_output_7_0_g77072 = _GradientMinValue;
			float temp_output_10_0_g77072 = ( _GradientMaxValue - temp_output_7_0_g77072 );
			half Tint_Gradient_Value2784_g77006 = saturate( ( ( Mesh_Height1524_g77006 - temp_output_7_0_g77072 ) / ( temp_output_10_0_g77072 + 0.0001 ) ) );
			float3 lerpResult2779_g77006 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g77006);
			float clampResult17_g77067 = clamp( Main_Mask57_g77006 , 0.0001 , 0.9999 );
			float temp_output_7_0_g77070 = _MainMaskMinValue;
			float temp_output_10_0_g77070 = ( _MainMaskMaxValue - temp_output_7_0_g77070 );
			half Main_Mask_Remap5765_g77006 = saturate( ( ( clampResult17_g77067 - temp_output_7_0_g77070 ) / ( temp_output_10_0_g77070 + 0.0001 ) ) );
			float clampResult17_g77066 = clamp( Second_Mask81_g77006 , 0.0001 , 0.9999 );
			float temp_output_7_0_g77071 = _SecondMaskMinValue;
			float temp_output_10_0_g77071 = ( _SecondMaskMaxValue - temp_output_7_0_g77071 );
			half Second_Mask_Remap6130_g77006 = saturate( ( ( clampResult17_g77066 - temp_output_7_0_g77071 ) / ( temp_output_10_0_g77071 + 0.0001 ) ) );
			float lerpResult6617_g77006 = lerp( Main_Mask_Remap5765_g77006 , Second_Mask_Remap6130_g77006 , Blend_Mask147_g77006);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6623_g77006 = lerpResult6617_g77006;
			#else
				float staticSwitch6623_g77006 = Main_Mask_Remap5765_g77006;
			#endif
			half Blend_Mask_Remap6621_g77006 = staticSwitch6623_g77006;
			half Tint_Gradient_Mask6207_g77006 = Blend_Mask_Remap6621_g77006;
			float3 lerpResult6208_g77006 = lerp( float3( 1,1,1 ) , lerpResult2779_g77006 , Tint_Gradient_Mask6207_g77006);
			half3 Tint_Gradient_Color5769_g77006 = lerpResult6208_g77006;
			half3 Tint_Noise_Color5770_g77006 = float3(1,1,1);
			float3 temp_output_3_0_g77064 = ( Blend_Albedo265_g77006 * Tint_Gradient_Color5769_g77006 * Tint_Noise_Color5770_g77006 );
			float dotResult20_g77064 = dot( temp_output_3_0_g77064 , float3(0.2126,0.7152,0.0722) );
			float clampResult6740_g77006 = clamp( saturate( ( dotResult20_g77064 * 5.0 ) ) , 0.2 , 1.0 );
			half Blend_Albedo_Globals6410_g77006 = clampResult6740_g77006;
			half Overlay_Shading6688_g77006 = Blend_Albedo_Globals6410_g77006;
			half Overlay_Custom6707_g77006 = 1.0;
			half Occlusion_Alpha6463_g77006 = _VertexOcclusionColor.a;
			float Mesh_Occlusion318_g77006 = i.vertexColor.g;
			float clampResult17_g77065 = clamp( Mesh_Occlusion318_g77006 , 0.0001 , 0.9999 );
			float temp_output_7_0_g77075 = _VertexOcclusionMinValue;
			float temp_output_10_0_g77075 = ( _VertexOcclusionMaxValue - temp_output_7_0_g77075 );
			half Occlusion_Mask6432_g77006 = saturate( ( ( clampResult17_g77065 - temp_output_7_0_g77075 ) / ( temp_output_10_0_g77075 + 0.0001 ) ) );
			float lerpResult6467_g77006 = lerp( Occlusion_Alpha6463_g77006 , 1.0 , Occlusion_Mask6432_g77006);
			half Occlusion_Overlay6471_g77006 = lerpResult6467_g77006;
			float temp_output_7_0_g77073 = 0.1;
			float temp_output_10_0_g77073 = ( 0.2 - temp_output_7_0_g77073 );
			half Overlay_Mask_High6064_g77006 = saturate( ( ( ( Overlay_Value5738_g77006 * Overlay_Projection6081_g77006 * Overlay_Shading6688_g77006 * Overlay_Custom6707_g77006 * Occlusion_Overlay6471_g77006 ) - temp_output_7_0_g77073 ) / ( temp_output_10_0_g77073 + 0.0001 ) ) );
			half Overlay_Mask269_g77006 = Overlay_Mask_High6064_g77006;
			float lerpResult6585_g77006 = lerp( 1.0 , Global_OverlayNormalScale6581_g77006 , Overlay_Mask269_g77006);
			half2 Blend_Normal_Overlay366_g77006 = ( Blend_Normal312_g77006 * lerpResult6585_g77006 );
			half Global_WetnessNormalScale6571_g77006 = TVE_WetnessNormalValue;
			half Global_Extras_Wetness305_g77006 = break456_g77042.y;
			half Wetness_Value6343_g77006 = ( Global_Extras_Wetness305_g77006 * _GlobalWetness );
			float lerpResult6579_g77006 = lerp( 1.0 , Global_WetnessNormalScale6571_g77006 , ( Wetness_Value6343_g77006 * Wetness_Value6343_g77006 ));
			half2 Blend_Normal_Wetness6372_g77006 = ( Blend_Normal_Overlay366_g77006 * lerpResult6579_g77006 );
			float3 appendResult6568_g77006 = (float3(Blend_Normal_Wetness6372_g77006 , 1.0));
			float3 temp_output_13_0_g77043 = appendResult6568_g77006;
			float3 temp_output_33_0_g77043 = ( temp_output_13_0_g77043 * _render_normals );
			float3 switchResult12_g77043 = (((i.ASEIsFrontFacing>0)?(temp_output_13_0_g77043):(temp_output_33_0_g77043)));
			o.Normal = switchResult12_g77043;
			float3 lerpResult2945_g77006 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g77006);
			half3 Occlusion_Color648_g77006 = lerpResult2945_g77006;
			half3 Matcap_Color7428_g77006 = half3(0,0,0);
			half3 Blend_Albedo_Tinted2808_g77006 = ( ( Blend_Albedo265_g77006 * Tint_Gradient_Color5769_g77006 * Tint_Noise_Color5770_g77006 * Occlusion_Color648_g77006 ) + Matcap_Color7428_g77006 );
			float3 temp_output_3_0_g77063 = Blend_Albedo_Tinted2808_g77006;
			float dotResult20_g77063 = dot( temp_output_3_0_g77063 , float3(0.2126,0.7152,0.0722) );
			half Blend_Albedo_Grayscale5939_g77006 = dotResult20_g77063;
			float3 temp_cast_6 = (Blend_Albedo_Grayscale5939_g77006).xxx;
			float temp_output_82_0_g77029 = _LayerColorsValue;
			float temp_output_19_0_g77033 = TVE_ColorsUsage[(int)temp_output_82_0_g77029];
			float4 temp_output_91_19_g77029 = TVE_ColorsCoords;
			float3 lerpResult4822_g77006 = lerp( WorldPosition3905_g77006 , ObjectPosition4223_g77006 , _ColorsPositionMode);
			half2 UV94_g77029 = ( (temp_output_91_19_g77029).zw + ( (temp_output_91_19_g77029).xy * (lerpResult4822_g77006).xz ) );
			float4 tex2DArrayNode83_g77029 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, float3(UV94_g77029,temp_output_82_0_g77029), 0.0 );
			float4 temp_output_17_0_g77033 = tex2DArrayNode83_g77029;
			float4 temp_output_92_86_g77029 = TVE_ColorsParams;
			float4 temp_output_3_0_g77033 = temp_output_92_86_g77029;
			float4 ifLocalVar18_g77033 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g77033 >= 0.5 )
				ifLocalVar18_g77033 = temp_output_17_0_g77033;
			else
				ifLocalVar18_g77033 = temp_output_3_0_g77033;
			float4 lerpResult22_g77033 = lerp( temp_output_3_0_g77033 , temp_output_17_0_g77033 , temp_output_19_0_g77033);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g77033 = lerpResult22_g77033;
			#else
				float4 staticSwitch24_g77033 = ifLocalVar18_g77033;
			#endif
			half4 Global_Colors_Params5434_g77006 = staticSwitch24_g77033;
			float4 temp_output_346_0_g77013 = Global_Colors_Params5434_g77006;
			half Global_Colors_A1701_g77006 = saturate( (temp_output_346_0_g77013).w );
			half Colors_Influence3668_g77006 = Global_Colors_A1701_g77006;
			float temp_output_6306_0_g77006 = ( 1.0 - Colors_Influence3668_g77006 );
			float3 lerpResult3618_g77006 = lerp( Blend_Albedo_Tinted2808_g77006 , temp_cast_6 , ( 1.0 - ( temp_output_6306_0_g77006 * temp_output_6306_0_g77006 ) ));
			half3 Global_Colors_RGB1700_g77006 = (temp_output_346_0_g77013).xyz;
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g77050 = 2.0;
			#else
				float staticSwitch1_g77050 = 4.594794;
			#endif
			half3 Colors_RGB1954_g77006 = ( Global_Colors_RGB1700_g77006 * staticSwitch1_g77050 );
			half Colors_Value3692_g77006 = ( Blend_Mask_Remap6621_g77006 * _GlobalColors );
			float lerpResult3870_g77006 = lerp( 1.0 , Global_MeshVariation5104_g77006 , _ColorsVariationValue);
			half Colors_Variation3650_g77006 = lerpResult3870_g77006;
			float lerpResult6459_g77006 = lerp( Occlusion_Mask6432_g77006 , ( 1.0 - Occlusion_Mask6432_g77006 ) , _ColorsMaskMode);
			float lerpResult6461_g77006 = lerp( Occlusion_Alpha6463_g77006 , 1.0 , lerpResult6459_g77006);
			half Occlusion_Colors6450_g77006 = lerpResult6461_g77006;
			float temp_output_7_0_g77122 = 0.1;
			float temp_output_10_0_g77122 = ( 0.2 - temp_output_7_0_g77122 );
			float lerpResult16_g77051 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g77006 * Colors_Influence3668_g77006 * Colors_Variation3650_g77006 * Occlusion_Colors6450_g77006 * Blend_Albedo_Globals6410_g77006 ) - temp_output_7_0_g77122 ) / ( temp_output_10_0_g77122 + 0.0001 ) ) ) , TVE_IsEnabled);
			float3 lerpResult3628_g77006 = lerp( Blend_Albedo_Tinted2808_g77006 , ( lerpResult3618_g77006 * Colors_RGB1954_g77006 ) , lerpResult16_g77051);
			half3 Blend_Albedo_Colored_High6027_g77006 = lerpResult3628_g77006;
			half3 Blend_Albedo_Colored863_g77006 = Blend_Albedo_Colored_High6027_g77006;
			half3 Global_OverlayColor1758_g77006 = (TVE_OverlayColor).rgb;
			float3 lerpResult336_g77006 = lerp( Blend_Albedo_Colored863_g77006 , Global_OverlayColor1758_g77006 , Overlay_Mask269_g77006);
			half3 Blend_Albedo_Overlay359_g77006 = lerpResult336_g77006;
			half Global_WetnessContrast6502_g77006 = TVE_WetnessContrast;
			float3 lerpResult6367_g77006 = lerp( Blend_Albedo_Overlay359_g77006 , ( Blend_Albedo_Overlay359_g77006 * Blend_Albedo_Overlay359_g77006 ) , ( Global_WetnessContrast6502_g77006 * Wetness_Value6343_g77006 ));
			half3 Blend_Albedo_Wetness6351_g77006 = lerpResult6367_g77006;
			half3 Tint_Highlight_Color5771_g77006 = ( ( (_MotionHighlightColor).rgb * i.vertexToFrag11_g77053 ) + float3( 1,1,1 ) );
			float3 temp_output_6309_0_g77006 = ( Blend_Albedo_Wetness6351_g77006 * Tint_Highlight_Color5771_g77006 );
			half3 Subsurface_Color1722_g77006 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Wetness6351_g77006 );
			half Global_Subsurface4041_g77006 = TVE_SubsurfaceValue;
			half Global_OverlaySubsurface5667_g77006 = TVE_OverlaySubsurface;
			float lerpResult7362_g77006 = lerp( 1.0 , Global_OverlaySubsurface5667_g77006 , Overlay_Value5738_g77006);
			half Overlay_Subsurface7361_g77006 = lerpResult7362_g77006;
			half Subsurface_Intensity1752_g77006 = ( _SubsurfaceValue * Global_Subsurface4041_g77006 * Overlay_Subsurface7361_g77006 );
			half Subsurface_Mask1557_g77006 = Blend_Mask_Remap6621_g77006;
			half3 MainLight_Direction3926_g77006 = TVE_MainLightDirection;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult2169_g77006 = normalize( ase_worldViewDir );
			float3 ViewDirection3963_g77006 = normalizeResult2169_g77006;
			float dotResult785_g77006 = dot( -MainLight_Direction3926_g77006 , ViewDirection3963_g77006 );
			float saferPower1624_g77006 = abs( saturate( dotResult785_g77006 ) );
			#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g77006 = 0.0;
			#else
				float staticSwitch1602_g77006 = ( pow( saferPower1624_g77006 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
			#endif
			half Mask_Subsurface_View782_g77006 = staticSwitch1602_g77006;
			half3 Subsurface_Approximation1693_g77006 = ( Subsurface_Color1722_g77006 * Subsurface_Intensity1752_g77006 * Subsurface_Mask1557_g77006 * Mask_Subsurface_View782_g77006 );
			half3 Blend_Albedo_Subsurface149_g77006 = ( temp_output_6309_0_g77006 + Subsurface_Approximation1693_g77006 );
			half3 Blend_Albedo_RimLight7316_g77006 = Blend_Albedo_Subsurface149_g77006;
			o.Albedo = Blend_Albedo_RimLight7316_g77006;
			half3 Emissive_Color7162_g77006 = (_EmissiveColor).rgb;
			half2 Emissive_UVs2468_g77006 = ( ( i.uv_texcoord.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
			float temp_output_7_0_g77132 = _EmissiveTexMinValue;
			float3 temp_cast_11 = (temp_output_7_0_g77132).xxx;
			float temp_output_10_0_g77132 = ( _EmissiveTexMaxValue - temp_output_7_0_g77132 );
			half3 Emissive_Texture7022_g77006 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g77006 )).rgb - temp_cast_11 ) / ( temp_output_10_0_g77132 + 0.0001 ) ) );
			half Global_Extras_Emissive4203_g77006 = break456_g77042.x;
			float lerpResult4206_g77006 = lerp( 1.0 , Global_Extras_Emissive4203_g77006 , _GlobalEmissive);
			half Emissive_Value7024_g77006 = ( ( lerpResult4206_g77006 * _EmissivePhaseValue ) - 1.0 );
			half3 Emissive_Mask6968_g77006 = saturate( ( Emissive_Texture7022_g77006 + Emissive_Value7024_g77006 ) );
			float3 temp_output_3_0_g77041 = ( Emissive_Color7162_g77006 * Emissive_Mask6968_g77006 );
			float temp_output_15_0_g77041 = _emissive_intensity_value;
			float3 temp_output_23_0_g77041 = ( temp_output_3_0_g77041 * temp_output_15_0_g77041 );
			half3 Final_Emissive2476_g77006 = temp_output_23_0_g77041;
			o.Emission = Final_Emissive2476_g77006;
			half Render_Specular4861_g77006 = _RenderSpecular;
			float3 temp_cast_12 = (( 0.04 * Render_Specular4861_g77006 )).xxx;
			o.Specular = temp_cast_12;
			half Main_Smoothness227_g77006 = ( tex2DNode35_g77006.a * _MainSmoothnessValue );
			half Second_Smoothness236_g77006 = ( tex2DNode33_g77006.a * _SecondSmoothnessValue );
			float lerpResult266_g77006 = lerp( Main_Smoothness227_g77006 , Second_Smoothness236_g77006 , Blend_Mask147_g77006);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g77006 = lerpResult266_g77006;
			#else
				float staticSwitch297_g77006 = Main_Smoothness227_g77006;
			#endif
			half Blend_Smoothness314_g77006 = staticSwitch297_g77006;
			half Global_OverlaySmoothness311_g77006 = TVE_OverlaySmoothness;
			float lerpResult343_g77006 = lerp( Blend_Smoothness314_g77006 , Global_OverlaySmoothness311_g77006 , Overlay_Mask269_g77006);
			half Blend_Smoothness_Overlay371_g77006 = lerpResult343_g77006;
			float temp_output_6499_0_g77006 = ( 1.0 - Wetness_Value6343_g77006 );
			half Blend_Smoothness_Wetness4130_g77006 = saturate( ( Blend_Smoothness_Overlay371_g77006 + ( 1.0 - ( temp_output_6499_0_g77006 * temp_output_6499_0_g77006 ) ) ) );
			o.Smoothness = Blend_Smoothness_Wetness4130_g77006;
			float lerpResult240_g77006 = lerp( 1.0 , tex2DNode35_g77006.g , _MainOcclusionValue);
			half Main_Occlusion247_g77006 = lerpResult240_g77006;
			float lerpResult239_g77006 = lerp( 1.0 , tex2DNode33_g77006.g , _SecondOcclusionValue);
			half Second_Occlusion251_g77006 = lerpResult239_g77006;
			float lerpResult294_g77006 = lerp( Main_Occlusion247_g77006 , Second_Occlusion251_g77006 , Blend_Mask147_g77006);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g77006 = lerpResult294_g77006;
			#else
				float staticSwitch310_g77006 = Main_Occlusion247_g77006;
			#endif
			half Blend_Occlusion323_g77006 = staticSwitch310_g77006;
			o.Occlusion = Blend_Occlusion323_g77006;
			float localCustomAlphaClip19_g77061 = ( 0.0 );
			half Main_Alpha316_g77006 = tex2DNode29_g77006.a;
			half Second_Alpha5007_g77006 = tex2DNode89_g77006.a;
			float lerpResult6153_g77006 = lerp( Main_Alpha316_g77006 , Second_Alpha5007_g77006 , Blend_Mask147_g77006);
			float lerpResult6785_g77006 = lerp( ( Main_Alpha316_g77006 * Second_Alpha5007_g77006 ) , lerpResult6153_g77006 , _DetailAlphaMode);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g77006 = lerpResult6785_g77006;
			#else
				float staticSwitch6158_g77006 = Main_Alpha316_g77006;
			#endif
			half Blend_Alpha6157_g77006 = staticSwitch6158_g77006;
			half AlphaTreshold2132_g77006 = _AlphaClipValue;
			half Global_Extras_Alpha1033_g77006 = saturate( break456_g77042.w );
			float lerpResult5154_g77006 = lerp( 0.0 , Global_MeshVariation5104_g77006 , _AlphaVariationValue);
			half Global_Alpha_Variation5158_g77006 = lerpResult5154_g77006;
			float lerpResult6866_g77006 = lerp( ( 1.0 - Blend_Mask147_g77006 ) , 1.0 , _DetailFadeMode);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g77006 = lerpResult6866_g77006;
			#else
				float staticSwitch6612_g77006 = 1.0;
			#endif
			half Blend_Mask_Invert6260_g77006 = staticSwitch6612_g77006;
			half Alpha_Mask6234_g77006 = ( 1.0 * Blend_Mask_Invert6260_g77006 );
			float lerpResult5203_g77006 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g77006 - Global_Alpha_Variation5158_g77006 ) + ( Global_Extras_Alpha1033_g77006 * 0.5 ) ) ) , ( Alpha_Mask6234_g77006 * _GlobalAlpha ));
			float lerpResult16_g77056 = lerp( 1.0 , lerpResult5203_g77006 , TVE_IsEnabled);
			half Global_Alpha315_g77006 = lerpResult16_g77056;
			float3 normalizeResult3971_g77006 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
			float3 WorldNormal_Derivates3972_g77006 = normalizeResult3971_g77006;
			float dotResult3851_g77006 = dot( ViewDirection3963_g77006 , WorldNormal_Derivates3972_g77006 );
			float lerpResult3993_g77006 = lerp( 1.0 , saturate( ( abs( dotResult3851_g77006 ) * 3.0 ) ) , _FadeGlancingValue);
			half Fade_Glancing3853_g77006 = lerpResult3993_g77006;
			half Fade_Effects_A5360_g77006 = Fade_Glancing3853_g77006;
			float temp_output_7_0_g77074 = TVE_CameraFadeMin;
			float temp_output_10_0_g77074 = ( TVE_CameraFadeMax - temp_output_7_0_g77074 );
			float lerpResult4755_g77006 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g77074 ) / ( temp_output_10_0_g77074 + 0.0001 ) ) ) ) , _FadeCameraValue);
			half Fade_Camera3743_g77006 = lerpResult4755_g77006;
			half Fade_Mask5149_g77006 = ( 1.0 * Blend_Mask_Invert6260_g77006 );
			float lerpResult5141_g77006 = lerp( 1.0 , ( ( Fade_Effects_A5360_g77006 * Fade_Camera3743_g77006 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g77006);
			half Fade_Effects_B6228_g77006 = lerpResult5141_g77006;
			float temp_output_5865_0_g77006 = saturate( ( Fade_Effects_B6228_g77006 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g77006 ) ).r ) );
			half Fade_Alpha3727_g77006 = temp_output_5865_0_g77006;
			float Emissive_Alpha6927_g77006 = 1.0;
			half Final_Alpha7344_g77006 = min( min( ( Blend_Alpha6157_g77006 - AlphaTreshold2132_g77006 ) , Global_Alpha315_g77006 ) , min( Fade_Alpha3727_g77006 , Emissive_Alpha6927_g77006 ) );
			float temp_output_3_0_g77061 = Final_Alpha7344_g77006;
			float Alpha19_g77061 = temp_output_3_0_g77061;
			float temp_output_15_0_g77061 = 0.01;
			float Treshold19_g77061 = temp_output_15_0_g77061;
			{
			#if defined (TVE_FEATURE_CLIP)
			#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
					clip(Alpha19_g77061 - Treshold19_g77061);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
					clip(Alpha19_g77061 - Treshold19_g77061);
				#endif
			#else
				clip(Alpha19_g77061 - Treshold19_g77061);
			#endif
			#endif
			}
			half Main_Color_Alpha6121_g77006 = _MainColor.a;
			half Second_Color_Alpha6152_g77006 = _SecondColor.a;
			float lerpResult6168_g77006 = lerp( Main_Color_Alpha6121_g77006 , Second_Color_Alpha6152_g77006 , Blend_Mask147_g77006);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g77006 = lerpResult6168_g77006;
			#else
				float staticSwitch6174_g77006 = Main_Color_Alpha6121_g77006;
			#endif
			half Blend_Color_Alpha6167_g77006 = staticSwitch6174_g77006;
			half Final_Clip914_g77006 = saturate( ( Alpha19_g77061 * Blend_Color_Alpha6167_g77006 ) );
			o.Alpha = Final_Clip914_g77006;
		}

		ENDCG
	}
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;236;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1277.803;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,384;Inherit;False;1282.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1282.837;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;641;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;240;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1595,-771;Half;False;Property;_render_zw;_render_zw;239;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;237;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;238;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;638;-2176,512;Inherit;False;Define Pipeline Standard;-1;;76876;9af03ae8defe78d448ef2a4ef3601e12;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;640;-1280,512;Inherit;False;Compile Core;-1;;76879;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;639;-1088,512;Inherit;False;Compile All Shaders;-1;;76880;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;637;-1152,-384;Float;False;True;-1;5;TVEShaderCoreGUI;0;0;StandardSpecular;BOXOPHOBIC/The Vegetation Engine/Default/Plant Standard Lit;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;True;Back;0;True;_render_zw;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;1;0;True;_render_src;0;True;_render_dst;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;241;-1;-1;-1;0;False;0;0;True;_render_cull;-1;0;False;;0;0;0;False;0.1;False;;0;True;_render_coverage;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.FunctionNode;673;-1920,512;Inherit;False;Define Lighting Standard;242;;77004;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;610;-1664,512;Inherit;False;Define ShaderType Plant;244;;77005;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;672;-2176,-384;Inherit;False;Base Shader;0;;77006;856f7164d1c579d43a5cf4968a75ca43;93,7343,0,3880,1,4028,1,3900,1,3908,1,4172,1,4179,1,1298,1,6791,1,1300,1,6792,1,3586,0,4499,1,1708,1,6056,1,3509,1,3873,1,893,1,6230,0,5156,1,5345,0,6116,1,7566,1,1717,1,1715,1,1714,1,1718,1,5075,1,6592,1,6068,1,6076,1,6692,0,6729,1,1776,1,6378,1,6352,1,3475,1,6655,1,4210,1,1745,1,3479,0,1646,1,3501,1,2807,1,6206,1,7565,1,4999,0,6194,1,3887,0,7321,0,7332,0,3957,1,6647,0,6257,0,5357,0,2172,1,3883,0,3728,1,5350,0,2658,1,1742,1,3484,0,6848,1,6622,1,1737,1,1736,1,1735,1,6161,1,4837,1,1734,1,6320,1,6166,1,7429,0,7348,0,860,1,6721,1,2261,1,2260,1,2054,1,2032,1,5258,1,2062,1,2039,1,7548,1,7550,1,3243,1,5220,1,4217,1,6699,1,5339,0,4242,1,5090,1,7492,0;9;7333;FLOAT3;1,1,1;False;6196;FLOAT;1;False;6693;FLOAT;1;False;6201;FLOAT;1;False;6205;FLOAT;1;False;5143;FLOAT;1;False;6231;FLOAT;1;False;6198;FLOAT;1;False;5340;FLOAT3;0,0,0;False;23;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
WireConnection;637;0;672;0
WireConnection;637;1;672;528
WireConnection;637;2;672;2489
WireConnection;637;3;672;3678
WireConnection;637;4;672;530
WireConnection;637;5;672;531
WireConnection;637;9;672;532
WireConnection;637;11;672;534
ASEEND*/
//CHKSM=B53167FE7764822D0B9AF431FCD29FF0E8F7924E
