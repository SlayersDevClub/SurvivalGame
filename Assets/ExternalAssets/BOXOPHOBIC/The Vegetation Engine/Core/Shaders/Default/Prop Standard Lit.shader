// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Default/Prop Standard Lit"
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
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
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
		_MainMetallicValue("Main Metallic", Range( 0 , 1)) = 0
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
		_SecondMetallicValue("Detail Metallic", Range( 0 , 1)) = 0
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
		[StyledSpace(10)]_SpaceMotionGlobals("# SpaceMotionGlobals", Float) = 0
		[StyledSpace(10)]_SpaceMotionLocals("# SpaceMotionLocals", Float) = 0
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
		[HideInInspector]_IsPropShader("_IsPropShader", Float) = 1
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
		#define TVE_IS_PROP_SHADER
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE3D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE3D(tex,samplerTex,coord) tex3D(tex,coord)
		#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
		#endif//ASE Sampling Macros

		#pragma surface surf Standard keepalpha addshadow fullforwardshadows dithercrossfade vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float4 uv_texcoord;
			float2 vertexToFrag11_g76778;
			float3 worldPos;
			float4 vertexColor : COLOR;
			float3 worldNormal;
			INTERNAL_DATA
			float3 vertexToFrag3890_g76748;
			float3 vertexToFrag4224_g76748;
			half ASEIsFrontFacing : VFACE;
		};

		uniform half _render_cull;
		uniform half _render_src;
		uniform half _render_dst;
		uniform half _render_zw;
		uniform half _render_coverage;
		uniform half _IsStandardShader;
		uniform float _IsPropShader;
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
		uniform half _DisableSRPBatcher;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
		uniform half4 _MainUVs;
		SamplerState sampler_Linear_Repeat;
		uniform half _MainNormalValue;
		uniform half _DetailNormalValue;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
		uniform half4 _second_uvs_mode;
		uniform float3 TVE_WorldOrigin;
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
		uniform half _VertexPivotMode;
		uniform half _ExtrasPositionMode;
		SamplerState sampler_Linear_Clamp;
		uniform half4 TVE_ExtrasParams;
		uniform half _VertexDynamicMode;
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
		uniform half _MainMetallicValue;
		uniform half _SecondMetallicValue;
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

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VertexPosition3588_g76748 = ase_vertex3Pos;
			float3 Final_VertexPosition890_g76748 = ( VertexPosition3588_g76748 + _DisableSRPBatcher );
			v.vertex.xyz = Final_VertexPosition890_g76748;
			v.vertex.w = 1;
			float4 break33_g76779 = _second_uvs_mode;
			float2 temp_output_30_0_g76779 = ( v.texcoord.xy * break33_g76779.x );
			float2 appendResult21_g76872 = (float2(v.texcoord1.z , v.texcoord1.w));
			float2 Mesh_DetailCoord3_g76748 = appendResult21_g76872;
			float2 temp_output_29_0_g76779 = ( Mesh_DetailCoord3_g76748 * break33_g76779.y );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 vertexToFrag3890_g76748 = ase_worldPos;
			float3 WorldPosition3905_g76748 = vertexToFrag3890_g76748;
			float3 WorldPosition_Shifted7477_g76748 = ( WorldPosition3905_g76748 - TVE_WorldOrigin );
			float2 temp_output_31_0_g76779 = ( (WorldPosition_Shifted7477_g76748).xz * break33_g76779.z );
			o.vertexToFrag11_g76778 = ( ( ( temp_output_30_0_g76779 + temp_output_29_0_g76779 + temp_output_31_0_g76779 ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
			o.vertexToFrag3890_g76748 = ase_worldPos;
			float4x4 break19_g76824 = unity_ObjectToWorld;
			float3 appendResult20_g76824 = (float3(break19_g76824[ 0 ][ 3 ] , break19_g76824[ 1 ][ 3 ] , break19_g76824[ 2 ][ 3 ]));
			float3 appendResult60_g76758 = (float3(v.texcoord3.x , v.texcoord3.z , v.texcoord3.y));
			half3 Mesh_PivotsData2831_g76748 = ( appendResult60_g76758 * _VertexPivotMode );
			float3 temp_output_122_0_g76824 = Mesh_PivotsData2831_g76748;
			float3 PivotsOnly105_g76824 = (mul( unity_ObjectToWorld, float4( temp_output_122_0_g76824 , 0.0 ) ).xyz).xyz;
			half3 ObjectData20_g76826 = ( appendResult20_g76824 + PivotsOnly105_g76824 );
			half3 WorldData19_g76826 = ase_worldPos;
			#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76826 = WorldData19_g76826;
			#else
				float3 staticSwitch14_g76826 = ObjectData20_g76826;
			#endif
			float3 temp_output_114_0_g76824 = staticSwitch14_g76826;
			o.vertexToFrag4224_g76748 = temp_output_114_0_g76824;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			half2 Main_UVs15_g76748 = ( ( i.uv_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
			half4 Normal_Packed45_g76776 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76748 );
			float2 appendResult58_g76776 = (float2(( (Normal_Packed45_g76776).x * (Normal_Packed45_g76776).w ) , (Normal_Packed45_g76776).y));
			half2 Normal_Default50_g76776 = appendResult58_g76776;
			half2 Normal_ASTC41_g76776 = (Normal_Packed45_g76776).xy;
			#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76776 = Normal_ASTC41_g76776;
			#else
				float2 staticSwitch38_g76776 = Normal_Default50_g76776;
			#endif
			half2 Normal_NO_DTX544_g76776 = (Normal_Packed45_g76776).wy;
			#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76776 = Normal_NO_DTX544_g76776;
			#else
				float2 staticSwitch37_g76776 = staticSwitch38_g76776;
			#endif
			float2 temp_output_6555_0_g76748 = ( (staticSwitch37_g76776*2.0 + -1.0) * _MainNormalValue );
			half2 Main_Normal137_g76748 = temp_output_6555_0_g76748;
			float2 lerpResult3372_g76748 = lerp( float2( 0,0 ) , Main_Normal137_g76748 , _DetailNormalValue);
			half2 Second_UVs17_g76748 = i.vertexToFrag11_g76778;
			half4 Normal_Packed45_g76777 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76748 );
			float2 appendResult58_g76777 = (float2(( (Normal_Packed45_g76777).x * (Normal_Packed45_g76777).w ) , (Normal_Packed45_g76777).y));
			half2 Normal_Default50_g76777 = appendResult58_g76777;
			half2 Normal_ASTC41_g76777 = (Normal_Packed45_g76777).xy;
			#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76777 = Normal_ASTC41_g76777;
			#else
				float2 staticSwitch38_g76777 = Normal_Default50_g76777;
			#endif
			half2 Normal_NO_DTX544_g76777 = (Normal_Packed45_g76777).wy;
			#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76777 = Normal_NO_DTX544_g76777;
			#else
				float2 staticSwitch37_g76777 = staticSwitch38_g76777;
			#endif
			half2 Second_Normal179_g76748 = ( (staticSwitch37_g76777*2.0 + -1.0) * _SecondNormalValue );
			float2 temp_output_36_0_g76797 = ( lerpResult3372_g76748 + Second_Normal179_g76748 );
			float4 tex2DNode35_g76748 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76748 );
			half Main_Mask57_g76748 = tex2DNode35_g76748.b;
			float4 tex2DNode33_g76748 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76748 );
			half Second_Mask81_g76748 = tex2DNode33_g76748.b;
			float lerpResult6885_g76748 = lerp( Main_Mask57_g76748 , Second_Mask81_g76748 , _DetailMaskMode);
			float clampResult17_g76858 = clamp( lerpResult6885_g76748 , 0.0001 , 0.9999 );
			float temp_output_7_0_g76857 = _DetailMaskMinValue;
			float temp_output_10_0_g76857 = ( _DetailMaskMaxValue - temp_output_7_0_g76857 );
			half Blend_Mask_Texture6794_g76748 = saturate( ( ( clampResult17_g76858 - temp_output_7_0_g76857 ) / ( temp_output_10_0_g76857 + 0.0001 ) ) );
			half Mesh_DetailMask90_g76748 = i.vertexColor.b;
			float3 appendResult7388_g76748 = (float3(temp_output_6555_0_g76748 , 1.0));
			half3 Main_NormalWS7390_g76748 = (WorldNormalVector( i , appendResult7388_g76748 ));
			float lerpResult6884_g76748 = lerp( Mesh_DetailMask90_g76748 , ((Main_NormalWS7390_g76748).y*0.5 + 0.5) , _DetailMeshMode);
			float clampResult17_g76856 = clamp( lerpResult6884_g76748 , 0.0001 , 0.9999 );
			float temp_output_7_0_g76855 = _DetailMeshMinValue;
			float temp_output_10_0_g76855 = ( _DetailMeshMaxValue - temp_output_7_0_g76855 );
			half Blend_Mask_Mesh1540_g76748 = saturate( ( ( clampResult17_g76856 - temp_output_7_0_g76855 ) / ( temp_output_10_0_g76855 + 0.0001 ) ) );
			float clampResult17_g76875 = clamp( ( Blend_Mask_Texture6794_g76748 * Blend_Mask_Mesh1540_g76748 ) , 0.0001 , 0.9999 );
			float temp_output_7_0_g76876 = _DetailBlendMinValue;
			float temp_output_10_0_g76876 = ( _DetailBlendMaxValue - temp_output_7_0_g76876 );
			half Blend_Mask147_g76748 = ( saturate( ( ( clampResult17_g76875 - temp_output_7_0_g76876 ) / ( temp_output_10_0_g76876 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
			float2 lerpResult3376_g76748 = lerp( Main_Normal137_g76748 , temp_output_36_0_g76797 , Blend_Mask147_g76748);
			#ifdef TVE_FEATURE_DETAIL
				float2 staticSwitch267_g76748 = lerpResult3376_g76748;
			#else
				float2 staticSwitch267_g76748 = Main_Normal137_g76748;
			#endif
			half2 Blend_Normal312_g76748 = staticSwitch267_g76748;
			half Global_OverlayNormalScale6581_g76748 = TVE_OverlayNormalValue;
			float temp_output_84_0_g76766 = _LayerExtrasValue;
			float temp_output_19_0_g76770 = TVE_ExtrasUsage[(int)temp_output_84_0_g76766];
			float4 temp_output_93_19_g76766 = TVE_ExtrasCoords;
			float3 WorldPosition3905_g76748 = i.vertexToFrag3890_g76748;
			float3 ObjectPosition4223_g76748 = i.vertexToFrag4224_g76748;
			float3 lerpResult4827_g76748 = lerp( WorldPosition3905_g76748 , ObjectPosition4223_g76748 , _ExtrasPositionMode);
			half2 UV96_g76766 = ( (temp_output_93_19_g76766).zw + ( (temp_output_93_19_g76766).xy * (lerpResult4827_g76748).xz ) );
			float4 tex2DArrayNode48_g76766 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g76766,temp_output_84_0_g76766), 0.0 );
			float4 temp_output_17_0_g76770 = tex2DArrayNode48_g76766;
			float4 temp_output_94_85_g76766 = TVE_ExtrasParams;
			float4 temp_output_3_0_g76770 = temp_output_94_85_g76766;
			float4 ifLocalVar18_g76770 = 0;
			UNITY_BRANCH 
			if( temp_output_19_0_g76770 >= 0.5 )
				ifLocalVar18_g76770 = temp_output_17_0_g76770;
			else
				ifLocalVar18_g76770 = temp_output_3_0_g76770;
			float4 lerpResult22_g76770 = lerp( temp_output_3_0_g76770 , temp_output_17_0_g76770 , temp_output_19_0_g76770);
			#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76770 = lerpResult22_g76770;
			#else
				float4 staticSwitch24_g76770 = ifLocalVar18_g76770;
			#endif
			half4 Global_Extras_Params5440_g76748 = staticSwitch24_g76770;
			float4 break456_g76784 = Global_Extras_Params5440_g76748;
			half Global_Extras_Overlay156_g76748 = break456_g76784.z;
			half Overlay_Variation4560_g76748 = 1.0;
			half Overlay_Value5738_g76748 = ( _GlobalOverlay * Global_Extras_Overlay156_g76748 * Overlay_Variation4560_g76748 );
			float3 appendResult7377_g76748 = (float3(Blend_Normal312_g76748 , 1.0));
			half3 Blend_NormalWS7375_g76748 = (WorldNormalVector( i , appendResult7377_g76748 ));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			ase_vertexNormal = normalize( ase_vertexNormal );
			half Vertex_DynamicMode5112_g76748 = _VertexDynamicMode;
			float lerpResult7446_g76748 = lerp( (Blend_NormalWS7375_g76748).y , ase_vertexNormal.y , Vertex_DynamicMode5112_g76748);
			float lerpResult6757_g76748 = lerp( 1.0 , saturate( lerpResult7446_g76748 ) , _OverlayProjectionValue);
			half Overlay_Projection6081_g76748 = lerpResult6757_g76748;
			float4 tex2DNode29_g76748 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76748 );
			float3 lerpResult6223_g76748 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76748).rgb , _MainAlbedoValue);
			half3 Main_Albedo99_g76748 = ( (_MainColor).rgb * lerpResult6223_g76748 );
			float4 tex2DNode89_g76748 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76748 );
			float3 lerpResult6225_g76748 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76748).rgb , _SecondAlbedoValue);
			half3 Second_Albedo153_g76748 = ( (_SecondColor).rgb * lerpResult6225_g76748 );
			#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76796 = 2.0;
			#else
				float staticSwitch1_g76796 = 4.594794;
			#endif
			float3 lerpResult4834_g76748 = lerp( ( Main_Albedo99_g76748 * Second_Albedo153_g76748 * staticSwitch1_g76796 ) , Second_Albedo153_g76748 , _DetailBlendMode);
			float3 lerpResult235_g76748 = lerp( Main_Albedo99_g76748 , lerpResult4834_g76748 , Blend_Mask147_g76748);
			#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g76748 = lerpResult235_g76748;
			#else
				float3 staticSwitch255_g76748 = Main_Albedo99_g76748;
			#endif
			half3 Blend_Albedo265_g76748 = staticSwitch255_g76748;
			half3 Tint_Gradient_Color5769_g76748 = float3(1,1,1);
			half3 Tint_Noise_Color5770_g76748 = float3(1,1,1);
			float3 temp_output_3_0_g76806 = ( Blend_Albedo265_g76748 * Tint_Gradient_Color5769_g76748 * Tint_Noise_Color5770_g76748 );
			float dotResult20_g76806 = dot( temp_output_3_0_g76806 , float3(0.2126,0.7152,0.0722) );
			float clampResult6740_g76748 = clamp( saturate( ( dotResult20_g76806 * 5.0 ) ) , 0.2 , 1.0 );
			half Blend_Albedo_Globals6410_g76748 = clampResult6740_g76748;
			half Overlay_Shading6688_g76748 = Blend_Albedo_Globals6410_g76748;
			half Overlay_Custom6707_g76748 = 1.0;
			half Occlusion_Alpha6463_g76748 = _VertexOcclusionColor.a;
			float Mesh_Occlusion318_g76748 = i.vertexColor.g;
			float clampResult17_g76807 = clamp( Mesh_Occlusion318_g76748 , 0.0001 , 0.9999 );
			float temp_output_7_0_g76817 = _VertexOcclusionMinValue;
			float temp_output_10_0_g76817 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76817 );
			half Occlusion_Mask6432_g76748 = saturate( ( ( clampResult17_g76807 - temp_output_7_0_g76817 ) / ( temp_output_10_0_g76817 + 0.0001 ) ) );
			float lerpResult6467_g76748 = lerp( Occlusion_Alpha6463_g76748 , 1.0 , Occlusion_Mask6432_g76748);
			half Occlusion_Overlay6471_g76748 = lerpResult6467_g76748;
			float temp_output_7_0_g76815 = 0.1;
			float temp_output_10_0_g76815 = ( 0.2 - temp_output_7_0_g76815 );
			half Overlay_Mask_High6064_g76748 = saturate( ( ( ( Overlay_Value5738_g76748 * Overlay_Projection6081_g76748 * Overlay_Shading6688_g76748 * Overlay_Custom6707_g76748 * Occlusion_Overlay6471_g76748 ) - temp_output_7_0_g76815 ) / ( temp_output_10_0_g76815 + 0.0001 ) ) );
			half Overlay_Mask269_g76748 = Overlay_Mask_High6064_g76748;
			float lerpResult6585_g76748 = lerp( 1.0 , Global_OverlayNormalScale6581_g76748 , Overlay_Mask269_g76748);
			half2 Blend_Normal_Overlay366_g76748 = ( Blend_Normal312_g76748 * lerpResult6585_g76748 );
			half Global_WetnessNormalScale6571_g76748 = TVE_WetnessNormalValue;
			half Global_Extras_Wetness305_g76748 = break456_g76784.y;
			half Wetness_Value6343_g76748 = ( Global_Extras_Wetness305_g76748 * _GlobalWetness );
			float lerpResult6579_g76748 = lerp( 1.0 , Global_WetnessNormalScale6571_g76748 , ( Wetness_Value6343_g76748 * Wetness_Value6343_g76748 ));
			half2 Blend_Normal_Wetness6372_g76748 = ( Blend_Normal_Overlay366_g76748 * lerpResult6579_g76748 );
			float3 appendResult6568_g76748 = (float3(Blend_Normal_Wetness6372_g76748 , 1.0));
			float3 temp_output_13_0_g76785 = appendResult6568_g76748;
			float3 temp_output_33_0_g76785 = ( temp_output_13_0_g76785 * _render_normals );
			float3 switchResult12_g76785 = (((i.ASEIsFrontFacing>0)?(temp_output_13_0_g76785):(temp_output_33_0_g76785)));
			o.Normal = switchResult12_g76785;
			float3 lerpResult2945_g76748 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76748);
			half3 Occlusion_Color648_g76748 = lerpResult2945_g76748;
			half3 Matcap_Color7428_g76748 = half3(0,0,0);
			half3 Blend_Albedo_Tinted2808_g76748 = ( ( Blend_Albedo265_g76748 * Tint_Gradient_Color5769_g76748 * Tint_Noise_Color5770_g76748 * Occlusion_Color648_g76748 ) + Matcap_Color7428_g76748 );
			half3 Blend_Albedo_Colored863_g76748 = Blend_Albedo_Tinted2808_g76748;
			half3 Global_OverlayColor1758_g76748 = (TVE_OverlayColor).rgb;
			float3 lerpResult336_g76748 = lerp( Blend_Albedo_Colored863_g76748 , Global_OverlayColor1758_g76748 , Overlay_Mask269_g76748);
			half3 Blend_Albedo_Overlay359_g76748 = lerpResult336_g76748;
			half Global_WetnessContrast6502_g76748 = TVE_WetnessContrast;
			float3 lerpResult6367_g76748 = lerp( Blend_Albedo_Overlay359_g76748 , ( Blend_Albedo_Overlay359_g76748 * Blend_Albedo_Overlay359_g76748 ) , ( Global_WetnessContrast6502_g76748 * Wetness_Value6343_g76748 ));
			half3 Blend_Albedo_Wetness6351_g76748 = lerpResult6367_g76748;
			float3 _Vector10 = float3(1,1,1);
			half3 Tint_Highlight_Color5771_g76748 = _Vector10;
			float3 temp_output_6309_0_g76748 = ( Blend_Albedo_Wetness6351_g76748 * Tint_Highlight_Color5771_g76748 );
			half3 Blend_Albedo_Subsurface149_g76748 = temp_output_6309_0_g76748;
			half3 Blend_Albedo_RimLight7316_g76748 = Blend_Albedo_Subsurface149_g76748;
			o.Albedo = Blend_Albedo_RimLight7316_g76748;
			half3 Emissive_Color7162_g76748 = (_EmissiveColor).rgb;
			half2 Emissive_UVs2468_g76748 = ( ( i.uv_texcoord.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
			float temp_output_7_0_g76874 = _EmissiveTexMinValue;
			float3 temp_cast_6 = (temp_output_7_0_g76874).xxx;
			float temp_output_10_0_g76874 = ( _EmissiveTexMaxValue - temp_output_7_0_g76874 );
			half3 Emissive_Texture7022_g76748 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76748 )).rgb - temp_cast_6 ) / ( temp_output_10_0_g76874 + 0.0001 ) ) );
			half Global_Extras_Emissive4203_g76748 = break456_g76784.x;
			float lerpResult4206_g76748 = lerp( 1.0 , Global_Extras_Emissive4203_g76748 , _GlobalEmissive);
			half Emissive_Value7024_g76748 = ( ( lerpResult4206_g76748 * _EmissivePhaseValue ) - 1.0 );
			half3 Emissive_Mask6968_g76748 = saturate( ( Emissive_Texture7022_g76748 + Emissive_Value7024_g76748 ) );
			float3 temp_output_3_0_g76783 = ( Emissive_Color7162_g76748 * Emissive_Mask6968_g76748 );
			float temp_output_15_0_g76783 = _emissive_intensity_value;
			float3 temp_output_23_0_g76783 = ( temp_output_3_0_g76783 * temp_output_15_0_g76783 );
			half3 Final_Emissive2476_g76748 = temp_output_23_0_g76783;
			o.Emission = Final_Emissive2476_g76748;
			half Main_Metallic237_g76748 = ( tex2DNode35_g76748.r * _MainMetallicValue );
			half Second_Metallic226_g76748 = ( tex2DNode33_g76748.r * _SecondMetallicValue );
			float lerpResult278_g76748 = lerp( Main_Metallic237_g76748 , Second_Metallic226_g76748 , Blend_Mask147_g76748);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch299_g76748 = lerpResult278_g76748;
			#else
				float staticSwitch299_g76748 = Main_Metallic237_g76748;
			#endif
			half Blend_Metallic306_g76748 = staticSwitch299_g76748;
			float lerpResult342_g76748 = lerp( Blend_Metallic306_g76748 , 0.0 , Overlay_Mask269_g76748);
			half Blend_Metallic_Overlay367_g76748 = lerpResult342_g76748;
			o.Metallic = Blend_Metallic_Overlay367_g76748;
			half Main_Smoothness227_g76748 = ( tex2DNode35_g76748.a * _MainSmoothnessValue );
			half Second_Smoothness236_g76748 = ( tex2DNode33_g76748.a * _SecondSmoothnessValue );
			float lerpResult266_g76748 = lerp( Main_Smoothness227_g76748 , Second_Smoothness236_g76748 , Blend_Mask147_g76748);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g76748 = lerpResult266_g76748;
			#else
				float staticSwitch297_g76748 = Main_Smoothness227_g76748;
			#endif
			half Blend_Smoothness314_g76748 = staticSwitch297_g76748;
			half Global_OverlaySmoothness311_g76748 = TVE_OverlaySmoothness;
			float lerpResult343_g76748 = lerp( Blend_Smoothness314_g76748 , Global_OverlaySmoothness311_g76748 , Overlay_Mask269_g76748);
			half Blend_Smoothness_Overlay371_g76748 = lerpResult343_g76748;
			float temp_output_6499_0_g76748 = ( 1.0 - Wetness_Value6343_g76748 );
			half Blend_Smoothness_Wetness4130_g76748 = saturate( ( Blend_Smoothness_Overlay371_g76748 + ( 1.0 - ( temp_output_6499_0_g76748 * temp_output_6499_0_g76748 ) ) ) );
			o.Smoothness = Blend_Smoothness_Wetness4130_g76748;
			float lerpResult240_g76748 = lerp( 1.0 , tex2DNode35_g76748.g , _MainOcclusionValue);
			half Main_Occlusion247_g76748 = lerpResult240_g76748;
			float lerpResult239_g76748 = lerp( 1.0 , tex2DNode33_g76748.g , _SecondOcclusionValue);
			half Second_Occlusion251_g76748 = lerpResult239_g76748;
			float lerpResult294_g76748 = lerp( Main_Occlusion247_g76748 , Second_Occlusion251_g76748 , Blend_Mask147_g76748);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g76748 = lerpResult294_g76748;
			#else
				float staticSwitch310_g76748 = Main_Occlusion247_g76748;
			#endif
			half Blend_Occlusion323_g76748 = staticSwitch310_g76748;
			o.Occlusion = Blend_Occlusion323_g76748;
			float localCustomAlphaClip19_g76803 = ( 0.0 );
			half Main_Alpha316_g76748 = tex2DNode29_g76748.a;
			half Second_Alpha5007_g76748 = tex2DNode89_g76748.a;
			float lerpResult6153_g76748 = lerp( Main_Alpha316_g76748 , Second_Alpha5007_g76748 , Blend_Mask147_g76748);
			float lerpResult6785_g76748 = lerp( ( Main_Alpha316_g76748 * Second_Alpha5007_g76748 ) , lerpResult6153_g76748 , _DetailAlphaMode);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6158_g76748 = lerpResult6785_g76748;
			#else
				float staticSwitch6158_g76748 = Main_Alpha316_g76748;
			#endif
			half Blend_Alpha6157_g76748 = staticSwitch6158_g76748;
			half AlphaTreshold2132_g76748 = _AlphaClipValue;
			half Global_Alpha315_g76748 = 1.0;
			half Fade_Effects_A5360_g76748 = 1.0;
			float3 ase_worldPos = i.worldPos;
			float temp_output_7_0_g76816 = TVE_CameraFadeMin;
			float temp_output_10_0_g76816 = ( TVE_CameraFadeMax - temp_output_7_0_g76816 );
			float lerpResult4755_g76748 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76816 ) / ( temp_output_10_0_g76816 + 0.0001 ) ) ) ) , _FadeCameraValue);
			half Fade_Camera3743_g76748 = lerpResult4755_g76748;
			float lerpResult6866_g76748 = lerp( ( 1.0 - Blend_Mask147_g76748 ) , 1.0 , _DetailFadeMode);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6612_g76748 = lerpResult6866_g76748;
			#else
				float staticSwitch6612_g76748 = 1.0;
			#endif
			half Blend_Mask_Invert6260_g76748 = staticSwitch6612_g76748;
			half Fade_Mask5149_g76748 = ( 1.0 * Blend_Mask_Invert6260_g76748 );
			float lerpResult5141_g76748 = lerp( 1.0 , ( ( Fade_Effects_A5360_g76748 * Fade_Camera3743_g76748 ) * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76748);
			half Fade_Effects_B6228_g76748 = lerpResult5141_g76748;
			float temp_output_5865_0_g76748 = saturate( ( Fade_Effects_B6228_g76748 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76748 ) ).r ) );
			half Fade_Alpha3727_g76748 = temp_output_5865_0_g76748;
			float Emissive_Alpha6927_g76748 = 1.0;
			half Final_Alpha7344_g76748 = min( min( ( Blend_Alpha6157_g76748 - AlphaTreshold2132_g76748 ) , Global_Alpha315_g76748 ) , min( Fade_Alpha3727_g76748 , Emissive_Alpha6927_g76748 ) );
			float temp_output_3_0_g76803 = Final_Alpha7344_g76748;
			float Alpha19_g76803 = temp_output_3_0_g76803;
			float temp_output_15_0_g76803 = 0.01;
			float Treshold19_g76803 = temp_output_15_0_g76803;
			{
			#if defined (TVE_FEATURE_CLIP)
			#if defined (TVE_IS_HD_PIPELINE)
				#if !defined (SHADERPASS_FORWARD_BYPASS_ALPHA_TEST)
					clip(Alpha19_g76803 - Treshold19_g76803);
				#endif
				#if !defined (SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
					clip(Alpha19_g76803 - Treshold19_g76803);
				#endif
			#else
				clip(Alpha19_g76803 - Treshold19_g76803);
			#endif
			#endif
			}
			half Main_Color_Alpha6121_g76748 = _MainColor.a;
			half Second_Color_Alpha6152_g76748 = _SecondColor.a;
			float lerpResult6168_g76748 = lerp( Main_Color_Alpha6121_g76748 , Second_Color_Alpha6152_g76748 , Blend_Mask147_g76748);
			#ifdef TVE_FEATURE_DETAIL
				float staticSwitch6174_g76748 = lerpResult6168_g76748;
			#else
				float staticSwitch6174_g76748 = Main_Color_Alpha6121_g76748;
			#endif
			half Blend_Color_Alpha6167_g76748 = staticSwitch6174_g76748;
			half Final_Clip914_g76748 = saturate( ( Alpha19_g76803 * Blend_Color_Alpha6167_g76748 ) );
			o.Alpha = Final_Clip914_g76748;
		}

		ENDCG
	}
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.CommentaryNode;340;-2176,384;Inherit;False;1280.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1281.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1278.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;236;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;237;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;238;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;239;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;397;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;240;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;384;-2176,512;Inherit;False;Define Pipeline Standard;-1;;76742;9af03ae8defe78d448ef2a4ef3601e12;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;812;-1920,512;Inherit;False;Define Lighting Standard;242;;76743;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;386;-1088,512;Inherit;False;Compile All Shaders;-1;;76745;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;387;-1280,512;Inherit;False;Compile Core;-1;;76746;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;383;-1152,-384;Float;False;True;-1;5;TVEShaderCoreGUI;0;0;Standard;BOXOPHOBIC/The Vegetation Engine/Default/Prop Standard Lit;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;True;Back;0;True;_render_zw;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;True;0;True;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;1;0;True;_render_src;0;True;_render_dst;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;241;-1;-1;-1;0;False;0;0;True;_render_cull;-1;0;False;;0;0;0;False;0.1;False;;0;True;_render_coverage;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.FunctionNode;813;-1664,512;Inherit;False;Define ShaderType Prop;244;;76747;96e31a47d32deff49ba83d5b364f536d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;811;-2176,-384;Inherit;False;Base Shader;0;;76748;856f7164d1c579d43a5cf4968a75ca43;93,7343,0,3880,1,4028,1,3900,1,3908,1,4172,1,4179,1,1298,1,6791,1,1300,1,6792,1,3586,0,4499,0,1708,0,6056,1,3509,1,3873,1,893,0,6230,0,5156,1,5345,0,6116,1,7566,1,1717,1,1715,1,1714,1,1718,1,5075,1,6592,1,6068,1,6076,1,6692,0,6729,1,1776,0,6378,1,6352,1,3475,1,6655,1,4210,1,1745,0,3479,0,1646,0,3501,0,2807,0,6206,0,7565,0,4999,0,6194,0,3887,0,7321,0,7332,0,3957,1,6647,0,6257,0,5357,0,2172,0,3883,0,3728,1,5350,0,2658,0,1742,0,3484,0,6848,1,6622,1,1737,1,1736,1,1735,1,6161,1,4837,1,1734,1,6320,1,6166,1,7429,0,7348,0,860,0,6721,0,2261,1,2260,1,2054,1,2032,1,5258,0,2062,1,2039,1,7548,1,7550,1,3243,0,5220,0,4217,1,6699,1,5339,0,4242,0,5090,1,7492,0;9;7333;FLOAT3;1,1,1;False;6196;FLOAT;1;False;6693;FLOAT;1;False;6201;FLOAT;1;False;6205;FLOAT;1;False;5143;FLOAT;1;False;6231;FLOAT;1;False;6198;FLOAT;1;False;5340;FLOAT3;0,0,0;False;23;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
WireConnection;383;0;811;0
WireConnection;383;1;811;528
WireConnection;383;2;811;2489
WireConnection;383;3;811;529
WireConnection;383;4;811;530
WireConnection;383;5;811;531
WireConnection;383;9;811;532
WireConnection;383;11;811;534
ASEEND*/
//CHKSM=9C689E933FF1E5E12A8C1475B4D7658687544CF6
