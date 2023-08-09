// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Default/Bark Standard Lit"
{
	Properties
	{
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
		[StyledToggle]_MotionValue_20("Use Branch Motion Settings", Float) = 1
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
		[HideInInspector]_IsBarkShader("_IsBarkShader", Float) = 1
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
		#define TVE_IS_BARK_SHADER
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
			float2 vertexToFrag11_g79816;
			float4 vertexColor : COLOR;
			float3 worldNormal;
			INTERNAL_DATA
			float3 vertexToFrag3890_g79786;
			float3 vertexToFrag4224_g79786;
			half ASEIsFrontFacing : VFACE;
		};

		uniform half _render_cull;
		uniform half _render_src;
		uniform half _render_dst;
		uniform half _render_zw;
		uniform half _render_coverage;
		uniform half _IsStandardShader;
		uniform float _IsBarkShader;
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
		uniform half _LayerVertexValue;
		uniform float TVE_VertexUsage[10];
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_VertexTex);
		uniform half4 TVE_VertexCoords;
		uniform half4 TVE_VertexParams;
		uniform half _GlobalSize;
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
		uniform half4 _VertexOcclusionColor;
		uniform half _VertexOcclusionMinValue;
		uniform half _VertexOcclusionMaxValue;
		uniform half TVE_WetnessNormalValue;
		uniform half _GlobalWetness;
		uniform half3 _render_normals;
		uniform half4 TVE_OverlayColor;
		uniform half TVE_WetnessContrast;
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
		uniform half TVE_CameraFadeMin;
		uniform half TVE_CameraFadeMax;
		uniform half _FadeCameraValue;
		uniform half _FadeConstantValue;
		uniform half _DetailFadeMode;
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
			float3 VertexPosition3588_g79786 = ase_vertex3Pos;
			float3 appendResult60_g79796 = (float3(v.texcoord3.x , v.texcoord3.z , v.texcoord3.y));
			half3 Mesh_PivotsData2831_g79786 = ( appendResult60_g79796 * _VertexPivotMode );
			half3 Mesh_PivotsOS2291_g79786 = Mesh_PivotsData2831_g79786;
			float3 temp_output_2283_0_g79786 = ( VertexPosition3588_g79786 - Mesh_PivotsOS2291_g79786 );
			half3 VertexPos40_g79899 = temp_output_2283_0_g79786;
			half3 VertexPos40_g79900 = VertexPos40_g79899;
			float3 appendResult74_g79900 = (float3(VertexPos40_g79900.x , 0.0 , 0.0));
			half3 VertexPosRotationAxis50_g79900 = appendResult74_g79900;
			float3 break84_g79900 = VertexPos40_g79900;
			float3 appendResult81_g79900 = (float3(0.0 , break84_g79900.y , break84_g79900.z));
			half3 VertexPosOtherAxis82_g79900 = appendResult81_g79900;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 vertexToFrag3890_g79786 = ase_worldPos;
			float3 WorldPosition3905_g79786 = vertexToFrag3890_g79786;
			float3 WorldPosition_Shifted7477_g79786 = ( WorldPosition3905_g79786 - TVE_WorldOrigin );
			float4x4 break19_g79862 = unity_ObjectToWorld;
			float3 appendResult20_g79862 = (float3(break19_g79862[ 0 ][ 3 ] , break19_g79862[ 1 ][ 3 ] , break19_g79862[ 2 ][ 3 ]));
			float3 temp_output_122_0_g79862 = Mesh_PivotsData2831_g79786;
			float3 PivotsOnly105_g79862 = (mul( unity_ObjectToWorld, float4( temp_output_122_0_g79862 , 0.0 ) ).xyz).xyz;
			half3 ObjectData20_g79864 = ( appendResult20_g79862 + PivotsOnly105_g79862 );
			half3 WorldData19_g79864 = ase_worldPos;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g79864 = WorldData19_g79864;
			#else
				float3 staticSwitch14_g79864 = ObjectData20_g79864;
			#endif
			float3 temp_output_114_0_g79862 = staticSwitch14_g79864;
			float3 vertexToFrag4224_g79786 = temp_output_114_0_g79862;
			float3 ObjectPosition4223_g79786 = vertexToFrag4224_g79786;
			float3 ObjectPosition_Shifted7481_g79786 = ( ObjectPosition4223_g79786 - TVE_WorldOrigin );
			float3 lerpResult6766_g79786 = lerp( WorldPosition_Shifted7477_g79786 , ObjectPosition_Shifted7481_g79786 , _MotionPosition_10);
			float3 Motion_10_Position6738_g79786 = lerpResult6766_g79786;
			half3 Input_Position419_g79882 = Motion_10_Position6738_g79786;
			float Input_MotionScale287_g79882 = ( _MotionScale_10 + 0.2 );
			float2 temp_output_597_0_g79882 = (( Input_Position419_g79882 * Input_MotionScale287_g79882 * 0.0075 )).xz;
			float2 temp_output_447_0_g79791 = ((TVE_MotionParams).xy*2.0 + -1.0);
			half2 Global_Wind_DirectionWS4683_g79786 = temp_output_447_0_g79791;
			half2 Input_DirectionWS423_g79882 = Global_Wind_DirectionWS4683_g79786;
			float lerpResult115_g79883 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g79882 = _MotionSpeed_10;
			half Input_MotionVariation284_g79882 = _MotionVariation_10;
			half3 Input_Position167_g79857 = ObjectPosition_Shifted7481_g79786;
			float dotResult156_g79857 = dot( (Input_Position167_g79857).xz , float2( 12.9898,78.233 ) );
			half Vertex_DynamicMode5112_g79786 = _VertexDynamicMode;
			half Input_DynamicMode120_g79857 = Vertex_DynamicMode5112_g79786;
			float Postion_Random162_g79857 = ( sin( dotResult156_g79857 ) * ( 1.0 - Input_DynamicMode120_g79857 ) );
			float Mesh_Variation16_g79786 = v.color.r;
			half Input_Variation124_g79857 = Mesh_Variation16_g79786;
			half ObjectData20_g79859 = frac( ( Postion_Random162_g79857 + Input_Variation124_g79857 ) );
			half WorldData19_g79859 = Input_Variation124_g79857;
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g79859 = WorldData19_g79859;
			#else
				float staticSwitch14_g79859 = ObjectData20_g79859;
			#endif
			float temp_output_112_0_g79857 = staticSwitch14_g79859;
			float clampResult171_g79857 = clamp( temp_output_112_0_g79857 , 0.01 , 0.99 );
			float Global_MeshVariation5104_g79786 = clampResult171_g79857;
			half Input_GlobalMeshVariation569_g79882 = Global_MeshVariation5104_g79786;
			float temp_output_630_0_g79882 = ( ( ( lerpResult115_g79883 * Input_MotionSpeed62_g79882 ) + ( Input_MotionVariation284_g79882 * Input_GlobalMeshVariation569_g79882 ) ) * 0.03 );
			float temp_output_607_0_g79882 = frac( temp_output_630_0_g79882 );
			float4 lerpResult590_g79882 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g79882 + ( -Input_DirectionWS423_g79882 * temp_output_607_0_g79882 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g79882 + ( -Input_DirectionWS423_g79882 * frac( ( temp_output_630_0_g79882 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g79882 - 0.5 ) ) / 0.5 ));
			half4 Noise_Complex703_g79882 = lerpResult590_g79882;
			float2 temp_output_645_0_g79882 = ((Noise_Complex703_g79882).rg*2.0 + -1.0);
			float2 break650_g79882 = temp_output_645_0_g79882;
			float3 appendResult649_g79882 = (float3(break650_g79882.x , 0.0 , break650_g79882.y));
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			half2 Global_Noise_OS5548_g79786 = (( mul( unity_WorldToObject, float4( appendResult649_g79882 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_Noise_DirectionOS487_g79905 = Global_Noise_OS5548_g79786;
			float2 break448_g79791 = temp_output_447_0_g79791;
			float3 appendResult452_g79791 = (float3(break448_g79791.x , 0.0 , break448_g79791.y));
			half2 Global_Wind_DirectionOS5692_g79786 = (( mul( unity_WorldToObject, float4( appendResult452_g79791 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_Wind_DirectionOS458_g79905 = Global_Wind_DirectionOS5692_g79786;
			float temp_output_84_0_g79799 = _LayerMotionValue;
			float temp_output_19_0_g79803 = TVE_MotionUsage[(int)temp_output_84_0_g79799];
			float4 temp_output_91_19_g79799 = TVE_MotionCoords;
			half2 UV94_g79799 = ( (temp_output_91_19_g79799).zw + ( (temp_output_91_19_g79799).xy * (ObjectPosition4223_g79786).xz ) );
			float4 tex2DArrayNode50_g79799 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g79799,temp_output_84_0_g79799), 0.0 );
			float4 temp_output_17_0_g79803 = tex2DArrayNode50_g79799;
			float4 temp_output_112_19_g79799 = TVE_MotionParams;
			float4 temp_output_3_0_g79803 = temp_output_112_19_g79799;
			float4 ifLocalVar18_g79803 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g79803 >= 0.5 )
				ifLocalVar18_g79803 = temp_output_17_0_g79803;
			else
				ifLocalVar18_g79803 = temp_output_3_0_g79803;
			float4 lerpResult22_g79803 = lerp( temp_output_3_0_g79803 , temp_output_17_0_g79803 , temp_output_19_0_g79803);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g79803 = lerpResult22_g79803;
			#else
				float4 staticSwitch24_g79803 = ifLocalVar18_g79803;
			#endif
			half4 Global_Motion_Params3909_g79786 = staticSwitch24_g79803;
			float4 break322_g79791 = Global_Motion_Params3909_g79786;
			half Global_Wind_Power2223_g79786 = break322_g79791.z;
			half Input_WindPower449_g79905 = Global_Wind_Power2223_g79786;
			float temp_output_565_0_g79905 = ( 1.0 - Input_WindPower449_g79905 );
			float2 lerpResult516_g79905 = lerp( Input_Noise_DirectionOS487_g79905 , Input_Wind_DirectionOS458_g79905 , ( ( 1.0 - ( temp_output_565_0_g79905 * temp_output_565_0_g79905 * temp_output_565_0_g79905 ) ) * 0.6 ));
			half Mesh_Motion_107572_g79786 = v.color.a;
			half Input_MeshHeight388_g79905 = Mesh_Motion_107572_g79786;
			half ObjectData20_g79906 = Input_MeshHeight388_g79905;
			float enc62_g79910 = v.texcoord.w;
			float2 localDecodeFloatToVector262_g79910 = DecodeFloatToVector2( enc62_g79910 );
			float2 break63_g79910 = ( localDecodeFloatToVector262_g79910 * 100.0 );
			float Bounds_Height5230_g79786 = break63_g79910.x;
			half Input_BoundsHeight390_g79905 = Bounds_Height5230_g79786;
			half WorldData19_g79906 = ( Input_MeshHeight388_g79905 * Input_MeshHeight388_g79905 * Input_BoundsHeight390_g79905 );
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g79906 = WorldData19_g79906;
			#else
				float staticSwitch14_g79906 = ObjectData20_g79906;
			#endif
			half Final_Motion10_Mask321_g79905 = ( staticSwitch14_g79906 * 2.0 );
			half Input_BendingAmplitude376_g79905 = _MotionAmplitude_10;
			half Global_MotionValue640_g79905 = TVE_MotionValue_10;
			half2 Final_Bending631_g79905 = ( lerpResult516_g79905 * ( Final_Motion10_Mask321_g79905 * Input_BendingAmplitude376_g79905 * Input_WindPower449_g79905 * Input_WindPower449_g79905 * Global_MotionValue640_g79905 ) );
			float2 appendResult433_g79791 = (float2(break322_g79791.x , break322_g79791.y));
			float2 temp_output_436_0_g79791 = (appendResult433_g79791*2.0 + -1.0);
			float2 break441_g79791 = temp_output_436_0_g79791;
			float3 appendResult440_g79791 = (float3(break441_g79791.x , 0.0 , break441_g79791.y));
			half2 Global_React_DirectionOS39_g79786 = (( mul( unity_WorldToObject, float4( appendResult440_g79791 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
			half2 Input_React_DirectionOS358_g79905 = Global_React_DirectionOS39_g79786;
			float clampResult17_g79908 = clamp( Input_MeshHeight388_g79905 , 0.0001 , 0.9999 );
			float temp_output_7_0_g79907 = 0.0;
			half Input_InteractionUseMask62_g79905 = _InteractionMaskValue;
			float temp_output_10_0_g79907 = ( Input_InteractionUseMask62_g79905 - temp_output_7_0_g79907 );
			half Final_InteractionRemap594_g79905 = saturate( ( ( clampResult17_g79908 - temp_output_7_0_g79907 ) / ( temp_output_10_0_g79907 + 0.0001 ) ) );
			half ObjectData20_g79909 = Final_InteractionRemap594_g79905;
			half WorldData19_g79909 = ( Final_InteractionRemap594_g79905 * Final_InteractionRemap594_g79905 * Input_BoundsHeight390_g79905 );
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g79909 = WorldData19_g79909;
			#else
				float staticSwitch14_g79909 = ObjectData20_g79909;
			#endif
			half Final_InteractionMask373_g79905 = ( staticSwitch14_g79909 * 2.0 );
			half Input_InteractionAmplitude58_g79905 = _InteractionAmplitude;
			half2 Final_Interaction632_g79905 = ( Input_React_DirectionOS358_g79905 * Final_InteractionMask373_g79905 * Input_InteractionAmplitude58_g79905 );
			half Global_Interaction_Mask66_g79786 = ( break322_g79791.w * break322_g79791.w * break322_g79791.w * break322_g79791.w );
			float Input_InteractionGlobalMask330_g79905 = Global_Interaction_Mask66_g79786;
			half Final_InteractionValue525_g79905 = saturate( ( Input_InteractionAmplitude58_g79905 * Input_InteractionGlobalMask330_g79905 ) );
			float2 lerpResult551_g79905 = lerp( Final_Bending631_g79905 , Final_Interaction632_g79905 , Final_InteractionValue525_g79905);
			float2 break364_g79905 = lerpResult551_g79905;
			float3 appendResult638_g79905 = (float3(break364_g79905.x , 0.0 , break364_g79905.y));
			half3 Motion_10_Interaction7519_g79786 = appendResult638_g79905;
			half3 Angle44_g79899 = Motion_10_Interaction7519_g79786;
			half Angle44_g79900 = (Angle44_g79899).z;
			half3 VertexPos40_g79901 = ( VertexPosRotationAxis50_g79900 + ( VertexPosOtherAxis82_g79900 * cos( Angle44_g79900 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g79900 ) * sin( Angle44_g79900 ) ) );
			float3 appendResult74_g79901 = (float3(0.0 , 0.0 , VertexPos40_g79901.z));
			half3 VertexPosRotationAxis50_g79901 = appendResult74_g79901;
			float3 break84_g79901 = VertexPos40_g79901;
			float3 appendResult81_g79901 = (float3(break84_g79901.x , break84_g79901.y , 0.0));
			half3 VertexPosOtherAxis82_g79901 = appendResult81_g79901;
			half Angle44_g79901 = -(Angle44_g79899).x;
			half3 Input_Position419_g79891 = WorldPosition_Shifted7477_g79786;
			float3 break459_g79891 = Input_Position419_g79891;
			float Sum_Position446_g79891 = ( break459_g79891.x + break459_g79891.y + break459_g79891.z );
			half Input_MotionScale321_g79891 = ( _MotionScale_20 * 0.1 );
			half Input_MotionVariation330_g79891 = _MotionVariation_20;
			half Input_GlobalVariation400_g79891 = Global_MeshVariation5104_g79786;
			float lerpResult115_g79892 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
			half Input_MotionSpeed62_g79891 = _MotionSpeed_20;
			float temp_output_404_0_g79891 = ( lerpResult115_g79892 * Input_MotionSpeed62_g79891 );
			half Motion_SineA450_g79891 = sin( ( ( Sum_Position446_g79891 * Input_MotionScale321_g79891 ) + ( Input_MotionVariation330_g79891 * Input_GlobalVariation400_g79891 ) + temp_output_404_0_g79891 ) );
			half Motion_SineB395_g79891 = sin( ( ( temp_output_404_0_g79891 * 0.6842 ) + ( Sum_Position446_g79891 * Input_MotionScale321_g79891 ) ) );
			half3 Input_Position419_g79797 = VertexPosition3588_g79786;
			float3 normalizeResult518_g79797 = normalize( Input_Position419_g79797 );
			half2 Input_DirectionOS423_g79797 = Global_React_DirectionOS39_g79786;
			float2 break521_g79797 = -Input_DirectionOS423_g79797;
			float3 appendResult522_g79797 = (float3(break521_g79797.x , 0.0 , break521_g79797.y));
			float dotResult519_g79797 = dot( normalizeResult518_g79797 , appendResult522_g79797 );
			half Input_Value62_g79797 = _MotionFacingValue;
			float lerpResult524_g79797 = lerp( 1.0 , (dotResult519_g79797*0.5 + 0.5) , Input_Value62_g79797);
			half ObjectData20_g79798 = max( lerpResult524_g79797 , 0.001 );
			half WorldData19_g79798 = 1.0;
			#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g79798 = WorldData19_g79798;
			#else
				float staticSwitch14_g79798 = ObjectData20_g79798;
			#endif
			half Motion_FacingMask5214_g79786 = staticSwitch14_g79798;
			half Motion_20_Amplitude4381_g79786 = ( _MotionValue_20 * Motion_FacingMask5214_g79786 );
			half Input_MotionAmplitude384_g79891 = Motion_20_Amplitude4381_g79786;
			half Input_GlobalWind407_g79891 = Global_Wind_Power2223_g79786;
			float4 break638_g79882 = abs( Noise_Complex703_g79882 );
			half Global_Noise_B5526_g79786 = break638_g79882.b;
			half Input_GlobalNoise411_g79891 = Global_Noise_B5526_g79786;
			float lerpResult413_g79891 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g79891);
			half Motion_Amplitude418_g79891 = ( Input_MotionAmplitude384_g79891 * Input_GlobalWind407_g79891 * pow( Input_GlobalNoise411_g79891 , lerpResult413_g79891 ) );
			half Input_Squash58_g79891 = _MotionAmplitude_20;
			float enc59_g79910 = v.texcoord.z;
			float2 localDecodeFloatToVector259_g79910 = DecodeFloatToVector2( enc59_g79910 );
			float2 break61_g79910 = localDecodeFloatToVector259_g79910;
			half Mesh_Motion_2060_g79786 = break61_g79910.x;
			half Input_MeshMotion_20388_g79891 = Mesh_Motion_2060_g79786;
			float Bounds_Radius5231_g79786 = break63_g79910.y;
			half Input_BoundsRadius390_g79891 = Bounds_Radius5231_g79786;
			half Global_MotionValue462_g79891 = TVE_MotionValue_20;
			half2 Input_DirectionOS366_g79891 = Global_React_DirectionOS39_g79786;
			float2 break371_g79891 = Input_DirectionOS366_g79891;
			float3 appendResult372_g79891 = (float3(break371_g79891.x , ( Motion_SineA450_g79891 * 0.3 ) , break371_g79891.y));
			half3 Motion_20_Squash4418_g79786 = ( ( (max( Motion_SineA450_g79891 , Motion_SineB395_g79891 )*0.5 + 0.5) * Motion_Amplitude418_g79891 * Input_Squash58_g79891 * Input_MeshMotion_20388_g79891 * Input_BoundsRadius390_g79891 * Global_MotionValue462_g79891 ) * appendResult372_g79891 );
			half3 VertexPos40_g79890 = ( ( VertexPosRotationAxis50_g79901 + ( VertexPosOtherAxis82_g79901 * cos( Angle44_g79901 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g79901 ) * sin( Angle44_g79901 ) ) ) + Motion_20_Squash4418_g79786 );
			float3 appendResult74_g79890 = (float3(0.0 , VertexPos40_g79890.y , 0.0));
			float3 VertexPosRotationAxis50_g79890 = appendResult74_g79890;
			float3 break84_g79890 = VertexPos40_g79890;
			float3 appendResult81_g79890 = (float3(break84_g79890.x , 0.0 , break84_g79890.z));
			float3 VertexPosOtherAxis82_g79890 = appendResult81_g79890;
			half Input_Rolling379_g79891 = _MotionAmplitude_22;
			half Motion_20_Rolling5257_g79786 = ( Motion_SineA450_g79891 * Motion_Amplitude418_g79891 * Input_Rolling379_g79891 * Input_MeshMotion_20388_g79891 * Global_MotionValue462_g79891 );
			half Angle44_g79890 = Motion_20_Rolling5257_g79786;
			float3 Vertex_Motion_Object833_g79786 = ( VertexPosRotationAxis50_g79890 + ( VertexPosOtherAxis82_g79890 * cos( Angle44_g79890 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g79890 ) * sin( Angle44_g79890 ) ) );
			half3 ObjectData20_g79876 = Vertex_Motion_Object833_g79786;
			float3 temp_output_3474_0_g79786 = ( VertexPosition3588_g79786 - Mesh_PivotsOS2291_g79786 );
			float3 Vertex_Motion_World1118_g79786 = ( ( temp_output_3474_0_g79786 + Motion_10_Interaction7519_g79786 ) + Motion_20_Squash4418_g79786 );
			half3 WorldData19_g79876 = Vertex_Motion_World1118_g79786;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g79876 = WorldData19_g79876;
			#else
				float3 staticSwitch14_g79876 = ObjectData20_g79876;
			#endif
			float3 temp_output_7495_0_g79786 = staticSwitch14_g79876;
			float3 Vertex_Motion7493_g79786 = temp_output_7495_0_g79786;
			half3 Grass_Perspective2661_g79786 = half3(0,0,0);
			float temp_output_84_0_g79824 = _LayerVertexValue;
			float temp_output_19_0_g79828 = TVE_VertexUsage[(int)temp_output_84_0_g79824];
			float4 temp_output_94_19_g79824 = TVE_VertexCoords;
			half2 UV97_g79824 = ( (temp_output_94_19_g79824).zw + ( (temp_output_94_19_g79824).xy * (ObjectPosition4223_g79786).xz ) );
			float4 tex2DArrayNode50_g79824 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g79824,temp_output_84_0_g79824), 0.0 );
			float4 temp_output_17_0_g79828 = tex2DArrayNode50_g79824;
			float4 temp_output_111_19_g79824 = TVE_VertexParams;
			float4 temp_output_3_0_g79828 = temp_output_111_19_g79824;
			float4 ifLocalVar18_g79828 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g79828 >= 0.5 )
				ifLocalVar18_g79828 = temp_output_17_0_g79828;
			else
				ifLocalVar18_g79828 = temp_output_3_0_g79828;
			float4 lerpResult22_g79828 = lerp( temp_output_3_0_g79828 , temp_output_17_0_g79828 , temp_output_19_0_g79828);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g79828 = lerpResult22_g79828;
			#else
				float4 staticSwitch24_g79828 = ifLocalVar18_g79828;
			#endif
			half4 Global_Vertex_Params4173_g79786 = staticSwitch24_g79828;
			float4 break322_g79829 = Global_Vertex_Params4173_g79786;
			half Global_VertexSize174_g79786 = saturate( break322_g79829.w );
			float lerpResult346_g79786 = lerp( 1.0 , Global_VertexSize174_g79786 , _GlobalSize);
			float3 appendResult3480_g79786 = (float3(lerpResult346_g79786 , lerpResult346_g79786 , lerpResult346_g79786));
			half3 ObjectData20_g79873 = appendResult3480_g79786;
			half3 _Vector11 = half3(1,1,1);
			half3 WorldData19_g79873 = _Vector11;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g79873 = WorldData19_g79873;
			#else
				float3 staticSwitch14_g79873 = ObjectData20_g79873;
			#endif
			half3 Vertex_Size1741_g79786 = staticSwitch14_g79873;
			half3 _Vector5 = half3(1,1,1);
			float3 Vertex_SizeFade1740_g79786 = _Vector5;
			float3 lerpResult16_g79877 = lerp( VertexPosition3588_g79786 , ( ( ( Vertex_Motion7493_g79786 + Grass_Perspective2661_g79786 ) * Vertex_Size1741_g79786 * Vertex_SizeFade1740_g79786 ) + Mesh_PivotsOS2291_g79786 ) , TVE_IsEnabled);
			float3 temp_output_4912_0_g79786 = lerpResult16_g79877;
			float3 Final_VertexPosition890_g79786 = ( temp_output_4912_0_g79786 + _DisableSRPBatcher );
			v.vertex.xyz = Final_VertexPosition890_g79786;
			v.vertex.w = 1;
			float4 break33_g79817 = _second_uvs_mode;
			float2 temp_output_30_0_g79817 = ( v.texcoord.xy * break33_g79817.x );
			float2 appendResult21_g79910 = (float2(v.texcoord1.z , v.texcoord1.w));
			float2 Mesh_DetailCoord3_g79786 = appendResult21_g79910;
			float2 temp_output_29_0_g79817 = ( Mesh_DetailCoord3_g79786 * break33_g79817.y );
			float2 temp_output_31_0_g79817 = ( (WorldPosition_Shifted7477_g79786).xz * break33_g79817.z );
			o.vertexToFrag11_g79816 = ( ( ( temp_output_30_0_g79817 + temp_output_29_0_g79817 + temp_output_31_0_g79817 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
			o.vertexToFrag3890_g79786 = ase_worldPos;
			o.vertexToFrag4224_g79786 = temp_output_114_0_g79862;
		}

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			half2 Main_UVs15_g79786 = ( ( i.uv_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
			half4 Normal_Packed45_g79814 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g79786 );
			float2 appendResult58_g79814 = (float2(( (Normal_Packed45_g79814).x * (Normal_Packed45_g79814).w ) , (Normal_Packed45_g79814).y));
			half2 Normal_Default50_g79814 = appendResult58_g79814;
			half2 Normal_ASTC41_g79814 = (Normal_Packed45_g79814).xy;
			#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g79814 = Normal_ASTC41_g79814;
			#else
				float2 staticSwitch38_g79814 = Normal_Default50_g79814;
			#endif
			half2 Normal_NO_DTX544_g79814 = (Normal_Packed45_g79814).wy;
			#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g79814 = Normal_NO_DTX544_g79814;
			#else
				float2 staticSwitch37_g79814 = staticSwitch38_g79814;
			#endif
			float2 temp_output_6555_0_g79786 = ( (staticSwitch37_g79814*2.0 + -1.0) * _MainNormalValue );
			half2 Main_Normal137_g79786 = temp_output_6555_0_g79786;
			float2 lerpResult3372_g79786 = lerp( float2( 0,0 ) , Main_Normal137_g79786 , _DetailNormalValue);
			half2 Second_UVs17_g79786 = i.vertexToFrag11_g79816;
			half4 Normal_Packed45_g79815 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g79786 );
			float2 appendResult58_g79815 = (float2(( (Normal_Packed45_g79815).x * (Normal_Packed45_g79815).w ) , (Normal_Packed45_g79815).y));
			half2 Normal_Default50_g79815 = appendResult58_g79815;
			half2 Normal_ASTC41_g79815 = (Normal_Packed45_g79815).xy;
			#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g79815 = Normal_ASTC41_g79815;
			#else
				float2 staticSwitch38_g79815 = Normal_Default50_g79815;
			#endif
			half2 Normal_NO_DTX544_g79815 = (Normal_Packed45_g79815).wy;
			#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g79815 = Normal_NO_DTX544_g79815;
			#else
				float2 staticSwitch37_g79815 = staticSwitch38_g79815;
			#endif
			half2 Second_Normal179_g79786 = ( (staticSwitch37_g79815*2.0 + -1.0) * _SecondNormalValue );
			float2 temp_output_36_0_g79835 = ( lerpResult3372_g79786 + Second_Normal179_g79786 );
			float4 tex2DNode35_g79786 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g79786 );
			half Main_Mask57_g79786 = tex2DNode35_g79786.b;
			float4 tex2DNode33_g79786 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g79786 );
			half Second_Mask81_g79786 = tex2DNode33_g79786.b;
			float lerpResult6885_g79786 = lerp( Main_Mask57_g79786 , Second_Mask81_g79786 , _DetailMaskMode);
			float clampResult17_g79896 = clamp( lerpResult6885_g79786 , 0.0001 , 0.9999 );
			float temp_output_7_0_g79895 = _DetailMaskMinValue;
			float temp_output_10_0_g79895 = ( _DetailMaskMaxValue - temp_output_7_0_g79895 );
			half Blend_Mask_Texture6794_g79786 = saturate( ( ( clampResult17_g79896 - temp_output_7_0_g79895 ) / ( temp_output_10_0_g79895 + 0.0001 ) ) );
			half Mesh_DetailMask90_g79786 = i.vertexColor.b;
			float3 appendResult7388_g79786 = (float3(temp_output_6555_0_g79786 , 1.0));
			half3 Main_NormalWS7390_g79786 = (WorldNormalVector( i , appendResult7388_g79786 ));
			float lerpResult6884_g79786 = lerp( Mesh_DetailMask90_g79786 , ((Main_NormalWS7390_g79786).y*0.5 + 0.5) , _DetailMeshMode);
			float clampResult17_g79894 = clamp( lerpResult6884_g79786 , 0.0001 , 0.9999 );
			float temp_output_7_0_g79893 = _DetailMeshMinValue;
			float temp_output_10_0_g79893 = ( _DetailMeshMaxValue - temp_output_7_0_g79893 );
			half Blend_Mask_Mesh1540_g79786 = saturate( ( ( clampResult17_g79894 - temp_output_7_0_g79893 ) / ( temp_output_10_0_g79893 + 0.0001 ) ) );
			float clampResult17_g79913 = clamp( ( Blend_Mask_Texture6794_g79786 * Blend_Mask_Mesh1540_g79786 ) , 0.0001 , 0.9999 );
			float temp_output_7_0_g79914 = _DetailBlendMinValue;
			float temp_output_10_0_g79914 = ( _DetailBlendMaxValue - temp_output_7_0_g79914 );
			half Blend_Mask147_g79786 = ( saturate( ( ( clampResult17_g79913 - temp_output_7_0_g79914 ) / ( temp_output_10_0_g79914 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
			float2 lerpResult3376_g79786 = lerp( Main_Normal137_g79786 , temp_output_36_0_g79835 , Blend_Mask147_g79786);
			#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g79786 = lerpResult3376_g79786;
			#else
				float2 staticSwitch267_g79786 = Main_Normal137_g79786;
			#endif
			half2 Blend_Normal312_g79786 = staticSwitch267_g79786;
			half Global_OverlayNormalScale6581_g79786 = TVE_OverlayNormalValue;
			float temp_output_84_0_g79804 = _LayerExtrasValue;
			float temp_output_19_0_g79808 = TVE_ExtrasUsage[(int)temp_output_84_0_g79804];
			float4 temp_output_93_19_g79804 = TVE_ExtrasCoords;
			float3 WorldPosition3905_g79786 = i.vertexToFrag3890_g79786;
			float3 ObjectPosition4223_g79786 = i.vertexToFrag4224_g79786;
			float3 lerpResult4827_g79786 = lerp( WorldPosition3905_g79786 , ObjectPosition4223_g79786 , _ExtrasPositionMode);
			half2 UV96_g79804 = ( (temp_output_93_19_g79804).zw + ( (temp_output_93_19_g79804).xy * (lerpResult4827_g79786).xz ) );
			float4 tex2DArrayNode48_g79804 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g79804,temp_output_84_0_g79804), 0.0 );
			float4 temp_output_17_0_g79808 = tex2DArrayNode48_g79804;
			float4 temp_output_94_85_g79804 = TVE_ExtrasParams;
			float4 temp_output_3_0_g79808 = temp_output_94_85_g79804;
			float4 ifLocalVar18_g79808 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g79808 >= 0.5 )
				ifLocalVar18_g79808 = temp_output_17_0_g79808;
			else
				ifLocalVar18_g79808 = temp_output_3_0_g79808;
			float4 lerpResult22_g79808 = lerp( temp_output_3_0_g79808 , temp_output_17_0_g79808 , temp_output_19_0_g79808);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g79808 = lerpResult22_g79808;
			#else
				float4 staticSwitch24_g79808 = ifLocalVar18_g79808;
			#endif
			half4 Global_Extras_Params5440_g79786 = staticSwitch24_g79808;
			float4 break456_g79822 = Global_Extras_Params5440_g79786;
			half Global_Extras_Overlay156_g79786 = break456_g79822.z;
			half Overlay_Variation4560_g79786 = 1.0;
			half Overlay_Value5738_g79786 = ( _GlobalOverlay * Global_Extras_Overlay156_g79786 * Overlay_Variation4560_g79786 );
			float3 appendResult7377_g79786 = (float3(Blend_Normal312_g79786 , 1.0));
			half3 Blend_NormalWS7375_g79786 = (WorldNormalVector( i , appendResult7377_g79786 ));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			ase_vertexNormal = normalize( ase_vertexNormal );
			half Vertex_DynamicMode5112_g79786 = _VertexDynamicMode;
			float lerpResult7446_g79786 = lerp( (Blend_NormalWS7375_g79786).y , ase_vertexNormal.y , Vertex_DynamicMode5112_g79786);
			float lerpResult6757_g79786 = lerp( 1.0 , saturate( lerpResult7446_g79786 ) , _OverlayProjectionValue);
			half Overlay_Projection6081_g79786 = lerpResult6757_g79786;
			float4 tex2DNode29_g79786 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g79786 );
			float3 lerpResult6223_g79786 = lerp( float3( 1,1,1 ) , (tex2DNode29_g79786).rgb , _MainAlbedoValue);
			half3 Main_Albedo99_g79786 = ( (_MainColor).rgb * lerpResult6223_g79786 );
			float4 tex2DNode89_g79786 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g79786 );
			float3 lerpResult6225_g79786 = lerp( float3( 1,1,1 ) , (tex2DNode89_g79786).rgb , _SecondAlbedoValue);
			half3 Second_Albedo153_g79786 = ( (_SecondColor).rgb * lerpResult6225_g79786 );
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g79834 = 2.0;
			#else
				float staticSwitch1_g79834 = 4.594794;
			#endif
			float3 lerpResult4834_g79786 = lerp( ( Main_Albedo99_g79786 * Second_Albedo153_g79786 * staticSwitch1_g79834 ) , Second_Albedo153_g79786 , _DetailBlendMode);
			float3 lerpResult235_g79786 = lerp( Main_Albedo99_g79786 , lerpResult4834_g79786 , Blend_Mask147_g79786);
			#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g79786 = lerpResult235_g79786;
			#else
				float3 staticSwitch255_g79786 = Main_Albedo99_g79786;
			#endif
			half3 Blend_Albedo265_g79786 = staticSwitch255_g79786;
			half3 Tint_Gradient_Color5769_g79786 = float3(1,1,1);
			half3 Tint_Noise_Color5770_g79786 = float3(1,1,1);
			float3 temp_output_3_0_g79844 = ( Blend_Albedo265_g79786 * Tint_Gradient_Color5769_g79786 * Tint_Noise_Color5770_g79786 );
			float dotResult20_g79844 = dot( temp_output_3_0_g79844 , float3(0.2126,0.7152,0.0722) );
			float clampResult6740_g79786 = clamp( saturate( ( dotResult20_g79844 * 5.0 ) ) , 0.2 , 1.0 );
			half Blend_Albedo_Globals6410_g79786 = clampResult6740_g79786;
			half Overlay_Shading6688_g79786 = Blend_Albedo_Globals6410_g79786;
			half Overlay_Custom6707_g79786 = 1.0;
			half Occlusion_Alpha6463_g79786 = _VertexOcclusionColor.a;
			float Mesh_Occlusion318_g79786 = i.vertexColor.g;
			float clampResult17_g79845 = clamp( Mesh_Occlusion318_g79786 , 0.0001 , 0.9999 );
			float temp_output_7_0_g79855 = _VertexOcclusionMinValue;
			float temp_output_10_0_g79855 = ( _VertexOcclusionMaxValue - temp_output_7_0_g79855 );
			half Occlusion_Mask6432_g79786 = saturate( ( ( clampResult17_g79845 - temp_output_7_0_g79855 ) / ( temp_output_10_0_g79855 + 0.0001 ) ) );
			float lerpResult6467_g79786 = lerp( Occlusion_Alpha6463_g79786 , 1.0 , Occlusion_Mask6432_g79786);
			half Occlusion_Overlay6471_g79786 = lerpResult6467_g79786;
			float temp_output_7_0_g79853 = 0.1;
			float temp_output_10_0_g79853 = ( 0.2 - temp_output_7_0_g79853 );
			half Overlay_Mask_High6064_g79786 = saturate( ( ( ( Overlay_Value5738_g79786 * Overlay_Projection6081_g79786 * Overlay_Shading6688_g79786 * Overlay_Custom6707_g79786 * Occlusion_Overlay6471_g79786 ) - temp_output_7_0_g79853 ) / ( temp_output_10_0_g79853 + 0.0001 ) ) );
			half Overlay_Mask269_g79786 = Overlay_Mask_High6064_g79786;
			float lerpResult6585_g79786 = lerp( 1.0 , Global_OverlayNormalScale6581_g79786 , Overlay_Mask269_g79786);
			half2 Blend_Normal_Overlay366_g79786 = ( Blend_Normal312_g79786 * lerpResult6585_g79786 );
			half Global_WetnessNormalScale6571_g79786 = TVE_WetnessNormalValue;
			half Global_Extras_Wetness305_g79786 = break456_g79822.y;
			half Wetness_Value6343_g79786 = ( Global_Extras_Wetness305_g79786 * _GlobalWetness );
			float lerpResult6579_g79786 = lerp( 1.0 , Global_WetnessNormalScale6571_g79786 , ( Wetness_Value6343_g79786 * Wetness_Value6343_g79786 ));
			half2 Blend_Normal_Wetness6372_g79786 = ( Blend_Normal_Overlay366_g79786 * lerpResult6579_g79786 );
			float3 appendResult6568_g79786 = (float3(Blend_Normal_Wetness6372_g79786 , 1.0));
			float3 temp_output_13_0_g79823 = appendResult6568_g79786;
			float3 temp_output_33_0_g79823 = ( temp_output_13_0_g79823 * _render_normals );
			float3 switchResult12_g79823 = (((i.ASEIsFrontFacing>0)?(temp_output_13_0_g79823):(temp_output_33_0_g79823)));
			o.Normal = switchResult12_g79823;
			float3 lerpResult2945_g79786 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g79786);
			half3 Occlusion_Color648_g79786 = lerpResult2945_g79786;
			half3 Matcap_Color7428_g79786 = half3(0,0,0);
			half3 Blend_Albedo_Tinted2808_g79786 = ( ( Blend_Albedo265_g79786 * Tint_Gradient_Color5769_g79786 * Tint_Noise_Color5770_g79786 * Occlusion_Color648_g79786 ) + Matcap_Color7428_g79786 );
			half3 Blend_Albedo_Colored863_g79786 = Blend_Albedo_Tinted2808_g79786;
			half3 Global_OverlayColor1758_g79786 = (TVE_OverlayColor).rgb;
			float3 lerpResult336_g79786 = lerp( Blend_Albedo_Colored863_g79786 , Global_OverlayColor1758_g79786 , Overlay_Mask269_g79786);
			half3 Blend_Albedo_Overlay359_g79786 = lerpResult336_g79786;
			half Global_WetnessContrast6502_g79786 = TVE_WetnessContrast;
			float3 lerpResult6367_g79786 = lerp( Blend_Albedo_Overlay359_g79786 , ( Blend_Albedo_Overlay359_g79786 * Blend_Albedo_Overlay359_g79786 ) , ( Global_WetnessContrast6502_g79786 * Wetness_Value6343_g79786 ));
			half3 Blend_Albedo_Wetness6351_g79786 = lerpResult6367_g79786;
			float3 _Vector10 = float3(1,1,1);
			half3 Tint_Highlight_Color5771_g79786 = _Vector10;
			float3 temp_output_6309_0_g79786 = ( Blend_Albedo_Wetness6351_g79786 * Tint_Highlight_Color5771_g79786 );
			half3 Blend_Albedo_Subsurface149_g79786 = temp_output_6309_0_g79786;
			half3 Blend_Albedo_RimLight7316_g79786 = Blend_Albedo_Subsurface149_g79786;
			o.Albedo = Blend_Albedo_RimLight7316_g79786;
			half3 Emissive_Color7162_g79786 = (_EmissiveColor).rgb;
			half2 Emissive_UVs2468_g79786 = ( ( i.uv_texcoord.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
			float temp_output_7_0_g79912 = _EmissiveTexMinValue;
			float3 temp_cast_6 = (temp_output_7_0_g79912).xxx;
			float temp_output_10_0_g79912 = ( _EmissiveTexMaxValue - temp_output_7_0_g79912 );
			half3 Emissive_Texture7022_g79786 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g79786 )).rgb - temp_cast_6 ) / ( temp_output_10_0_g79912 + 0.0001 ) ) );
			half Global_Extras_Emissive4203_g79786 = break456_g79822.x;
			float lerpResult4206_g79786 = lerp( 1.0 , Global_Extras_Emissive4203_g79786 , _GlobalEmissive);
			half Emissive_Value7024_g79786 = ( ( lerpResult4206_g79786 * _EmissivePhaseValue ) - 1.0 );
			half3 Emissive_Mask6968_g79786 = saturate( ( Emissive_Texture7022_g79786 + Emissive_Value7024_g79786 ) );
			float3 temp_output_3_0_g79821 = ( Emissive_Color7162_g79786 * Emissive_Mask6968_g79786 );
			float temp_output_15_0_g79821 = _emissive_intensity_value;
			float3 temp_output_23_0_g79821 = ( temp_output_3_0_g79821 * temp_output_15_0_g79821 );
			half3 Final_Emissive2476_g79786 = temp_output_23_0_g79821;
			o.Emission = Final_Emissive2476_g79786;
			half Render_Specular4861_g79786 = _RenderSpecular;
			float3 temp_cast_7 = (( 0.04 * Render_Specular4861_g79786 )).xxx;
			o.Specular = temp_cast_7;
			half Main_Smoothness227_g79786 = ( tex2DNode35_g79786.a * _MainSmoothnessValue );
			half Second_Smoothness236_g79786 = ( tex2DNode33_g79786.a * _SecondSmoothnessValue );
			float lerpResult266_g79786 = lerp( Main_Smoothness227_g79786 , Second_Smoothness236_g79786 , Blend_Mask147_g79786);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g79786 = lerpResult266_g79786;
			#else
				float staticSwitch297_g79786 = Main_Smoothness227_g79786;
			#endif
			half Blend_Smoothness314_g79786 = staticSwitch297_g79786;
			half Global_OverlaySmoothness311_g79786 = TVE_OverlaySmoothness;
			float lerpResult343_g79786 = lerp( Blend_Smoothness314_g79786 , Global_OverlaySmoothness311_g79786 , Overlay_Mask269_g79786);
			half Blend_Smoothness_Overlay371_g79786 = lerpResult343_g79786;
			float temp_output_6499_0_g79786 = ( 1.0 - Wetness_Value6343_g79786 );
			half Blend_Smoothness_Wetness4130_g79786 = saturate( ( Blend_Smoothness_Overlay371_g79786 + ( 1.0 - ( temp_output_6499_0_g79786 * temp_output_6499_0_g79786 ) ) ) );
			o.Smoothness = Blend_Smoothness_Wetness4130_g79786;
			float lerpResult240_g79786 = lerp( 1.0 , tex2DNode35_g79786.g , _MainOcclusionValue);
			half Main_Occlusion247_g79786 = lerpResult240_g79786;
			float lerpResult239_g79786 = lerp( 1.0 , tex2DNode33_g79786.g , _SecondOcclusionValue);
			half Second_Occlusion251_g79786 = lerpResult239_g79786;
			float lerpResult294_g79786 = lerp( Main_Occlusion247_g79786 , Second_Occlusion251_g79786 , Blend_Mask147_g79786);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g79786 = lerpResult294_g79786;
			#else
				float staticSwitch310_g79786 = Main_Occlusion247_g79786;
			#endif
			half Blend_Occlusion323_g79786 = staticSwitch310_g79786;
			o.Occlusion = Blend_Occlusion323_g79786;
			float localCustomAlphaClip19_g79841 = ( 0.0 );
			half Main_Alpha316_g79786 = tex2DNode29_g79786.a;
			half Second_Alpha5007_g79786 = tex2DNode89_g79786.a;
			float lerpResult6153_g79786 = lerp( Main_Alpha316_g79786 , Second_Alpha5007_g79786 , Blend_Mask147_g79786);
			float lerpResult6785_g79786 = lerp( ( Main_Alpha316_g79786 * Second_Alpha5007_g79786 ) , lerpResult6153_g79786 , _DetailAlphaMode);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g79786 = lerpResult6785_g79786;
			#else
				float staticSwitch6158_g79786 = Main_Alpha316_g79786;
			#endif
			half Blend_Alpha6157_g79786 = staticSwitch6158_g79786;
			half AlphaTreshold2132_g79786 = _AlphaClipValue;
			half Global_Alpha315_g79786 = 1.0;
			half Fade_Effects_A5360_g79786 = 1.0;
			float3 ase_worldPos = i.worldPos;
			float temp_output_7_0_g79854 = TVE_CameraFadeMin;
			float temp_output_10_0_g79854 = ( TVE_CameraFadeMax - temp_output_7_0_g79854 );
			float lerpResult4755_g79786 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g79854 ) / ( temp_output_10_0_g79854 + 0.0001 ) ) ) ) , _FadeCameraValue);
			half Fade_Camera3743_g79786 = lerpResult4755_g79786;
			float lerpResult6866_g79786 = lerp( ( 1.0 - Blend_Mask147_g79786 ) , 1.0 , _DetailFadeMode);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g79786 = lerpResult6866_g79786;
			#else
				float staticSwitch6612_g79786 = 1.0;
			#endif
			half Blend_Mask_Invert6260_g79786 = staticSwitch6612_g79786;
			half Fade_Mask5149_g79786 = ( 1.0 * Blend_Mask_Invert6260_g79786 );
			float lerpResult5141_g79786 = lerp( 1.0 , ( ( Fade_Effects_A5360_g79786 * Fade_Camera3743_g79786 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g79786);
			half Fade_Effects_B6228_g79786 = lerpResult5141_g79786;
			float temp_output_5865_0_g79786 = saturate( ( Fade_Effects_B6228_g79786 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g79786 ) ).r ) );
			half Fade_Alpha3727_g79786 = temp_output_5865_0_g79786;
			float Emissive_Alpha6927_g79786 = 1.0;
			half Final_Alpha7344_g79786 = min( min( ( Blend_Alpha6157_g79786 - AlphaTreshold2132_g79786 ) , Global_Alpha315_g79786 ) , min( Fade_Alpha3727_g79786 , Emissive_Alpha6927_g79786 ) );
			float temp_output_3_0_g79841 = Final_Alpha7344_g79786;
			float Alpha19_g79841 = temp_output_3_0_g79841;
			float temp_output_15_0_g79841 = 0.01;
			float Treshold19_g79841 = temp_output_15_0_g79841;
			{
			#if defined (TVE_FEATURE_CLIP)
			#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
					clip(Alpha19_g79841 - Treshold19_g79841);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
					clip(Alpha19_g79841 - Treshold19_g79841);
				#endif
			#else
				clip(Alpha19_g79841 - Treshold19_g79841);
			#endif
			#endif
			}
			half Main_Color_Alpha6121_g79786 = _MainColor.a;
			half Second_Color_Alpha6152_g79786 = _SecondColor.a;
			float lerpResult6168_g79786 = lerp( Main_Color_Alpha6121_g79786 , Second_Color_Alpha6152_g79786 , Blend_Mask147_g79786);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g79786 = lerpResult6168_g79786;
			#else
				float staticSwitch6174_g79786 = Main_Color_Alpha6121_g79786;
			#endif
			half Blend_Color_Alpha6167_g79786 = staticSwitch6174_g79786;
			half Final_Clip914_g79786 = saturate( ( Alpha19_g79841 * Blend_Color_Alpha6167_g79786 ) );
			o.Alpha = Final_Clip914_g79786;
		}

		ENDCG
	}
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;238;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;239;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;240;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;241;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1280.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1280.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;285;-2176,384;Inherit;False;1280.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;848;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;242;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;372;-2176,512;Inherit;False;Define Pipeline Standard;-1;;79780;9af03ae8defe78d448ef2a4ef3601e12;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;847;-1920,512;Inherit;False;Define Lighting Standard;0;;79781;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;373;-1088,512;Inherit;False;Compile All Shaders;-1;;79783;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;374;-1280,512;Inherit;False;Compile Core;-1;;79784;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;360;-1152,-384;Float;False;True;-1;5;TVEShaderCoreGUI;0;0;StandardSpecular;BOXOPHOBIC/The Vegetation Engine/Default/Bark Standard Lit;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;True;Back;0;True;_render_zw;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;1;5;True;_render_src;10;True;_render_dst;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;243;-1;-1;-1;0;True;0;0;True;_render_cull;-1;0;False;;0;0;0;False;0.1;False;;0;True;_render_coverage;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.FunctionNode;850;-1664,512;Inherit;False;Define ShaderType Bark;244;;79785;ecaf18989da3f93409461e4ed9a37a9f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;871;-2176,-384;Inherit;False;Base Shader;2;;79786;856f7164d1c579d43a5cf4968a75ca43;93,7343,0,3880,1,4028,1,3900,1,3908,1,4172,1,4179,1,1298,1,6791,1,1300,1,6792,1,3586,0,4499,1,1708,0,6056,1,3509,1,3873,1,893,0,6230,0,5156,1,5345,0,6116,1,7566,1,1717,1,1715,1,1714,1,1718,1,5075,1,6592,1,6068,1,6076,1,6692,0,6729,1,1776,0,6378,1,6352,1,3475,1,6655,1,4210,1,1745,1,3479,0,1646,0,3501,0,2807,0,6206,0,7565,0,4999,0,6194,0,3887,0,7321,0,7332,0,3957,1,6647,0,6257,0,5357,0,2172,0,3883,0,3728,1,5350,0,2658,0,1742,0,3484,0,6848,1,6622,1,1737,1,1736,1,1735,1,6161,1,4837,1,1734,1,6320,1,6166,1,7429,0,7348,0,860,1,6721,1,2261,1,2260,1,2054,1,2032,1,5258,1,2062,0,2039,0,7548,1,7550,1,3243,0,5220,1,4217,1,6699,1,5339,0,4242,1,5090,1,7492,0;9;7333;FLOAT3;1,1,1;False;6196;FLOAT;1;False;6693;FLOAT;1;False;6201;FLOAT;1;False;6205;FLOAT;1;False;5143;FLOAT;1;False;6231;FLOAT;1;False;6198;FLOAT;1;False;5340;FLOAT3;0,0,0;False;23;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
WireConnection;360;0;871;0
WireConnection;360;1;871;528
WireConnection;360;2;871;2489
WireConnection;360;3;871;3678
WireConnection;360;4;871;530
WireConnection;360;5;871;531
WireConnection;360;9;871;532
WireConnection;360;11;871;534
ASEEND*/
//CHKSM=57A05889CB52ADC72BE298AC0AA66008250B1804
