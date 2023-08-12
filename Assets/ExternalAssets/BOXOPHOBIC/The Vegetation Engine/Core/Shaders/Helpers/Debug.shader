// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/BOXOPHOBIC/The Vegetation Engine/Helpers/Debug"
{
	Properties
	{
		[StyledBanner(Debug)]_Banner("Banner", Float) = 0
		_IsVertexShader("_IsVertexShader", Float) = 0
		_IsSimpleShader("_IsSimpleShader", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 0
		_IsStandardShader("_IsStandardShader", Float) = 0
		_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 0
		_IsPropShader("_IsPropShader", Float) = 0
		_IsBarkShader("_IsBarkShader", Float) = 0
		_IsImpostorShader("_IsImpostorShader", Float) = 0
		_IsCoreShader("_IsCoreShader", Float) = 0
		_IsPlantShader("_IsPlantShader", Float) = 0
		[NoScaleOffset]_MainNormalTex("_MainNormalTex", 2D) = "black" {}
		[NoScaleOffset]_EmissiveTex("_EmissiveTex", 2D) = "black" {}
		[NoScaleOffset]_SecondMaskTex("_SecondMaskTex", 2D) = "black" {}
		[NoScaleOffset]_SecondNormalTex("_SecondNormalTex", 2D) = "black" {}
		[NoScaleOffset]_SecondAlbedoTex("_SecondAlbedoTex", 2D) = "black" {}
		[NoScaleOffset]_MainAlbedoTex("_MainAlbedoTex", 2D) = "black" {}
		[NoScaleOffset]_MainMaskTex("_MainMaskTex", 2D) = "black" {}
		_RenderClip("_RenderClip", Float) = 0
		_IsElementShader("_IsElementShader", Float) = 0
		_IsHelperShader("_IsHelperShader", Float) = 0
		_Cutoff("_Cutoff", Float) = 0
		_DetailMode("_DetailMode", Float) = 0
		_EmissiveCat("_EmissiveCat", Float) = 0
		[HDR]_EmissiveColor("_EmissiveColor", Color) = (0,0,0,0)
		[HideInInspector][Enum(Single Pivot,0,Baked Pivots,1)]_VertexPivotMode("_VertexPivotMode", Float) = 0
		_IsBlanketShader("_IsBlanketShader", Float) = 0
		_IsPolygonalShader("_IsPolygonalShader", Float) = 0
		[IntRange]_MotionSpeed_10("Primary Speed", Range( 0 , 40)) = 40
		[IntRange]_MotionVariation_10("Primary Speed", Range( 0 , 40)) = 40
		_MotionScale_10("Primary Scale", Range( 0 , 20)) = 0
		[HideInInspector][StyledToggle]_VertexDynamicMode("Enable Dynamic Support", Float) = 0
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Enum(UV 0,0,Baked,1)]_DetailCoordMode("Detail Coord", Float) = 0
		[Space(10)][StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		_IsIdentifier("_IsIdentifier", Float) = 0
		_IsCollected("_IsCollected", Float) = 0
		_IsCustomShader("_IsCustomShader", Float) = 0
		[ASEEnd][StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0)]_Message("Message", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
		//[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		//[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		
		Tags { "RenderType"="Opaque" "Queue"="Geometry" "DisableBatching"="True" }
	LOD 0

		Cull Off
		AlphaToMask Off
		ZWrite On
		ZTest LEqual
		ColorMask RGBA
		
		Blend Off
		

		CGINCLUDE
		#pragma target 5.0

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

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
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
		ENDCG

		
		Pass
		{
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			Blend One Zero

			CGPROGRAM
			#define ASE_NO_AMBIENT 1
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
			#endif//ASE Sampling Macros
			

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(LIGHTMAP_ON) || (!defined(LIGHTMAP_ON) && SHADER_TARGET >= 30)
					float4 lmap : TEXCOORD0;
				#endif
				#if !defined(LIGHTMAP_ON) && UNITY_SHOULD_SAMPLE_SH
					half3 sh : TEXCOORD1;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float4 ase_color : COLOR;
				float4 ase_texcoord12 : TEXCOORD12;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform half _Banner;
			uniform half _Message;
			uniform half _IsTVEShader;
			uniform float _IsSimpleShader;
			uniform float _IsVertexShader;
			uniform half TVE_DEBUG_Type;
			uniform float _IsCollected;
			uniform float _IsBarkShader;
			uniform float _IsPlantShader;
			uniform float _IsPropShader;
			uniform float _IsCoreShader;
			uniform float _IsBlanketShader;
			uniform float _IsImpostorShader;
			uniform float _IsPolygonalShader;
			uniform float _IsStandardShader;
			uniform float _IsSubsurfaceShader;
			uniform float _IsCustomShader;
			uniform float _IsIdentifier;
			uniform half TVE_DEBUG_Index;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
			uniform half4 _MainUVs;
			SamplerState sampler_MainAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
			SamplerState sampler_MainNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
			SamplerState sampler_MainMaskTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
			uniform half _DetailCoordMode;
			uniform half4 _SecondUVs;
			SamplerState sampler_SecondAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
			SamplerState sampler_SecondNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
			SamplerState sampler_SecondMaskTex;
			uniform float _DetailMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
			uniform half4 _EmissiveUVs;
			SamplerState sampler_EmissiveTex;
			uniform float4 _EmissiveColor;
			uniform float _EmissiveCat;
			uniform half TVE_DEBUG_Min;
			uniform half TVE_DEBUG_Max;
			float4 _MainAlbedoTex_TexelSize;
			float4 _MainNormalTex_TexelSize;
			float4 _MainMaskTex_TexelSize;
			float4 _SecondAlbedoTex_TexelSize;
			float4 _SecondMaskTex_TexelSize;
			float4 _EmissiveTex_TexelSize;
			uniform float4 _MainAlbedoTex_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
			SamplerState samplerTVE_DEBUG_MipTex;
			uniform float4 _MainNormalTex_ST;
			uniform float4 _MainMaskTex_ST;
			uniform float4 _SecondAlbedoTex_ST;
			uniform float4 _SecondMaskTex_ST;
			uniform float4 _EmissiveTex_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_NoiseTex);
			uniform float _MotionScale_10;
			uniform half4 TVE_MotionParams;
			uniform half4 TVE_TimeParams;
			uniform float _MotionSpeed_10;
			uniform float _MotionVariation_10;
			uniform half _VertexPivotMode;
			uniform half _VertexDynamicMode;
			SamplerState sampler_Linear_Repeat;
			uniform half TVE_DEBUG_Layer;
			uniform float TVE_ColorsUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ColorsTex);
			uniform half4 TVE_ColorsCoords;
			SamplerState sampler_Linear_Clamp;
			uniform half4 TVE_ColorsParams;
			uniform float TVE_ExtrasUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_ExtrasParams;
			uniform float TVE_MotionUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_MotionTex);
			uniform half4 TVE_MotionCoords;
			uniform float TVE_VertexUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_VertexTex);
			uniform half4 TVE_VertexCoords;
			uniform half4 TVE_VertexParams;
			uniform half TVE_DEBUG_Filter;
			uniform half TVE_DEBUG_Clip;
			uniform float _RenderClip;
			uniform float _Cutoff;
			uniform float _IsElementShader;
			uniform float _IsHelperShader;


			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float Debug_Index464_g91117 = TVE_DEBUG_Index;
				float3 ifLocalVar40_g91123 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91123 = saturate( v.vertex.xyz );
				float3 ifLocalVar40_g91141 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91141 = v.normal;
				float3 ifLocalVar40_g91154 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91154 = v.tangent.xyz;
				float ifLocalVar40_g91138 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91138 = saturate( v.tangent.w );
				float ifLocalVar40_g91238 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91238 = v.ase_color.r;
				float ifLocalVar40_g91239 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91239 = v.ase_color.g;
				float ifLocalVar40_g91240 = 0;
				if( Debug_Index464_g91117 == 7.0 )
				ifLocalVar40_g91240 = v.ase_color.b;
				float ifLocalVar40_g91241 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91241 = v.ase_color.a;
				float3 appendResult1147_g91117 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
				float3 ifLocalVar40_g91248 = 0;
				if( Debug_Index464_g91117 == 9.0 )
				ifLocalVar40_g91248 = appendResult1147_g91117;
				float3 appendResult1148_g91117 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
				float3 ifLocalVar40_g91249 = 0;
				if( Debug_Index464_g91117 == 10.0 )
				ifLocalVar40_g91249 = appendResult1148_g91117;
				float3 appendResult1149_g91117 = (float3(v.texcoord1.xyzw.z , v.texcoord1.xyzw.w , 0.0));
				float3 ifLocalVar40_g91250 = 0;
				if( Debug_Index464_g91117 == 11.0 )
				ifLocalVar40_g91250 = appendResult1149_g91117;
				half3 Input_Position167_g91242 = float3( 0,0,0 );
				float dotResult156_g91242 = dot( (Input_Position167_g91242).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g91242 = 0.0;
				float Postion_Random162_g91242 = ( sin( dotResult156_g91242 ) * ( 1.0 - Input_DynamicMode120_g91242 ) );
				half Input_Variation124_g91242 = v.ase_color.r;
				half ObjectData20_g91244 = frac( ( Postion_Random162_g91242 + Input_Variation124_g91242 ) );
				half WorldData19_g91244 = Input_Variation124_g91242;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g91244 = WorldData19_g91244;
				#else
				float staticSwitch14_g91244 = ObjectData20_g91244;
				#endif
				float temp_output_112_0_g91242 = staticSwitch14_g91244;
				float clampResult171_g91242 = clamp( temp_output_112_0_g91242 , 0.01 , 0.99 );
				float ifLocalVar40_g91251 = 0;
				if( Debug_Index464_g91117 == 12.0 )
				ifLocalVar40_g91251 = clampResult171_g91242;
				float ifLocalVar40_g91252 = 0;
				if( Debug_Index464_g91117 == 13.0 )
				ifLocalVar40_g91252 = v.ase_color.g;
				float ifLocalVar40_g91253 = 0;
				if( Debug_Index464_g91117 == 14.0 )
				ifLocalVar40_g91253 = v.ase_color.b;
				float ifLocalVar40_g91254 = 0;
				if( Debug_Index464_g91117 == 15.0 )
				ifLocalVar40_g91254 = v.ase_color.a;
				half3 Input_Position167_g91259 = float3( 0,0,0 );
				float dotResult156_g91259 = dot( (Input_Position167_g91259).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g91259 = 0.0;
				float Postion_Random162_g91259 = ( sin( dotResult156_g91259 ) * ( 1.0 - Input_DynamicMode120_g91259 ) );
				half Input_Variation124_g91259 = v.ase_color.r;
				half ObjectData20_g91261 = frac( ( Postion_Random162_g91259 + Input_Variation124_g91259 ) );
				half WorldData19_g91261 = Input_Variation124_g91259;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g91261 = WorldData19_g91261;
				#else
				float staticSwitch14_g91261 = ObjectData20_g91261;
				#endif
				float temp_output_112_0_g91259 = staticSwitch14_g91261;
				float clampResult171_g91259 = clamp( temp_output_112_0_g91259 , 0.01 , 0.99 );
				float temp_output_1451_19_g91117 = clampResult171_g91259;
				float3 temp_cast_0 = (temp_output_1451_19_g91117).xxx;
				float3 hsvTorgb260_g91117 = HSVToRGB( float3(temp_output_1451_19_g91117,1.0,1.0) );
				float3 gammaToLinear266_g91117 = GammaToLinearSpace( hsvTorgb260_g91117 );
				float _IsBarkShader347_g91117 = _IsBarkShader;
				float _IsPlantShader360_g91117 = _IsPlantShader;
				float _IsAnyVegetationShader362_g91117 = saturate( ( _IsBarkShader347_g91117 + _IsPlantShader360_g91117 ) );
				float3 lerpResult290_g91117 = lerp( temp_cast_0 , gammaToLinear266_g91117 , _IsAnyVegetationShader362_g91117);
				float3 ifLocalVar40_g91255 = 0;
				if( Debug_Index464_g91117 == 16.0 )
				ifLocalVar40_g91255 = lerpResult290_g91117;
				float enc1154_g91117 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector21154_g91117 = DecodeFloatToVector2( enc1154_g91117 );
				float2 break1155_g91117 = localDecodeFloatToVector21154_g91117;
				float ifLocalVar40_g91256 = 0;
				if( Debug_Index464_g91117 == 17.0 )
				ifLocalVar40_g91256 = break1155_g91117.x;
				float ifLocalVar40_g91257 = 0;
				if( Debug_Index464_g91117 == 18.0 )
				ifLocalVar40_g91257 = break1155_g91117.y;
				float3 appendResult60_g91247 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				float3 ifLocalVar40_g91258 = 0;
				if( Debug_Index464_g91117 == 19.0 )
				ifLocalVar40_g91258 = appendResult60_g91247;
				float3 vertexToFrag328_g91117 = ( ( ifLocalVar40_g91123 + ifLocalVar40_g91141 + ifLocalVar40_g91154 + ifLocalVar40_g91138 ) + ( ifLocalVar40_g91238 + ifLocalVar40_g91239 + ifLocalVar40_g91240 + ifLocalVar40_g91241 ) + ( ifLocalVar40_g91248 + ifLocalVar40_g91249 + ifLocalVar40_g91250 ) + ( ifLocalVar40_g91251 + ifLocalVar40_g91252 + ifLocalVar40_g91253 + ifLocalVar40_g91254 ) + ( ifLocalVar40_g91255 + ifLocalVar40_g91256 + ifLocalVar40_g91257 + ifLocalVar40_g91258 ) );
				o.ase_texcoord12.xyz = vertexToFrag328_g91117;
				
				o.ase_texcoord9 = v.ase_texcoord;
				o.ase_texcoord10 = v.texcoord1.xyzw;
				o.ase_texcoord11 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord12.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
				o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				#ifdef LIGHTMAP_ON
				o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						#ifdef VERTEXLIGHT_ON
						o.sh += Shade4PointLights (
							unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
							unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
							unity_4LightAtten0, worldPos, worldNormal);
						#endif
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
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
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN , bool ase_vface : SV_IsFrontFace
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				float Debug_Type367_g91117 = TVE_DEBUG_Type;
				float4 color690_g91117 = IsGammaSpace() ? float4(0.25,0.25,0.25,0) : float4(0.05087609,0.05087609,0.05087609,0);
				float4 Shading_Inactive1492_g91117 = color690_g91117;
				float4 color646_g91117 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 color1359_g91117 = IsGammaSpace() ? float4(0,0.8683633,0.8862745,1) : float4(0,0.7262539,0.7605246,1);
				float _IsCollected1458_g91117 = _IsCollected;
				float4 lerpResult1360_g91117 = lerp( color646_g91117 , color1359_g91117 , _IsCollected1458_g91117);
				float _IsTVEShader647_g91117 = _IsTVEShader;
				float4 lerpResult1494_g91117 = lerp( Shading_Inactive1492_g91117 , lerpResult1360_g91117 , _IsTVEShader647_g91117);
				float dotResult1472_g91117 = dot( WorldNormal , worldViewDir );
				float temp_output_1526_0_g91117 = ( 1.0 - saturate( dotResult1472_g91117 ) );
				float Shading_Fresnel1469_g91117 = (( 1.0 - ( temp_output_1526_0_g91117 * temp_output_1526_0_g91117 ) )*0.3 + 0.7);
				float4 Output_Converted717_g91117 = ( lerpResult1494_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91301 = 0;
				if( Debug_Type367_g91117 == 0.0 )
				ifLocalVar40_g91301 = Output_Converted717_g91117;
				float4 color466_g91117 = IsGammaSpace() ? float4(0.8113208,0.4952317,0.264062,0) : float4(0.6231937,0.2096542,0.05668841,0);
				float _IsBarkShader347_g91117 = _IsBarkShader;
				float4 color472_g91117 = IsGammaSpace() ? float4(0.6196079,0.7686275,0.1490196,0) : float4(0.3419145,0.5520116,0.01938236,0);
				float _IsPlantShader360_g91117 = _IsPlantShader;
				float4 color478_g91117 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsPropShader346_g91117 = _IsPropShader;
				float4 lerpResult1502_g91117 = lerp( Shading_Inactive1492_g91117 , ( ( color466_g91117 * _IsBarkShader347_g91117 ) + ( color472_g91117 * _IsPlantShader360_g91117 ) + ( color478_g91117 * _IsPropShader346_g91117 ) ) , _IsTVEShader647_g91117);
				float4 Output_Shader445_g91117 = ( lerpResult1502_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91302 = 0;
				if( Debug_Type367_g91117 == 1.0 )
				ifLocalVar40_g91302 = Output_Shader445_g91117;
				float4 color1529_g91117 = IsGammaSpace() ? float4(0.9254902,0.7960784,0.4156863,1) : float4(0.8387991,0.5972018,0.1441285,1);
				float _IsCoreShader1551_g91117 = _IsCoreShader;
				float4 color1539_g91117 = IsGammaSpace() ? float4(0.6196079,0.7686275,0.1490196,0) : float4(0.3419145,0.5520116,0.01938236,0);
				float _IsBlanketShader1554_g91117 = _IsBlanketShader;
				float4 color1542_g91117 = IsGammaSpace() ? float4(0.9716981,0.3162602,0.4816265,0) : float4(0.9368213,0.08154967,0.1974273,0);
				float _IsImpostorShader1110_g91117 = _IsImpostorShader;
				float4 color1544_g91117 = IsGammaSpace() ? float4(0.3254902,0.6117647,0.8117647,0) : float4(0.08650047,0.3324516,0.6239604,0);
				float _IsPolygonalShader1112_g91117 = _IsPolygonalShader;
				float4 lerpResult1535_g91117 = lerp( Shading_Inactive1492_g91117 , ( ( color1529_g91117 * _IsCoreShader1551_g91117 ) + ( color1539_g91117 * _IsBlanketShader1554_g91117 ) + ( color1542_g91117 * _IsImpostorShader1110_g91117 ) + ( color1544_g91117 * _IsPolygonalShader1112_g91117 ) ) , _IsTVEShader647_g91117);
				float4 Output_Scope1531_g91117 = ( lerpResult1535_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91303 = 0;
				if( Debug_Type367_g91117 == 2.0 )
				ifLocalVar40_g91303 = Output_Scope1531_g91117;
				float4 color529_g91117 = IsGammaSpace() ? float4(0.62,0.77,0.15,0) : float4(0.3423916,0.5542217,0.01960665,0);
				float _IsVertexShader1158_g91117 = _IsVertexShader;
				float4 color544_g91117 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsSimpleShader359_g91117 = _IsSimpleShader;
				float4 color521_g91117 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsStandardShader344_g91117 = _IsStandardShader;
				float4 color1121_g91117 = IsGammaSpace() ? float4(0.9245283,0.8421515,0.1788003,0) : float4(0.8368256,0.677754,0.02687956,0);
				float _IsSubsurfaceShader548_g91117 = _IsSubsurfaceShader;
				float4 lerpResult1507_g91117 = lerp( Shading_Inactive1492_g91117 , ( ( color529_g91117 * _IsVertexShader1158_g91117 ) + ( color544_g91117 * _IsSimpleShader359_g91117 ) + ( color521_g91117 * _IsStandardShader344_g91117 ) + ( color1121_g91117 * _IsSubsurfaceShader548_g91117 ) ) , _IsTVEShader647_g91117);
				float4 Output_Lighting525_g91117 = ( lerpResult1507_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91304 = 0;
				if( Debug_Type367_g91117 == 3.0 )
				ifLocalVar40_g91304 = Output_Lighting525_g91117;
				float4 color1559_g91117 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 color1563_g91117 = IsGammaSpace() ? float4(0.972549,0.3176471,0.4823529,0) : float4(0.9386859,0.08228273,0.1980693,0);
				float _IsCustomShader1570_g91117 = _IsCustomShader;
				float4 lerpResult1561_g91117 = lerp( color1559_g91117 , color1563_g91117 , _IsCustomShader1570_g91117);
				float4 lerpResult1566_g91117 = lerp( Shading_Inactive1492_g91117 , lerpResult1561_g91117 , _IsTVEShader647_g91117);
				float4 Output_Custom1560_g91117 = ( lerpResult1566_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91305 = 0;
				if( Debug_Type367_g91117 == 4.0 )
				ifLocalVar40_g91305 = Output_Custom1560_g91117;
				float3 hsvTorgb1452_g91117 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
				float3 gammaToLinear1453_g91117 = GammaToLinearSpace( hsvTorgb1452_g91117 );
				float4 lerpResult1512_g91117 = lerp( Shading_Inactive1492_g91117 , float4( gammaToLinear1453_g91117 , 0.0 ) , _IsTVEShader647_g91117);
				float4 Output_Sharing1355_g91117 = lerpResult1512_g91117;
				float4 ifLocalVar40_g91306 = 0;
				if( Debug_Type367_g91117 == 5.0 )
				ifLocalVar40_g91306 = Output_Sharing1355_g91117;
				float Debug_Index464_g91117 = TVE_DEBUG_Index;
				half2 Main_UVs1219_g91117 = ( ( IN.ase_texcoord9.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode586_g91117 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g91117 );
				float3 appendResult637_g91117 = (float3(tex2DNode586_g91117.r , tex2DNode586_g91117.g , tex2DNode586_g91117.b));
				float3 ifLocalVar40_g91140 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91140 = appendResult637_g91117;
				float ifLocalVar40_g91145 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91145 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g91117 ).a;
				float4 tex2DNode604_g91117 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g91117 );
				float3 appendResult876_g91117 = (float3(tex2DNode604_g91117.a , tex2DNode604_g91117.g , 1.0));
				float3 gammaToLinear878_g91117 = GammaToLinearSpace( appendResult876_g91117 );
				float3 ifLocalVar40_g91175 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91175 = gammaToLinear878_g91117;
				float ifLocalVar40_g91126 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91126 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).r;
				float ifLocalVar40_g91208 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91208 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).g;
				float ifLocalVar40_g91146 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91146 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).b;
				float ifLocalVar40_g91124 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91124 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).a;
				float2 appendResult1251_g91117 = (float2(IN.ase_texcoord10.z , IN.ase_texcoord10.w));
				float2 Mesh_DetailCoord1254_g91117 = appendResult1251_g91117;
				float2 lerpResult1231_g91117 = lerp( IN.ase_texcoord9.xy , Mesh_DetailCoord1254_g91117 , _DetailCoordMode);
				half2 Second_UVs1234_g91117 = ( ( lerpResult1231_g91117 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode854_g91117 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs1234_g91117 );
				float3 appendResult839_g91117 = (float3(tex2DNode854_g91117.r , tex2DNode854_g91117.g , tex2DNode854_g91117.b));
				float3 ifLocalVar40_g91137 = 0;
				if( Debug_Index464_g91117 == 7.0 )
				ifLocalVar40_g91137 = appendResult839_g91117;
				float ifLocalVar40_g91153 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91153 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs1234_g91117 ).a;
				float4 tex2DNode841_g91117 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Second_UVs1234_g91117 );
				float3 appendResult880_g91117 = (float3(tex2DNode841_g91117.a , tex2DNode841_g91117.g , 1.0));
				float3 gammaToLinear879_g91117 = GammaToLinearSpace( appendResult880_g91117 );
				float3 ifLocalVar40_g91196 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91196 = gammaToLinear879_g91117;
				float ifLocalVar40_g91176 = 0;
				if( Debug_Index464_g91117 == 10.0 )
				ifLocalVar40_g91176 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).r;
				float ifLocalVar40_g91144 = 0;
				if( Debug_Index464_g91117 == 11.0 )
				ifLocalVar40_g91144 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).g;
				float ifLocalVar40_g91188 = 0;
				if( Debug_Index464_g91117 == 12.0 )
				ifLocalVar40_g91188 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).b;
				float ifLocalVar40_g91195 = 0;
				if( Debug_Index464_g91117 == 13.0 )
				ifLocalVar40_g91195 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).a;
				half2 Emissive_UVs1245_g91117 = ( ( IN.ase_texcoord9.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float4 tex2DNode858_g91117 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g91117 );
				float ifLocalVar40_g91143 = 0;
				if( Debug_Index464_g91117 == 14.0 )
				ifLocalVar40_g91143 = tex2DNode858_g91117.r;
				float Debug_Min721_g91117 = TVE_DEBUG_Min;
				float temp_output_7_0_g91182 = Debug_Min721_g91117;
				float4 temp_cast_3 = (temp_output_7_0_g91182).xxxx;
				float Debug_Max723_g91117 = TVE_DEBUG_Max;
				float temp_output_10_0_g91182 = ( Debug_Max723_g91117 - temp_output_7_0_g91182 );
				float4 Output_Maps561_g91117 = saturate( ( ( ( float4( ( ( ifLocalVar40_g91140 + ifLocalVar40_g91145 + ifLocalVar40_g91175 ) + ( ifLocalVar40_g91126 + ifLocalVar40_g91208 + ifLocalVar40_g91146 + ifLocalVar40_g91124 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g91137 + ifLocalVar40_g91153 + ifLocalVar40_g91196 ) + ( ifLocalVar40_g91176 + ifLocalVar40_g91144 + ifLocalVar40_g91188 + ifLocalVar40_g91195 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g91143 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_3 ) / ( temp_output_10_0_g91182 + 0.0001 ) ) );
				float4 ifLocalVar40_g91307 = 0;
				if( Debug_Type367_g91117 == 6.0 )
				ifLocalVar40_g91307 = Output_Maps561_g91117;
				float Resolution44_g91226 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 color62_g91226 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91226 = 0;
				if( Resolution44_g91226 <= 256.0 )
				ifLocalVar61_g91226 = color62_g91226;
				float4 color55_g91226 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91226 = 0;
				if( Resolution44_g91226 == 512.0 )
				ifLocalVar56_g91226 = color55_g91226;
				float4 color42_g91226 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91226 = 0;
				if( Resolution44_g91226 == 1024.0 )
				ifLocalVar40_g91226 = color42_g91226;
				float4 color48_g91226 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91226 = 0;
				if( Resolution44_g91226 == 2048.0 )
				ifLocalVar47_g91226 = color48_g91226;
				float4 color51_g91226 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91226 = 0;
				if( Resolution44_g91226 >= 4096.0 )
				ifLocalVar52_g91226 = color51_g91226;
				float4 ifLocalVar40_g91212 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91212 = ( ifLocalVar61_g91226 + ifLocalVar56_g91226 + ifLocalVar40_g91226 + ifLocalVar47_g91226 + ifLocalVar52_g91226 );
				float Resolution44_g91225 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 color62_g91225 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91225 = 0;
				if( Resolution44_g91225 <= 256.0 )
				ifLocalVar61_g91225 = color62_g91225;
				float4 color55_g91225 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91225 = 0;
				if( Resolution44_g91225 == 512.0 )
				ifLocalVar56_g91225 = color55_g91225;
				float4 color42_g91225 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91225 = 0;
				if( Resolution44_g91225 == 1024.0 )
				ifLocalVar40_g91225 = color42_g91225;
				float4 color48_g91225 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91225 = 0;
				if( Resolution44_g91225 == 2048.0 )
				ifLocalVar47_g91225 = color48_g91225;
				float4 color51_g91225 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91225 = 0;
				if( Resolution44_g91225 >= 4096.0 )
				ifLocalVar52_g91225 = color51_g91225;
				float4 ifLocalVar40_g91210 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91210 = ( ifLocalVar61_g91225 + ifLocalVar56_g91225 + ifLocalVar40_g91225 + ifLocalVar47_g91225 + ifLocalVar52_g91225 );
				float Resolution44_g91224 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 color62_g91224 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91224 = 0;
				if( Resolution44_g91224 <= 256.0 )
				ifLocalVar61_g91224 = color62_g91224;
				float4 color55_g91224 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91224 = 0;
				if( Resolution44_g91224 == 512.0 )
				ifLocalVar56_g91224 = color55_g91224;
				float4 color42_g91224 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91224 = 0;
				if( Resolution44_g91224 == 1024.0 )
				ifLocalVar40_g91224 = color42_g91224;
				float4 color48_g91224 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91224 = 0;
				if( Resolution44_g91224 == 2048.0 )
				ifLocalVar47_g91224 = color48_g91224;
				float4 color51_g91224 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91224 = 0;
				if( Resolution44_g91224 >= 4096.0 )
				ifLocalVar52_g91224 = color51_g91224;
				float4 ifLocalVar40_g91211 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91211 = ( ifLocalVar61_g91224 + ifLocalVar56_g91224 + ifLocalVar40_g91224 + ifLocalVar47_g91224 + ifLocalVar52_g91224 );
				float Resolution44_g91231 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g91231 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91231 = 0;
				if( Resolution44_g91231 <= 256.0 )
				ifLocalVar61_g91231 = color62_g91231;
				float4 color55_g91231 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91231 = 0;
				if( Resolution44_g91231 == 512.0 )
				ifLocalVar56_g91231 = color55_g91231;
				float4 color42_g91231 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91231 = 0;
				if( Resolution44_g91231 == 1024.0 )
				ifLocalVar40_g91231 = color42_g91231;
				float4 color48_g91231 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91231 = 0;
				if( Resolution44_g91231 == 2048.0 )
				ifLocalVar47_g91231 = color48_g91231;
				float4 color51_g91231 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91231 = 0;
				if( Resolution44_g91231 >= 4096.0 )
				ifLocalVar52_g91231 = color51_g91231;
				float4 ifLocalVar40_g91218 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91218 = ( ifLocalVar61_g91231 + ifLocalVar56_g91231 + ifLocalVar40_g91231 + ifLocalVar47_g91231 + ifLocalVar52_g91231 );
				float Resolution44_g91230 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 color62_g91230 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91230 = 0;
				if( Resolution44_g91230 <= 256.0 )
				ifLocalVar61_g91230 = color62_g91230;
				float4 color55_g91230 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91230 = 0;
				if( Resolution44_g91230 == 512.0 )
				ifLocalVar56_g91230 = color55_g91230;
				float4 color42_g91230 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91230 = 0;
				if( Resolution44_g91230 == 1024.0 )
				ifLocalVar40_g91230 = color42_g91230;
				float4 color48_g91230 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91230 = 0;
				if( Resolution44_g91230 == 2048.0 )
				ifLocalVar47_g91230 = color48_g91230;
				float4 color51_g91230 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91230 = 0;
				if( Resolution44_g91230 >= 4096.0 )
				ifLocalVar52_g91230 = color51_g91230;
				float4 ifLocalVar40_g91216 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91216 = ( ifLocalVar61_g91230 + ifLocalVar56_g91230 + ifLocalVar40_g91230 + ifLocalVar47_g91230 + ifLocalVar52_g91230 );
				float Resolution44_g91232 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g91232 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91232 = 0;
				if( Resolution44_g91232 <= 256.0 )
				ifLocalVar61_g91232 = color62_g91232;
				float4 color55_g91232 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91232 = 0;
				if( Resolution44_g91232 == 512.0 )
				ifLocalVar56_g91232 = color55_g91232;
				float4 color42_g91232 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91232 = 0;
				if( Resolution44_g91232 == 1024.0 )
				ifLocalVar40_g91232 = color42_g91232;
				float4 color48_g91232 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91232 = 0;
				if( Resolution44_g91232 == 2048.0 )
				ifLocalVar47_g91232 = color48_g91232;
				float4 color51_g91232 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91232 = 0;
				if( Resolution44_g91232 >= 4096.0 )
				ifLocalVar52_g91232 = color51_g91232;
				float4 ifLocalVar40_g91217 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91217 = ( ifLocalVar61_g91232 + ifLocalVar56_g91232 + ifLocalVar40_g91232 + ifLocalVar47_g91232 + ifLocalVar52_g91232 );
				float Resolution44_g91229 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 color62_g91229 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91229 = 0;
				if( Resolution44_g91229 <= 256.0 )
				ifLocalVar61_g91229 = color62_g91229;
				float4 color55_g91229 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91229 = 0;
				if( Resolution44_g91229 == 512.0 )
				ifLocalVar56_g91229 = color55_g91229;
				float4 color42_g91229 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91229 = 0;
				if( Resolution44_g91229 == 1024.0 )
				ifLocalVar40_g91229 = color42_g91229;
				float4 color48_g91229 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91229 = 0;
				if( Resolution44_g91229 == 2048.0 )
				ifLocalVar47_g91229 = color48_g91229;
				float4 color51_g91229 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91229 = 0;
				if( Resolution44_g91229 >= 4096.0 )
				ifLocalVar52_g91229 = color51_g91229;
				float4 ifLocalVar40_g91219 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91219 = ( ifLocalVar61_g91229 + ifLocalVar56_g91229 + ifLocalVar40_g91229 + ifLocalVar47_g91229 + ifLocalVar52_g91229 );
				float4 Output_Resolution737_g91117 = ( ( ifLocalVar40_g91212 + ifLocalVar40_g91210 + ifLocalVar40_g91211 ) + ( ifLocalVar40_g91218 + ifLocalVar40_g91216 + ifLocalVar40_g91217 ) + ifLocalVar40_g91219 );
				float4 ifLocalVar40_g91308 = 0;
				if( Debug_Type367_g91117 == 7.0 )
				ifLocalVar40_g91308 = Output_Resolution737_g91117;
				float2 uv_MainAlbedoTex = IN.ase_texcoord9.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
				float2 UVs72_g91237 = Main_UVs1219_g91117;
				float Resolution44_g91237 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g91237 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91237 * ( Resolution44_g91237 / 8.0 ) ) );
				float4 lerpResult78_g91237 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g91237 , tex2DNode77_g91237.a);
				float4 ifLocalVar40_g91215 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91215 = lerpResult78_g91237;
				float2 uv_MainNormalTex = IN.ase_texcoord9.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
				float2 UVs72_g91228 = Main_UVs1219_g91117;
				float Resolution44_g91228 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 tex2DNode77_g91228 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91228 * ( Resolution44_g91228 / 8.0 ) ) );
				float4 lerpResult78_g91228 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g91228 , tex2DNode77_g91228.a);
				float4 ifLocalVar40_g91213 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91213 = lerpResult78_g91228;
				float2 uv_MainMaskTex = IN.ase_texcoord9.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
				float2 UVs72_g91227 = Main_UVs1219_g91117;
				float Resolution44_g91227 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 tex2DNode77_g91227 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91227 * ( Resolution44_g91227 / 8.0 ) ) );
				float4 lerpResult78_g91227 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g91227 , tex2DNode77_g91227.a);
				float4 ifLocalVar40_g91214 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91214 = lerpResult78_g91227;
				float2 uv_SecondAlbedoTex = IN.ase_texcoord9.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
				float2 UVs72_g91235 = Second_UVs1234_g91117;
				float Resolution44_g91235 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g91235 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91235 * ( Resolution44_g91235 / 8.0 ) ) );
				float4 lerpResult78_g91235 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g91235 , tex2DNode77_g91235.a);
				float4 ifLocalVar40_g91222 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91222 = lerpResult78_g91235;
				float2 uv_SecondMaskTex = IN.ase_texcoord9.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
				float2 UVs72_g91234 = Second_UVs1234_g91117;
				float Resolution44_g91234 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 tex2DNode77_g91234 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91234 * ( Resolution44_g91234 / 8.0 ) ) );
				float4 lerpResult78_g91234 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g91234 , tex2DNode77_g91234.a);
				float4 ifLocalVar40_g91220 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91220 = lerpResult78_g91234;
				float2 UVs72_g91236 = Second_UVs1234_g91117;
				float Resolution44_g91236 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g91236 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91236 * ( Resolution44_g91236 / 8.0 ) ) );
				float4 lerpResult78_g91236 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g91236 , tex2DNode77_g91236.a);
				float4 ifLocalVar40_g91221 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91221 = lerpResult78_g91236;
				float2 uv_EmissiveTex = IN.ase_texcoord9.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
				float2 UVs72_g91233 = Emissive_UVs1245_g91117;
				float Resolution44_g91233 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 tex2DNode77_g91233 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91233 * ( Resolution44_g91233 / 8.0 ) ) );
				float4 lerpResult78_g91233 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g91233 , tex2DNode77_g91233.a);
				float4 ifLocalVar40_g91223 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91223 = lerpResult78_g91233;
				float4 Output_MipLevel1284_g91117 = ( ( ifLocalVar40_g91215 + ifLocalVar40_g91213 + ifLocalVar40_g91214 ) + ( ifLocalVar40_g91222 + ifLocalVar40_g91220 + ifLocalVar40_g91221 ) + ifLocalVar40_g91223 );
				float4 ifLocalVar40_g91309 = 0;
				if( Debug_Type367_g91117 == 8.0 )
				ifLocalVar40_g91309 = Output_MipLevel1284_g91117;
				float3 WorldPosition893_g91117 = worldPos;
				half3 Input_Position419_g91265 = WorldPosition893_g91117;
				float Input_MotionScale287_g91265 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g91265 = (( Input_Position419_g91265 * Input_MotionScale287_g91265 * 0.0075 )).xz;
				float2 temp_output_447_0_g91269 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Wind_DirectionWS1031_g91117 = temp_output_447_0_g91269;
				half2 Input_DirectionWS423_g91265 = Wind_DirectionWS1031_g91117;
				float lerpResult115_g91266 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g91265 = _MotionSpeed_10;
				half Input_MotionVariation284_g91265 = _MotionVariation_10;
				float4x4 break19_g91272 = unity_ObjectToWorld;
				float3 appendResult20_g91272 = (float3(break19_g91272[ 0 ][ 3 ] , break19_g91272[ 1 ][ 3 ] , break19_g91272[ 2 ][ 3 ]));
				float3 appendResult60_g91271 = (float3(IN.ase_texcoord11.x , IN.ase_texcoord11.z , IN.ase_texcoord11.y));
				float3 temp_output_122_0_g91272 = ( appendResult60_g91271 * _VertexPivotMode );
				float3 PivotsOnly105_g91272 = (mul( unity_ObjectToWorld, float4( temp_output_122_0_g91272 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g91274 = ( appendResult20_g91272 + PivotsOnly105_g91272 );
				half3 WorldData19_g91274 = worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g91274 = WorldData19_g91274;
				#else
				float3 staticSwitch14_g91274 = ObjectData20_g91274;
				#endif
				float3 temp_output_114_0_g91272 = staticSwitch14_g91274;
				half3 ObjectData20_g91264 = temp_output_114_0_g91272;
				half3 WorldData19_g91264 = worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g91264 = WorldData19_g91264;
				#else
				float3 staticSwitch14_g91264 = ObjectData20_g91264;
				#endif
				float3 ObjectPosition890_g91117 = staticSwitch14_g91264;
				half3 Input_Position167_g91281 = ObjectPosition890_g91117;
				float dotResult156_g91281 = dot( (Input_Position167_g91281).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g91281 = _VertexDynamicMode;
				float Postion_Random162_g91281 = ( sin( dotResult156_g91281 ) * ( 1.0 - Input_DynamicMode120_g91281 ) );
				half Input_Variation124_g91281 = IN.ase_color.r;
				half ObjectData20_g91283 = frac( ( Postion_Random162_g91281 + Input_Variation124_g91281 ) );
				half WorldData19_g91283 = Input_Variation124_g91281;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g91283 = WorldData19_g91283;
				#else
				float staticSwitch14_g91283 = ObjectData20_g91283;
				#endif
				float temp_output_112_0_g91281 = staticSwitch14_g91283;
				float clampResult171_g91281 = clamp( temp_output_112_0_g91281 , 0.01 , 0.99 );
				half Global_MeshVariation1176_g91117 = clampResult171_g91281;
				half Input_GlobalMeshVariation569_g91265 = Global_MeshVariation1176_g91117;
				float temp_output_630_0_g91265 = ( ( ( lerpResult115_g91266 * Input_MotionSpeed62_g91265 ) + ( Input_MotionVariation284_g91265 * Input_GlobalMeshVariation569_g91265 ) ) * 0.03 );
				float temp_output_607_0_g91265 = frac( temp_output_630_0_g91265 );
				float4 lerpResult590_g91265 = lerp( SAMPLE_TEXTURE2D( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g91265 + ( -Input_DirectionWS423_g91265 * temp_output_607_0_g91265 ) ) ) , SAMPLE_TEXTURE2D( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g91265 + ( -Input_DirectionWS423_g91265 * frac( ( temp_output_630_0_g91265 + 0.5 ) ) ) ) ) , ( abs( ( temp_output_607_0_g91265 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g91265 = lerpResult590_g91265;
				float2 temp_output_645_0_g91265 = ((Noise_Complex703_g91265).rg*2.0 + -1.0);
				float2 break650_g91265 = temp_output_645_0_g91265;
				float3 appendResult649_g91265 = (float3(break650_g91265.x , 0.0 , break650_g91265.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ) );
				half2 Motion_Noise915_g91117 = (( mul( unity_WorldToObject, float4( appendResult649_g91265 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				float3 appendResult1180_g91117 = (float3(Motion_Noise915_g91117 , 0.0));
				float3 ifLocalVar40_g91127 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91127 = appendResult1180_g91117;
				float Debug_Layer885_g91117 = TVE_DEBUG_Layer;
				float temp_output_82_0_g91170 = Debug_Layer885_g91117;
				float temp_output_19_0_g91174 = TVE_ColorsUsage[(int)temp_output_82_0_g91170];
				float4 temp_output_91_19_g91170 = TVE_ColorsCoords;
				half2 UV94_g91170 = ( (temp_output_91_19_g91170).zw + ( (temp_output_91_19_g91170).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode83_g91170 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, float3(UV94_g91170,temp_output_82_0_g91170), 0.0 );
				float4 temp_output_17_0_g91174 = tex2DArrayNode83_g91170;
				float4 temp_output_92_86_g91170 = TVE_ColorsParams;
				float4 temp_output_3_0_g91174 = temp_output_92_86_g91170;
				float4 ifLocalVar18_g91174 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91174 >= 0.5 )
				ifLocalVar18_g91174 = temp_output_17_0_g91174;
				else
				ifLocalVar18_g91174 = temp_output_3_0_g91174;
				float4 lerpResult22_g91174 = lerp( temp_output_3_0_g91174 , temp_output_17_0_g91174 , temp_output_19_0_g91174);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91174 = lerpResult22_g91174;
				#else
				float4 staticSwitch24_g91174 = ifLocalVar18_g91174;
				#endif
				float3 ifLocalVar40_g91142 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91142 = (staticSwitch24_g91174).rgb;
				float temp_output_82_0_g91155 = Debug_Layer885_g91117;
				float temp_output_19_0_g91159 = TVE_ColorsUsage[(int)temp_output_82_0_g91155];
				float4 temp_output_91_19_g91155 = TVE_ColorsCoords;
				half2 UV94_g91155 = ( (temp_output_91_19_g91155).zw + ( (temp_output_91_19_g91155).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode83_g91155 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, float3(UV94_g91155,temp_output_82_0_g91155), 0.0 );
				float4 temp_output_17_0_g91159 = tex2DArrayNode83_g91155;
				float4 temp_output_92_86_g91155 = TVE_ColorsParams;
				float4 temp_output_3_0_g91159 = temp_output_92_86_g91155;
				float4 ifLocalVar18_g91159 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91159 >= 0.5 )
				ifLocalVar18_g91159 = temp_output_17_0_g91159;
				else
				ifLocalVar18_g91159 = temp_output_3_0_g91159;
				float4 lerpResult22_g91159 = lerp( temp_output_3_0_g91159 , temp_output_17_0_g91159 , temp_output_19_0_g91159);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91159 = lerpResult22_g91159;
				#else
				float4 staticSwitch24_g91159 = ifLocalVar18_g91159;
				#endif
				float ifLocalVar40_g91152 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91152 = saturate( (staticSwitch24_g91159).a );
				float temp_output_84_0_g91165 = Debug_Layer885_g91117;
				float temp_output_19_0_g91169 = TVE_ExtrasUsage[(int)temp_output_84_0_g91165];
				float4 temp_output_93_19_g91165 = TVE_ExtrasCoords;
				half2 UV96_g91165 = ( (temp_output_93_19_g91165).zw + ( (temp_output_93_19_g91165).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91165 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91165,temp_output_84_0_g91165), 0.0 );
				float4 temp_output_17_0_g91169 = tex2DArrayNode48_g91165;
				float4 temp_output_94_85_g91165 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91169 = temp_output_94_85_g91165;
				float4 ifLocalVar18_g91169 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91169 >= 0.5 )
				ifLocalVar18_g91169 = temp_output_17_0_g91169;
				else
				ifLocalVar18_g91169 = temp_output_3_0_g91169;
				float4 lerpResult22_g91169 = lerp( temp_output_3_0_g91169 , temp_output_17_0_g91169 , temp_output_19_0_g91169);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91169 = lerpResult22_g91169;
				#else
				float4 staticSwitch24_g91169 = ifLocalVar18_g91169;
				#endif
				float ifLocalVar40_g91135 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91135 = (staticSwitch24_g91169).r;
				float temp_output_84_0_g91118 = Debug_Layer885_g91117;
				float temp_output_19_0_g91122 = TVE_ExtrasUsage[(int)temp_output_84_0_g91118];
				float4 temp_output_93_19_g91118 = TVE_ExtrasCoords;
				half2 UV96_g91118 = ( (temp_output_93_19_g91118).zw + ( (temp_output_93_19_g91118).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91118 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91118,temp_output_84_0_g91118), 0.0 );
				float4 temp_output_17_0_g91122 = tex2DArrayNode48_g91118;
				float4 temp_output_94_85_g91118 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91122 = temp_output_94_85_g91118;
				float4 ifLocalVar18_g91122 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91122 >= 0.5 )
				ifLocalVar18_g91122 = temp_output_17_0_g91122;
				else
				ifLocalVar18_g91122 = temp_output_3_0_g91122;
				float4 lerpResult22_g91122 = lerp( temp_output_3_0_g91122 , temp_output_17_0_g91122 , temp_output_19_0_g91122);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91122 = lerpResult22_g91122;
				#else
				float4 staticSwitch24_g91122 = ifLocalVar18_g91122;
				#endif
				float ifLocalVar40_g91207 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91207 = (staticSwitch24_g91122).g;
				float temp_output_84_0_g91177 = Debug_Layer885_g91117;
				float temp_output_19_0_g91181 = TVE_ExtrasUsage[(int)temp_output_84_0_g91177];
				float4 temp_output_93_19_g91177 = TVE_ExtrasCoords;
				half2 UV96_g91177 = ( (temp_output_93_19_g91177).zw + ( (temp_output_93_19_g91177).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91177 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91177,temp_output_84_0_g91177), 0.0 );
				float4 temp_output_17_0_g91181 = tex2DArrayNode48_g91177;
				float4 temp_output_94_85_g91177 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91181 = temp_output_94_85_g91177;
				float4 ifLocalVar18_g91181 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91181 >= 0.5 )
				ifLocalVar18_g91181 = temp_output_17_0_g91181;
				else
				ifLocalVar18_g91181 = temp_output_3_0_g91181;
				float4 lerpResult22_g91181 = lerp( temp_output_3_0_g91181 , temp_output_17_0_g91181 , temp_output_19_0_g91181);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91181 = lerpResult22_g91181;
				#else
				float4 staticSwitch24_g91181 = ifLocalVar18_g91181;
				#endif
				float ifLocalVar40_g91136 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91136 = (staticSwitch24_g91181).b;
				float temp_output_84_0_g91197 = Debug_Layer885_g91117;
				float temp_output_19_0_g91201 = TVE_ExtrasUsage[(int)temp_output_84_0_g91197];
				float4 temp_output_93_19_g91197 = TVE_ExtrasCoords;
				half2 UV96_g91197 = ( (temp_output_93_19_g91197).zw + ( (temp_output_93_19_g91197).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91197 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91197,temp_output_84_0_g91197), 0.0 );
				float4 temp_output_17_0_g91201 = tex2DArrayNode48_g91197;
				float4 temp_output_94_85_g91197 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91201 = temp_output_94_85_g91197;
				float4 ifLocalVar18_g91201 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91201 >= 0.5 )
				ifLocalVar18_g91201 = temp_output_17_0_g91201;
				else
				ifLocalVar18_g91201 = temp_output_3_0_g91201;
				float4 lerpResult22_g91201 = lerp( temp_output_3_0_g91201 , temp_output_17_0_g91201 , temp_output_19_0_g91201);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91201 = lerpResult22_g91201;
				#else
				float4 staticSwitch24_g91201 = ifLocalVar18_g91201;
				#endif
				float ifLocalVar40_g91129 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91129 = saturate( (staticSwitch24_g91201).a );
				float temp_output_84_0_g91160 = Debug_Layer885_g91117;
				float temp_output_19_0_g91164 = TVE_MotionUsage[(int)temp_output_84_0_g91160];
				float4 temp_output_91_19_g91160 = TVE_MotionCoords;
				half2 UV94_g91160 = ( (temp_output_91_19_g91160).zw + ( (temp_output_91_19_g91160).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91160 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g91160,temp_output_84_0_g91160), 0.0 );
				float4 temp_output_17_0_g91164 = tex2DArrayNode50_g91160;
				float4 temp_output_112_19_g91160 = TVE_MotionParams;
				float4 temp_output_3_0_g91164 = temp_output_112_19_g91160;
				float4 ifLocalVar18_g91164 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91164 >= 0.5 )
				ifLocalVar18_g91164 = temp_output_17_0_g91164;
				else
				ifLocalVar18_g91164 = temp_output_3_0_g91164;
				float4 lerpResult22_g91164 = lerp( temp_output_3_0_g91164 , temp_output_17_0_g91164 , temp_output_19_0_g91164);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91164 = lerpResult22_g91164;
				#else
				float4 staticSwitch24_g91164 = ifLocalVar18_g91164;
				#endif
				float3 appendResult1012_g91117 = (float3((staticSwitch24_g91164).rg , 0.0));
				float3 ifLocalVar40_g91125 = 0;
				if( Debug_Index464_g91117 == 7.0 )
				ifLocalVar40_g91125 = appendResult1012_g91117;
				float temp_output_84_0_g91183 = Debug_Layer885_g91117;
				float temp_output_19_0_g91187 = TVE_MotionUsage[(int)temp_output_84_0_g91183];
				float4 temp_output_91_19_g91183 = TVE_MotionCoords;
				half2 UV94_g91183 = ( (temp_output_91_19_g91183).zw + ( (temp_output_91_19_g91183).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91183 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g91183,temp_output_84_0_g91183), 0.0 );
				float4 temp_output_17_0_g91187 = tex2DArrayNode50_g91183;
				float4 temp_output_112_19_g91183 = TVE_MotionParams;
				float4 temp_output_3_0_g91187 = temp_output_112_19_g91183;
				float4 ifLocalVar18_g91187 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91187 >= 0.5 )
				ifLocalVar18_g91187 = temp_output_17_0_g91187;
				else
				ifLocalVar18_g91187 = temp_output_3_0_g91187;
				float4 lerpResult22_g91187 = lerp( temp_output_3_0_g91187 , temp_output_17_0_g91187 , temp_output_19_0_g91187);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91187 = lerpResult22_g91187;
				#else
				float4 staticSwitch24_g91187 = ifLocalVar18_g91187;
				#endif
				float ifLocalVar40_g91139 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91139 = (staticSwitch24_g91187).b;
				float temp_output_84_0_g91189 = Debug_Layer885_g91117;
				float temp_output_19_0_g91193 = TVE_MotionUsage[(int)temp_output_84_0_g91189];
				float4 temp_output_91_19_g91189 = TVE_MotionCoords;
				half2 UV94_g91189 = ( (temp_output_91_19_g91189).zw + ( (temp_output_91_19_g91189).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91189 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g91189,temp_output_84_0_g91189), 0.0 );
				float4 temp_output_17_0_g91193 = tex2DArrayNode50_g91189;
				float4 temp_output_112_19_g91189 = TVE_MotionParams;
				float4 temp_output_3_0_g91193 = temp_output_112_19_g91189;
				float4 ifLocalVar18_g91193 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91193 >= 0.5 )
				ifLocalVar18_g91193 = temp_output_17_0_g91193;
				else
				ifLocalVar18_g91193 = temp_output_3_0_g91193;
				float4 lerpResult22_g91193 = lerp( temp_output_3_0_g91193 , temp_output_17_0_g91193 , temp_output_19_0_g91193);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91193 = lerpResult22_g91193;
				#else
				float4 staticSwitch24_g91193 = ifLocalVar18_g91193;
				#endif
				float ifLocalVar40_g91194 = 0;
				if( Debug_Index464_g91117 == 9.0 )
				ifLocalVar40_g91194 = saturate( (staticSwitch24_g91193).a );
				float temp_output_84_0_g91147 = Debug_Layer885_g91117;
				float temp_output_19_0_g91151 = TVE_VertexUsage[(int)temp_output_84_0_g91147];
				float4 temp_output_94_19_g91147 = TVE_VertexCoords;
				half2 UV97_g91147 = ( (temp_output_94_19_g91147).zw + ( (temp_output_94_19_g91147).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91147 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g91147,temp_output_84_0_g91147), 0.0 );
				float4 temp_output_17_0_g91151 = tex2DArrayNode50_g91147;
				float4 temp_output_111_19_g91147 = TVE_VertexParams;
				float4 temp_output_3_0_g91151 = temp_output_111_19_g91147;
				float4 ifLocalVar18_g91151 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91151 >= 0.5 )
				ifLocalVar18_g91151 = temp_output_17_0_g91151;
				else
				ifLocalVar18_g91151 = temp_output_3_0_g91151;
				float4 lerpResult22_g91151 = lerp( temp_output_3_0_g91151 , temp_output_17_0_g91151 , temp_output_19_0_g91151);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91151 = lerpResult22_g91151;
				#else
				float4 staticSwitch24_g91151 = ifLocalVar18_g91151;
				#endif
				float3 appendResult1013_g91117 = (float3((staticSwitch24_g91151).rg , 0.0));
				float3 ifLocalVar40_g91313 = 0;
				if( Debug_Index464_g91117 == 10.0 )
				ifLocalVar40_g91313 = appendResult1013_g91117;
				float temp_output_84_0_g91130 = Debug_Layer885_g91117;
				float temp_output_19_0_g91134 = TVE_VertexUsage[(int)temp_output_84_0_g91130];
				float4 temp_output_94_19_g91130 = TVE_VertexCoords;
				half2 UV97_g91130 = ( (temp_output_94_19_g91130).zw + ( (temp_output_94_19_g91130).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91130 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g91130,temp_output_84_0_g91130), 0.0 );
				float4 temp_output_17_0_g91134 = tex2DArrayNode50_g91130;
				float4 temp_output_111_19_g91130 = TVE_VertexParams;
				float4 temp_output_3_0_g91134 = temp_output_111_19_g91130;
				float4 ifLocalVar18_g91134 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91134 >= 0.5 )
				ifLocalVar18_g91134 = temp_output_17_0_g91134;
				else
				ifLocalVar18_g91134 = temp_output_3_0_g91134;
				float4 lerpResult22_g91134 = lerp( temp_output_3_0_g91134 , temp_output_17_0_g91134 , temp_output_19_0_g91134);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91134 = lerpResult22_g91134;
				#else
				float4 staticSwitch24_g91134 = ifLocalVar18_g91134;
				#endif
				float ifLocalVar40_g91287 = 0;
				if( Debug_Index464_g91117 == 11.0 )
				ifLocalVar40_g91287 = saturate( (staticSwitch24_g91134).b );
				float temp_output_84_0_g91202 = Debug_Layer885_g91117;
				float temp_output_19_0_g91206 = TVE_VertexUsage[(int)temp_output_84_0_g91202];
				float4 temp_output_94_19_g91202 = TVE_VertexCoords;
				half2 UV97_g91202 = ( (temp_output_94_19_g91202).zw + ( (temp_output_94_19_g91202).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91202 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g91202,temp_output_84_0_g91202), 0.0 );
				float4 temp_output_17_0_g91206 = tex2DArrayNode50_g91202;
				float4 temp_output_111_19_g91202 = TVE_VertexParams;
				float4 temp_output_3_0_g91206 = temp_output_111_19_g91202;
				float4 ifLocalVar18_g91206 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91206 >= 0.5 )
				ifLocalVar18_g91206 = temp_output_17_0_g91206;
				else
				ifLocalVar18_g91206 = temp_output_3_0_g91206;
				float4 lerpResult22_g91206 = lerp( temp_output_3_0_g91206 , temp_output_17_0_g91206 , temp_output_19_0_g91206);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91206 = lerpResult22_g91206;
				#else
				float4 staticSwitch24_g91206 = ifLocalVar18_g91206;
				#endif
				float ifLocalVar40_g91288 = 0;
				if( Debug_Index464_g91117 == 12.0 )
				ifLocalVar40_g91288 = saturate( (staticSwitch24_g91206).a );
				float temp_output_7_0_g91209 = Debug_Min721_g91117;
				float3 temp_cast_44 = (temp_output_7_0_g91209).xxx;
				float temp_output_10_0_g91209 = ( Debug_Max723_g91117 - temp_output_7_0_g91209 );
				float3 Output_Globals888_g91117 = saturate( ( ( ( ifLocalVar40_g91127 + ( ifLocalVar40_g91142 + ifLocalVar40_g91152 ) + ( ifLocalVar40_g91135 + ifLocalVar40_g91207 + ifLocalVar40_g91136 + ifLocalVar40_g91129 ) + ( ifLocalVar40_g91125 + ifLocalVar40_g91139 + ifLocalVar40_g91194 ) + ( ifLocalVar40_g91313 + ifLocalVar40_g91287 + ifLocalVar40_g91288 ) ) - temp_cast_44 ) / ( temp_output_10_0_g91209 + 0.0001 ) ) );
				float3 ifLocalVar40_g91310 = 0;
				if( Debug_Type367_g91117 == 9.0 )
				ifLocalVar40_g91310 = Output_Globals888_g91117;
				float4 temp_output_35_0_g91293 = TVE_ColorsCoords;
				float temp_output_7_0_g91294 = 1.0;
				float2 temp_cast_46 = (temp_output_7_0_g91294).xx;
				float temp_output_10_0_g91294 = ( 1.0 - temp_output_7_0_g91294 );
				float2 temp_output_1583_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91293).zw + ( (temp_output_35_0_g91293).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_46 ) / temp_output_10_0_g91294 ) );
				float2 temp_output_1582_0_g91117 = ( temp_output_1583_0_g91117 * temp_output_1583_0_g91117 );
				float3 ifLocalVar40_g91314 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91314 = ( ( 1.0 - saturate( ( (temp_output_1582_0_g91117).x + (temp_output_1582_0_g91117).y ) ) ) * float3(0.5,0,0) );
				float4 temp_output_35_0_g91295 = TVE_ExtrasCoords;
				float temp_output_7_0_g91296 = 1.0;
				float2 temp_cast_47 = (temp_output_7_0_g91296).xx;
				float temp_output_10_0_g91296 = ( 1.0 - temp_output_7_0_g91296 );
				float2 temp_output_1602_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91295).zw + ( (temp_output_35_0_g91295).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_47 ) / temp_output_10_0_g91296 ) );
				float2 temp_output_1595_0_g91117 = ( temp_output_1602_0_g91117 * temp_output_1602_0_g91117 );
				float3 ifLocalVar40_g91315 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91315 = ( ( 1.0 - saturate( ( (temp_output_1595_0_g91117).x + (temp_output_1595_0_g91117).y ) ) ) * float3(0,0.5,0) );
				float4 temp_output_35_0_g91297 = TVE_MotionCoords;
				float temp_output_7_0_g91298 = 1.0;
				float2 temp_cast_48 = (temp_output_7_0_g91298).xx;
				float temp_output_10_0_g91298 = ( 1.0 - temp_output_7_0_g91298 );
				float2 temp_output_1615_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91297).zw + ( (temp_output_35_0_g91297).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_48 ) / temp_output_10_0_g91298 ) );
				float2 temp_output_1609_0_g91117 = ( temp_output_1615_0_g91117 * temp_output_1615_0_g91117 );
				float3 ifLocalVar40_g91316 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91316 = ( ( 1.0 - saturate( ( (temp_output_1609_0_g91117).x + (temp_output_1609_0_g91117).y ) ) ) * float3(0,0,1) );
				float4 temp_output_35_0_g91299 = TVE_VertexCoords;
				float temp_output_7_0_g91300 = 1.0;
				float2 temp_cast_49 = (temp_output_7_0_g91300).xx;
				float temp_output_10_0_g91300 = ( 1.0 - temp_output_7_0_g91300 );
				float2 temp_output_1628_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91299).zw + ( (temp_output_35_0_g91299).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_49 ) / temp_output_10_0_g91300 ) );
				float2 temp_output_1622_0_g91117 = ( temp_output_1628_0_g91117 * temp_output_1628_0_g91117 );
				float3 ifLocalVar40_g91317 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91317 = ( ( 1.0 - saturate( ( (temp_output_1622_0_g91117).x + (temp_output_1622_0_g91117).y ) ) ) * float3(0.5,0.5,0.5) );
				float3 Output_Volume1591_g91117 = saturate( ( ifLocalVar40_g91314 + ifLocalVar40_g91315 + ifLocalVar40_g91316 + ifLocalVar40_g91317 ) );
				float3 ifLocalVar40_g91311 = 0;
				if( Debug_Type367_g91117 == 10.0 )
				ifLocalVar40_g91311 = Output_Volume1591_g91117;
				float3 vertexToFrag328_g91117 = IN.ase_texcoord12.xyz;
				float4 color1016_g91117 = IsGammaSpace() ? float4(0.5831653,0.6037736,0.2135992,0) : float4(0.2992498,0.3229691,0.03750122,0);
				float4 color1017_g91117 = IsGammaSpace() ? float4(0.8117647,0.3488252,0.2627451,0) : float4(0.6239604,0.0997834,0.05612849,0);
				float4 switchResult1015_g91117 = (((ase_vface>0)?(color1016_g91117):(color1017_g91117)));
				float3 ifLocalVar40_g91128 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91128 = (switchResult1015_g91117).rgb;
				float temp_output_7_0_g91286 = Debug_Min721_g91117;
				float3 temp_cast_51 = (temp_output_7_0_g91286).xxx;
				float temp_output_10_0_g91286 = ( Debug_Max723_g91117 - temp_output_7_0_g91286 );
				float Debug_Filter322_g91117 = TVE_DEBUG_Filter;
				float lerpResult1524_g91117 = lerp( 1.0 , _IsTVEShader647_g91117 , Debug_Filter322_g91117);
				float4 lerpResult1517_g91117 = lerp( Shading_Inactive1492_g91117 , float4( saturate( ( ( ( vertexToFrag328_g91117 + ifLocalVar40_g91128 ) - temp_cast_51 ) / ( temp_output_10_0_g91286 + 0.0001 ) ) ) , 0.0 ) , lerpResult1524_g91117);
				float4 Output_Mesh316_g91117 = lerpResult1517_g91117;
				float4 ifLocalVar40_g91312 = 0;
				if( Debug_Type367_g91117 == 11.0 )
				ifLocalVar40_g91312 = Output_Mesh316_g91117;
				float Debug_Clip623_g91117 = TVE_DEBUG_Clip;
				float lerpResult622_g91117 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g91117 * _RenderClip ));
				clip( lerpResult622_g91117 - _Cutoff);
				clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
				
				o.Albedo = fixed3( 0.5, 0.5, 0.5 );
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = ( ( ifLocalVar40_g91301 + ifLocalVar40_g91302 + ifLocalVar40_g91303 + ifLocalVar40_g91304 + ifLocalVar40_g91305 + ifLocalVar40_g91306 ) + ( ifLocalVar40_g91307 + ifLocalVar40_g91308 + ifLocalVar40_g91309 ) + ( float4( ifLocalVar40_g91310 , 0.0 ) + float4( ifLocalVar40_g91311 , 0.0 ) + ifLocalVar40_g91312 ) ).rgb;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = _LightColor0.rgb;
				gi.light.dir = lightDir;

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI(o, giInput, gi);
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					c += LightingStandardSpecular (o, worldViewDir, gi);
				#else
					c += LightingStandard( o, worldViewDir, gi );
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;
					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
					c.rgb += o.Albedo * transmission;
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 lightDir = gi.light.dir + o.Normal * normal;
					half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
					half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
					c.rgb += o.Albedo * translucency * strength;
				}
				#endif

				//#ifdef ASE_REFRACTION
				//	float4 projScreenPos = ScreenPos / ScreenPos.w;
				//	float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
				//	projScreenPos.xy += refractionOffset.xy;
				//	float3 refraction = UNITY_SAMPLE_SCREENSPACE_TEXTURE( _GrabTexture, projScreenPos ) * RefractionColor;
				//	color.rgb = lerp( refraction, color.rgb, color.a );
				//	color.a = 1;
				//#endif

				c.rgb += o.Emission;

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "Deferred"
			Tags { "LightMode"="Deferred" }

			AlphaToMask Off

			CGPROGRAM
			#define ASE_NO_AMBIENT 1
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_prepassfinal
			#ifndef UNITY_PASS_DEFERRED
				#define UNITY_PASS_DEFERRED
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
			#endif//ASE Sampling Macros
			

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				float4 lmap : TEXCOORD2;
				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						half3 sh : TEXCOORD3;
					#endif
				#else
					#ifdef DIRLIGHTMAP_OFF
						float4 lmapFadePos : TEXCOORD4;
					#endif
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_color : COLOR;
				float4 ase_texcoord11 : TEXCOORD11;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef LIGHTMAP_ON
			float4 unity_LightmapFade;
			#endif
			fixed4 unity_Ambient;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform half _Banner;
			uniform half _Message;
			uniform half _IsTVEShader;
			uniform float _IsSimpleShader;
			uniform float _IsVertexShader;
			uniform half TVE_DEBUG_Type;
			uniform float _IsCollected;
			uniform float _IsBarkShader;
			uniform float _IsPlantShader;
			uniform float _IsPropShader;
			uniform float _IsCoreShader;
			uniform float _IsBlanketShader;
			uniform float _IsImpostorShader;
			uniform float _IsPolygonalShader;
			uniform float _IsStandardShader;
			uniform float _IsSubsurfaceShader;
			uniform float _IsCustomShader;
			uniform float _IsIdentifier;
			uniform half TVE_DEBUG_Index;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
			uniform half4 _MainUVs;
			SamplerState sampler_MainAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
			SamplerState sampler_MainNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
			SamplerState sampler_MainMaskTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
			uniform half _DetailCoordMode;
			uniform half4 _SecondUVs;
			SamplerState sampler_SecondAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
			SamplerState sampler_SecondNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
			SamplerState sampler_SecondMaskTex;
			uniform float _DetailMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
			uniform half4 _EmissiveUVs;
			SamplerState sampler_EmissiveTex;
			uniform float4 _EmissiveColor;
			uniform float _EmissiveCat;
			uniform half TVE_DEBUG_Min;
			uniform half TVE_DEBUG_Max;
			float4 _MainAlbedoTex_TexelSize;
			float4 _MainNormalTex_TexelSize;
			float4 _MainMaskTex_TexelSize;
			float4 _SecondAlbedoTex_TexelSize;
			float4 _SecondMaskTex_TexelSize;
			float4 _EmissiveTex_TexelSize;
			uniform float4 _MainAlbedoTex_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
			SamplerState samplerTVE_DEBUG_MipTex;
			uniform float4 _MainNormalTex_ST;
			uniform float4 _MainMaskTex_ST;
			uniform float4 _SecondAlbedoTex_ST;
			uniform float4 _SecondMaskTex_ST;
			uniform float4 _EmissiveTex_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_NoiseTex);
			uniform float _MotionScale_10;
			uniform half4 TVE_MotionParams;
			uniform half4 TVE_TimeParams;
			uniform float _MotionSpeed_10;
			uniform float _MotionVariation_10;
			uniform half _VertexPivotMode;
			uniform half _VertexDynamicMode;
			SamplerState sampler_Linear_Repeat;
			uniform half TVE_DEBUG_Layer;
			uniform float TVE_ColorsUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ColorsTex);
			uniform half4 TVE_ColorsCoords;
			SamplerState sampler_Linear_Clamp;
			uniform half4 TVE_ColorsParams;
			uniform float TVE_ExtrasUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_ExtrasParams;
			uniform float TVE_MotionUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_MotionTex);
			uniform half4 TVE_MotionCoords;
			uniform float TVE_VertexUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_VertexTex);
			uniform half4 TVE_VertexCoords;
			uniform half4 TVE_VertexParams;
			uniform half TVE_DEBUG_Filter;
			uniform half TVE_DEBUG_Clip;
			uniform float _RenderClip;
			uniform float _Cutoff;
			uniform float _IsElementShader;
			uniform float _IsHelperShader;


			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float Debug_Index464_g91117 = TVE_DEBUG_Index;
				float3 ifLocalVar40_g91123 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91123 = saturate( v.vertex.xyz );
				float3 ifLocalVar40_g91141 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91141 = v.normal;
				float3 ifLocalVar40_g91154 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91154 = v.tangent.xyz;
				float ifLocalVar40_g91138 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91138 = saturate( v.tangent.w );
				float ifLocalVar40_g91238 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91238 = v.ase_color.r;
				float ifLocalVar40_g91239 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91239 = v.ase_color.g;
				float ifLocalVar40_g91240 = 0;
				if( Debug_Index464_g91117 == 7.0 )
				ifLocalVar40_g91240 = v.ase_color.b;
				float ifLocalVar40_g91241 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91241 = v.ase_color.a;
				float3 appendResult1147_g91117 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
				float3 ifLocalVar40_g91248 = 0;
				if( Debug_Index464_g91117 == 9.0 )
				ifLocalVar40_g91248 = appendResult1147_g91117;
				float3 appendResult1148_g91117 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
				float3 ifLocalVar40_g91249 = 0;
				if( Debug_Index464_g91117 == 10.0 )
				ifLocalVar40_g91249 = appendResult1148_g91117;
				float3 appendResult1149_g91117 = (float3(v.texcoord1.xyzw.z , v.texcoord1.xyzw.w , 0.0));
				float3 ifLocalVar40_g91250 = 0;
				if( Debug_Index464_g91117 == 11.0 )
				ifLocalVar40_g91250 = appendResult1149_g91117;
				half3 Input_Position167_g91242 = float3( 0,0,0 );
				float dotResult156_g91242 = dot( (Input_Position167_g91242).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g91242 = 0.0;
				float Postion_Random162_g91242 = ( sin( dotResult156_g91242 ) * ( 1.0 - Input_DynamicMode120_g91242 ) );
				half Input_Variation124_g91242 = v.ase_color.r;
				half ObjectData20_g91244 = frac( ( Postion_Random162_g91242 + Input_Variation124_g91242 ) );
				half WorldData19_g91244 = Input_Variation124_g91242;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g91244 = WorldData19_g91244;
				#else
				float staticSwitch14_g91244 = ObjectData20_g91244;
				#endif
				float temp_output_112_0_g91242 = staticSwitch14_g91244;
				float clampResult171_g91242 = clamp( temp_output_112_0_g91242 , 0.01 , 0.99 );
				float ifLocalVar40_g91251 = 0;
				if( Debug_Index464_g91117 == 12.0 )
				ifLocalVar40_g91251 = clampResult171_g91242;
				float ifLocalVar40_g91252 = 0;
				if( Debug_Index464_g91117 == 13.0 )
				ifLocalVar40_g91252 = v.ase_color.g;
				float ifLocalVar40_g91253 = 0;
				if( Debug_Index464_g91117 == 14.0 )
				ifLocalVar40_g91253 = v.ase_color.b;
				float ifLocalVar40_g91254 = 0;
				if( Debug_Index464_g91117 == 15.0 )
				ifLocalVar40_g91254 = v.ase_color.a;
				half3 Input_Position167_g91259 = float3( 0,0,0 );
				float dotResult156_g91259 = dot( (Input_Position167_g91259).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g91259 = 0.0;
				float Postion_Random162_g91259 = ( sin( dotResult156_g91259 ) * ( 1.0 - Input_DynamicMode120_g91259 ) );
				half Input_Variation124_g91259 = v.ase_color.r;
				half ObjectData20_g91261 = frac( ( Postion_Random162_g91259 + Input_Variation124_g91259 ) );
				half WorldData19_g91261 = Input_Variation124_g91259;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g91261 = WorldData19_g91261;
				#else
				float staticSwitch14_g91261 = ObjectData20_g91261;
				#endif
				float temp_output_112_0_g91259 = staticSwitch14_g91261;
				float clampResult171_g91259 = clamp( temp_output_112_0_g91259 , 0.01 , 0.99 );
				float temp_output_1451_19_g91117 = clampResult171_g91259;
				float3 temp_cast_0 = (temp_output_1451_19_g91117).xxx;
				float3 hsvTorgb260_g91117 = HSVToRGB( float3(temp_output_1451_19_g91117,1.0,1.0) );
				float3 gammaToLinear266_g91117 = GammaToLinearSpace( hsvTorgb260_g91117 );
				float _IsBarkShader347_g91117 = _IsBarkShader;
				float _IsPlantShader360_g91117 = _IsPlantShader;
				float _IsAnyVegetationShader362_g91117 = saturate( ( _IsBarkShader347_g91117 + _IsPlantShader360_g91117 ) );
				float3 lerpResult290_g91117 = lerp( temp_cast_0 , gammaToLinear266_g91117 , _IsAnyVegetationShader362_g91117);
				float3 ifLocalVar40_g91255 = 0;
				if( Debug_Index464_g91117 == 16.0 )
				ifLocalVar40_g91255 = lerpResult290_g91117;
				float enc1154_g91117 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector21154_g91117 = DecodeFloatToVector2( enc1154_g91117 );
				float2 break1155_g91117 = localDecodeFloatToVector21154_g91117;
				float ifLocalVar40_g91256 = 0;
				if( Debug_Index464_g91117 == 17.0 )
				ifLocalVar40_g91256 = break1155_g91117.x;
				float ifLocalVar40_g91257 = 0;
				if( Debug_Index464_g91117 == 18.0 )
				ifLocalVar40_g91257 = break1155_g91117.y;
				float3 appendResult60_g91247 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				float3 ifLocalVar40_g91258 = 0;
				if( Debug_Index464_g91117 == 19.0 )
				ifLocalVar40_g91258 = appendResult60_g91247;
				float3 vertexToFrag328_g91117 = ( ( ifLocalVar40_g91123 + ifLocalVar40_g91141 + ifLocalVar40_g91154 + ifLocalVar40_g91138 ) + ( ifLocalVar40_g91238 + ifLocalVar40_g91239 + ifLocalVar40_g91240 + ifLocalVar40_g91241 ) + ( ifLocalVar40_g91248 + ifLocalVar40_g91249 + ifLocalVar40_g91250 ) + ( ifLocalVar40_g91251 + ifLocalVar40_g91252 + ifLocalVar40_g91253 + ifLocalVar40_g91254 ) + ( ifLocalVar40_g91255 + ifLocalVar40_g91256 + ifLocalVar40_g91257 + ifLocalVar40_g91258 ) );
				o.ase_texcoord11.xyz = vertexToFrag328_g91117;
				
				o.ase_texcoord8 = v.ase_texcoord;
				o.ase_texcoord9 = v.texcoord1.xyzw;
				o.ase_texcoord10 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord11.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
					o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#else
					o.lmap.zw = 0;
				#endif
				#ifdef LIGHTMAP_ON
					o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					#ifdef DIRLIGHTMAP_OFF
						o.lmapFadePos.xyz = (mul(unity_ObjectToWorld, v.vertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w;
						o.lmapFadePos.w = (-UnityObjectToViewPos(v.vertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w);
					#endif
				#else
					o.lmap.xy = 0;
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
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
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag (v2f IN , bool ase_vface : SV_IsFrontFace
				, out half4 outGBuffer0 : SV_Target0
				, out half4 outGBuffer1 : SV_Target1
				, out half4 outGBuffer2 : SV_Target2
				, out half4 outEmission : SV_Target3
				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
				, out half4 outShadowMask : SV_Target4
				#endif
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
			)
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				half atten = 1;

				float Debug_Type367_g91117 = TVE_DEBUG_Type;
				float4 color690_g91117 = IsGammaSpace() ? float4(0.25,0.25,0.25,0) : float4(0.05087609,0.05087609,0.05087609,0);
				float4 Shading_Inactive1492_g91117 = color690_g91117;
				float4 color646_g91117 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 color1359_g91117 = IsGammaSpace() ? float4(0,0.8683633,0.8862745,1) : float4(0,0.7262539,0.7605246,1);
				float _IsCollected1458_g91117 = _IsCollected;
				float4 lerpResult1360_g91117 = lerp( color646_g91117 , color1359_g91117 , _IsCollected1458_g91117);
				float _IsTVEShader647_g91117 = _IsTVEShader;
				float4 lerpResult1494_g91117 = lerp( Shading_Inactive1492_g91117 , lerpResult1360_g91117 , _IsTVEShader647_g91117);
				float dotResult1472_g91117 = dot( WorldNormal , worldViewDir );
				float temp_output_1526_0_g91117 = ( 1.0 - saturate( dotResult1472_g91117 ) );
				float Shading_Fresnel1469_g91117 = (( 1.0 - ( temp_output_1526_0_g91117 * temp_output_1526_0_g91117 ) )*0.3 + 0.7);
				float4 Output_Converted717_g91117 = ( lerpResult1494_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91301 = 0;
				if( Debug_Type367_g91117 == 0.0 )
				ifLocalVar40_g91301 = Output_Converted717_g91117;
				float4 color466_g91117 = IsGammaSpace() ? float4(0.8113208,0.4952317,0.264062,0) : float4(0.6231937,0.2096542,0.05668841,0);
				float _IsBarkShader347_g91117 = _IsBarkShader;
				float4 color472_g91117 = IsGammaSpace() ? float4(0.6196079,0.7686275,0.1490196,0) : float4(0.3419145,0.5520116,0.01938236,0);
				float _IsPlantShader360_g91117 = _IsPlantShader;
				float4 color478_g91117 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsPropShader346_g91117 = _IsPropShader;
				float4 lerpResult1502_g91117 = lerp( Shading_Inactive1492_g91117 , ( ( color466_g91117 * _IsBarkShader347_g91117 ) + ( color472_g91117 * _IsPlantShader360_g91117 ) + ( color478_g91117 * _IsPropShader346_g91117 ) ) , _IsTVEShader647_g91117);
				float4 Output_Shader445_g91117 = ( lerpResult1502_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91302 = 0;
				if( Debug_Type367_g91117 == 1.0 )
				ifLocalVar40_g91302 = Output_Shader445_g91117;
				float4 color1529_g91117 = IsGammaSpace() ? float4(0.9254902,0.7960784,0.4156863,1) : float4(0.8387991,0.5972018,0.1441285,1);
				float _IsCoreShader1551_g91117 = _IsCoreShader;
				float4 color1539_g91117 = IsGammaSpace() ? float4(0.6196079,0.7686275,0.1490196,0) : float4(0.3419145,0.5520116,0.01938236,0);
				float _IsBlanketShader1554_g91117 = _IsBlanketShader;
				float4 color1542_g91117 = IsGammaSpace() ? float4(0.9716981,0.3162602,0.4816265,0) : float4(0.9368213,0.08154967,0.1974273,0);
				float _IsImpostorShader1110_g91117 = _IsImpostorShader;
				float4 color1544_g91117 = IsGammaSpace() ? float4(0.3254902,0.6117647,0.8117647,0) : float4(0.08650047,0.3324516,0.6239604,0);
				float _IsPolygonalShader1112_g91117 = _IsPolygonalShader;
				float4 lerpResult1535_g91117 = lerp( Shading_Inactive1492_g91117 , ( ( color1529_g91117 * _IsCoreShader1551_g91117 ) + ( color1539_g91117 * _IsBlanketShader1554_g91117 ) + ( color1542_g91117 * _IsImpostorShader1110_g91117 ) + ( color1544_g91117 * _IsPolygonalShader1112_g91117 ) ) , _IsTVEShader647_g91117);
				float4 Output_Scope1531_g91117 = ( lerpResult1535_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91303 = 0;
				if( Debug_Type367_g91117 == 2.0 )
				ifLocalVar40_g91303 = Output_Scope1531_g91117;
				float4 color529_g91117 = IsGammaSpace() ? float4(0.62,0.77,0.15,0) : float4(0.3423916,0.5542217,0.01960665,0);
				float _IsVertexShader1158_g91117 = _IsVertexShader;
				float4 color544_g91117 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsSimpleShader359_g91117 = _IsSimpleShader;
				float4 color521_g91117 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsStandardShader344_g91117 = _IsStandardShader;
				float4 color1121_g91117 = IsGammaSpace() ? float4(0.9245283,0.8421515,0.1788003,0) : float4(0.8368256,0.677754,0.02687956,0);
				float _IsSubsurfaceShader548_g91117 = _IsSubsurfaceShader;
				float4 lerpResult1507_g91117 = lerp( Shading_Inactive1492_g91117 , ( ( color529_g91117 * _IsVertexShader1158_g91117 ) + ( color544_g91117 * _IsSimpleShader359_g91117 ) + ( color521_g91117 * _IsStandardShader344_g91117 ) + ( color1121_g91117 * _IsSubsurfaceShader548_g91117 ) ) , _IsTVEShader647_g91117);
				float4 Output_Lighting525_g91117 = ( lerpResult1507_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91304 = 0;
				if( Debug_Type367_g91117 == 3.0 )
				ifLocalVar40_g91304 = Output_Lighting525_g91117;
				float4 color1559_g91117 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 color1563_g91117 = IsGammaSpace() ? float4(0.972549,0.3176471,0.4823529,0) : float4(0.9386859,0.08228273,0.1980693,0);
				float _IsCustomShader1570_g91117 = _IsCustomShader;
				float4 lerpResult1561_g91117 = lerp( color1559_g91117 , color1563_g91117 , _IsCustomShader1570_g91117);
				float4 lerpResult1566_g91117 = lerp( Shading_Inactive1492_g91117 , lerpResult1561_g91117 , _IsTVEShader647_g91117);
				float4 Output_Custom1560_g91117 = ( lerpResult1566_g91117 * Shading_Fresnel1469_g91117 );
				float4 ifLocalVar40_g91305 = 0;
				if( Debug_Type367_g91117 == 4.0 )
				ifLocalVar40_g91305 = Output_Custom1560_g91117;
				float3 hsvTorgb1452_g91117 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
				float3 gammaToLinear1453_g91117 = GammaToLinearSpace( hsvTorgb1452_g91117 );
				float4 lerpResult1512_g91117 = lerp( Shading_Inactive1492_g91117 , float4( gammaToLinear1453_g91117 , 0.0 ) , _IsTVEShader647_g91117);
				float4 Output_Sharing1355_g91117 = lerpResult1512_g91117;
				float4 ifLocalVar40_g91306 = 0;
				if( Debug_Type367_g91117 == 5.0 )
				ifLocalVar40_g91306 = Output_Sharing1355_g91117;
				float Debug_Index464_g91117 = TVE_DEBUG_Index;
				half2 Main_UVs1219_g91117 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode586_g91117 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g91117 );
				float3 appendResult637_g91117 = (float3(tex2DNode586_g91117.r , tex2DNode586_g91117.g , tex2DNode586_g91117.b));
				float3 ifLocalVar40_g91140 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91140 = appendResult637_g91117;
				float ifLocalVar40_g91145 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91145 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g91117 ).a;
				float4 tex2DNode604_g91117 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g91117 );
				float3 appendResult876_g91117 = (float3(tex2DNode604_g91117.a , tex2DNode604_g91117.g , 1.0));
				float3 gammaToLinear878_g91117 = GammaToLinearSpace( appendResult876_g91117 );
				float3 ifLocalVar40_g91175 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91175 = gammaToLinear878_g91117;
				float ifLocalVar40_g91126 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91126 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).r;
				float ifLocalVar40_g91208 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91208 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).g;
				float ifLocalVar40_g91146 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91146 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).b;
				float ifLocalVar40_g91124 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91124 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g91117 ).a;
				float2 appendResult1251_g91117 = (float2(IN.ase_texcoord9.z , IN.ase_texcoord9.w));
				float2 Mesh_DetailCoord1254_g91117 = appendResult1251_g91117;
				float2 lerpResult1231_g91117 = lerp( IN.ase_texcoord8.xy , Mesh_DetailCoord1254_g91117 , _DetailCoordMode);
				half2 Second_UVs1234_g91117 = ( ( lerpResult1231_g91117 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode854_g91117 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs1234_g91117 );
				float3 appendResult839_g91117 = (float3(tex2DNode854_g91117.r , tex2DNode854_g91117.g , tex2DNode854_g91117.b));
				float3 ifLocalVar40_g91137 = 0;
				if( Debug_Index464_g91117 == 7.0 )
				ifLocalVar40_g91137 = appendResult839_g91117;
				float ifLocalVar40_g91153 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91153 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs1234_g91117 ).a;
				float4 tex2DNode841_g91117 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Second_UVs1234_g91117 );
				float3 appendResult880_g91117 = (float3(tex2DNode841_g91117.a , tex2DNode841_g91117.g , 1.0));
				float3 gammaToLinear879_g91117 = GammaToLinearSpace( appendResult880_g91117 );
				float3 ifLocalVar40_g91196 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91196 = gammaToLinear879_g91117;
				float ifLocalVar40_g91176 = 0;
				if( Debug_Index464_g91117 == 10.0 )
				ifLocalVar40_g91176 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).r;
				float ifLocalVar40_g91144 = 0;
				if( Debug_Index464_g91117 == 11.0 )
				ifLocalVar40_g91144 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).g;
				float ifLocalVar40_g91188 = 0;
				if( Debug_Index464_g91117 == 12.0 )
				ifLocalVar40_g91188 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).b;
				float ifLocalVar40_g91195 = 0;
				if( Debug_Index464_g91117 == 13.0 )
				ifLocalVar40_g91195 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Second_UVs1234_g91117 ).a;
				half2 Emissive_UVs1245_g91117 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float4 tex2DNode858_g91117 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g91117 );
				float ifLocalVar40_g91143 = 0;
				if( Debug_Index464_g91117 == 14.0 )
				ifLocalVar40_g91143 = tex2DNode858_g91117.r;
				float Debug_Min721_g91117 = TVE_DEBUG_Min;
				float temp_output_7_0_g91182 = Debug_Min721_g91117;
				float4 temp_cast_3 = (temp_output_7_0_g91182).xxxx;
				float Debug_Max723_g91117 = TVE_DEBUG_Max;
				float temp_output_10_0_g91182 = ( Debug_Max723_g91117 - temp_output_7_0_g91182 );
				float4 Output_Maps561_g91117 = saturate( ( ( ( float4( ( ( ifLocalVar40_g91140 + ifLocalVar40_g91145 + ifLocalVar40_g91175 ) + ( ifLocalVar40_g91126 + ifLocalVar40_g91208 + ifLocalVar40_g91146 + ifLocalVar40_g91124 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g91137 + ifLocalVar40_g91153 + ifLocalVar40_g91196 ) + ( ifLocalVar40_g91176 + ifLocalVar40_g91144 + ifLocalVar40_g91188 + ifLocalVar40_g91195 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g91143 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_3 ) / ( temp_output_10_0_g91182 + 0.0001 ) ) );
				float4 ifLocalVar40_g91307 = 0;
				if( Debug_Type367_g91117 == 6.0 )
				ifLocalVar40_g91307 = Output_Maps561_g91117;
				float Resolution44_g91226 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 color62_g91226 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91226 = 0;
				if( Resolution44_g91226 <= 256.0 )
				ifLocalVar61_g91226 = color62_g91226;
				float4 color55_g91226 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91226 = 0;
				if( Resolution44_g91226 == 512.0 )
				ifLocalVar56_g91226 = color55_g91226;
				float4 color42_g91226 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91226 = 0;
				if( Resolution44_g91226 == 1024.0 )
				ifLocalVar40_g91226 = color42_g91226;
				float4 color48_g91226 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91226 = 0;
				if( Resolution44_g91226 == 2048.0 )
				ifLocalVar47_g91226 = color48_g91226;
				float4 color51_g91226 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91226 = 0;
				if( Resolution44_g91226 >= 4096.0 )
				ifLocalVar52_g91226 = color51_g91226;
				float4 ifLocalVar40_g91212 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91212 = ( ifLocalVar61_g91226 + ifLocalVar56_g91226 + ifLocalVar40_g91226 + ifLocalVar47_g91226 + ifLocalVar52_g91226 );
				float Resolution44_g91225 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 color62_g91225 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91225 = 0;
				if( Resolution44_g91225 <= 256.0 )
				ifLocalVar61_g91225 = color62_g91225;
				float4 color55_g91225 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91225 = 0;
				if( Resolution44_g91225 == 512.0 )
				ifLocalVar56_g91225 = color55_g91225;
				float4 color42_g91225 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91225 = 0;
				if( Resolution44_g91225 == 1024.0 )
				ifLocalVar40_g91225 = color42_g91225;
				float4 color48_g91225 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91225 = 0;
				if( Resolution44_g91225 == 2048.0 )
				ifLocalVar47_g91225 = color48_g91225;
				float4 color51_g91225 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91225 = 0;
				if( Resolution44_g91225 >= 4096.0 )
				ifLocalVar52_g91225 = color51_g91225;
				float4 ifLocalVar40_g91210 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91210 = ( ifLocalVar61_g91225 + ifLocalVar56_g91225 + ifLocalVar40_g91225 + ifLocalVar47_g91225 + ifLocalVar52_g91225 );
				float Resolution44_g91224 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 color62_g91224 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91224 = 0;
				if( Resolution44_g91224 <= 256.0 )
				ifLocalVar61_g91224 = color62_g91224;
				float4 color55_g91224 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91224 = 0;
				if( Resolution44_g91224 == 512.0 )
				ifLocalVar56_g91224 = color55_g91224;
				float4 color42_g91224 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91224 = 0;
				if( Resolution44_g91224 == 1024.0 )
				ifLocalVar40_g91224 = color42_g91224;
				float4 color48_g91224 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91224 = 0;
				if( Resolution44_g91224 == 2048.0 )
				ifLocalVar47_g91224 = color48_g91224;
				float4 color51_g91224 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91224 = 0;
				if( Resolution44_g91224 >= 4096.0 )
				ifLocalVar52_g91224 = color51_g91224;
				float4 ifLocalVar40_g91211 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91211 = ( ifLocalVar61_g91224 + ifLocalVar56_g91224 + ifLocalVar40_g91224 + ifLocalVar47_g91224 + ifLocalVar52_g91224 );
				float Resolution44_g91231 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g91231 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91231 = 0;
				if( Resolution44_g91231 <= 256.0 )
				ifLocalVar61_g91231 = color62_g91231;
				float4 color55_g91231 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91231 = 0;
				if( Resolution44_g91231 == 512.0 )
				ifLocalVar56_g91231 = color55_g91231;
				float4 color42_g91231 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91231 = 0;
				if( Resolution44_g91231 == 1024.0 )
				ifLocalVar40_g91231 = color42_g91231;
				float4 color48_g91231 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91231 = 0;
				if( Resolution44_g91231 == 2048.0 )
				ifLocalVar47_g91231 = color48_g91231;
				float4 color51_g91231 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91231 = 0;
				if( Resolution44_g91231 >= 4096.0 )
				ifLocalVar52_g91231 = color51_g91231;
				float4 ifLocalVar40_g91218 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91218 = ( ifLocalVar61_g91231 + ifLocalVar56_g91231 + ifLocalVar40_g91231 + ifLocalVar47_g91231 + ifLocalVar52_g91231 );
				float Resolution44_g91230 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 color62_g91230 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91230 = 0;
				if( Resolution44_g91230 <= 256.0 )
				ifLocalVar61_g91230 = color62_g91230;
				float4 color55_g91230 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91230 = 0;
				if( Resolution44_g91230 == 512.0 )
				ifLocalVar56_g91230 = color55_g91230;
				float4 color42_g91230 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91230 = 0;
				if( Resolution44_g91230 == 1024.0 )
				ifLocalVar40_g91230 = color42_g91230;
				float4 color48_g91230 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91230 = 0;
				if( Resolution44_g91230 == 2048.0 )
				ifLocalVar47_g91230 = color48_g91230;
				float4 color51_g91230 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91230 = 0;
				if( Resolution44_g91230 >= 4096.0 )
				ifLocalVar52_g91230 = color51_g91230;
				float4 ifLocalVar40_g91216 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91216 = ( ifLocalVar61_g91230 + ifLocalVar56_g91230 + ifLocalVar40_g91230 + ifLocalVar47_g91230 + ifLocalVar52_g91230 );
				float Resolution44_g91232 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g91232 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91232 = 0;
				if( Resolution44_g91232 <= 256.0 )
				ifLocalVar61_g91232 = color62_g91232;
				float4 color55_g91232 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91232 = 0;
				if( Resolution44_g91232 == 512.0 )
				ifLocalVar56_g91232 = color55_g91232;
				float4 color42_g91232 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91232 = 0;
				if( Resolution44_g91232 == 1024.0 )
				ifLocalVar40_g91232 = color42_g91232;
				float4 color48_g91232 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91232 = 0;
				if( Resolution44_g91232 == 2048.0 )
				ifLocalVar47_g91232 = color48_g91232;
				float4 color51_g91232 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91232 = 0;
				if( Resolution44_g91232 >= 4096.0 )
				ifLocalVar52_g91232 = color51_g91232;
				float4 ifLocalVar40_g91217 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91217 = ( ifLocalVar61_g91232 + ifLocalVar56_g91232 + ifLocalVar40_g91232 + ifLocalVar47_g91232 + ifLocalVar52_g91232 );
				float Resolution44_g91229 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 color62_g91229 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g91229 = 0;
				if( Resolution44_g91229 <= 256.0 )
				ifLocalVar61_g91229 = color62_g91229;
				float4 color55_g91229 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g91229 = 0;
				if( Resolution44_g91229 == 512.0 )
				ifLocalVar56_g91229 = color55_g91229;
				float4 color42_g91229 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g91229 = 0;
				if( Resolution44_g91229 == 1024.0 )
				ifLocalVar40_g91229 = color42_g91229;
				float4 color48_g91229 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g91229 = 0;
				if( Resolution44_g91229 == 2048.0 )
				ifLocalVar47_g91229 = color48_g91229;
				float4 color51_g91229 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g91229 = 0;
				if( Resolution44_g91229 >= 4096.0 )
				ifLocalVar52_g91229 = color51_g91229;
				float4 ifLocalVar40_g91219 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91219 = ( ifLocalVar61_g91229 + ifLocalVar56_g91229 + ifLocalVar40_g91229 + ifLocalVar47_g91229 + ifLocalVar52_g91229 );
				float4 Output_Resolution737_g91117 = ( ( ifLocalVar40_g91212 + ifLocalVar40_g91210 + ifLocalVar40_g91211 ) + ( ifLocalVar40_g91218 + ifLocalVar40_g91216 + ifLocalVar40_g91217 ) + ifLocalVar40_g91219 );
				float4 ifLocalVar40_g91308 = 0;
				if( Debug_Type367_g91117 == 7.0 )
				ifLocalVar40_g91308 = Output_Resolution737_g91117;
				float2 uv_MainAlbedoTex = IN.ase_texcoord8.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
				float2 UVs72_g91237 = Main_UVs1219_g91117;
				float Resolution44_g91237 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g91237 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91237 * ( Resolution44_g91237 / 8.0 ) ) );
				float4 lerpResult78_g91237 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g91237 , tex2DNode77_g91237.a);
				float4 ifLocalVar40_g91215 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91215 = lerpResult78_g91237;
				float2 uv_MainNormalTex = IN.ase_texcoord8.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
				float2 UVs72_g91228 = Main_UVs1219_g91117;
				float Resolution44_g91228 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 tex2DNode77_g91228 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91228 * ( Resolution44_g91228 / 8.0 ) ) );
				float4 lerpResult78_g91228 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g91228 , tex2DNode77_g91228.a);
				float4 ifLocalVar40_g91213 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91213 = lerpResult78_g91228;
				float2 uv_MainMaskTex = IN.ase_texcoord8.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
				float2 UVs72_g91227 = Main_UVs1219_g91117;
				float Resolution44_g91227 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 tex2DNode77_g91227 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91227 * ( Resolution44_g91227 / 8.0 ) ) );
				float4 lerpResult78_g91227 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g91227 , tex2DNode77_g91227.a);
				float4 ifLocalVar40_g91214 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91214 = lerpResult78_g91227;
				float2 uv_SecondAlbedoTex = IN.ase_texcoord8.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
				float2 UVs72_g91235 = Second_UVs1234_g91117;
				float Resolution44_g91235 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g91235 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91235 * ( Resolution44_g91235 / 8.0 ) ) );
				float4 lerpResult78_g91235 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g91235 , tex2DNode77_g91235.a);
				float4 ifLocalVar40_g91222 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91222 = lerpResult78_g91235;
				float2 uv_SecondMaskTex = IN.ase_texcoord8.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
				float2 UVs72_g91234 = Second_UVs1234_g91117;
				float Resolution44_g91234 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 tex2DNode77_g91234 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91234 * ( Resolution44_g91234 / 8.0 ) ) );
				float4 lerpResult78_g91234 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g91234 , tex2DNode77_g91234.a);
				float4 ifLocalVar40_g91220 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91220 = lerpResult78_g91234;
				float2 UVs72_g91236 = Second_UVs1234_g91117;
				float Resolution44_g91236 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g91236 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91236 * ( Resolution44_g91236 / 8.0 ) ) );
				float4 lerpResult78_g91236 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g91236 , tex2DNode77_g91236.a);
				float4 ifLocalVar40_g91221 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91221 = lerpResult78_g91236;
				float2 uv_EmissiveTex = IN.ase_texcoord8.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
				float2 UVs72_g91233 = Emissive_UVs1245_g91117;
				float Resolution44_g91233 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 tex2DNode77_g91233 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g91233 * ( Resolution44_g91233 / 8.0 ) ) );
				float4 lerpResult78_g91233 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g91233 , tex2DNode77_g91233.a);
				float4 ifLocalVar40_g91223 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91223 = lerpResult78_g91233;
				float4 Output_MipLevel1284_g91117 = ( ( ifLocalVar40_g91215 + ifLocalVar40_g91213 + ifLocalVar40_g91214 ) + ( ifLocalVar40_g91222 + ifLocalVar40_g91220 + ifLocalVar40_g91221 ) + ifLocalVar40_g91223 );
				float4 ifLocalVar40_g91309 = 0;
				if( Debug_Type367_g91117 == 8.0 )
				ifLocalVar40_g91309 = Output_MipLevel1284_g91117;
				float3 WorldPosition893_g91117 = worldPos;
				half3 Input_Position419_g91265 = WorldPosition893_g91117;
				float Input_MotionScale287_g91265 = ( _MotionScale_10 + 0.2 );
				float2 temp_output_597_0_g91265 = (( Input_Position419_g91265 * Input_MotionScale287_g91265 * 0.0075 )).xz;
				float2 temp_output_447_0_g91269 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Wind_DirectionWS1031_g91117 = temp_output_447_0_g91269;
				half2 Input_DirectionWS423_g91265 = Wind_DirectionWS1031_g91117;
				float lerpResult115_g91266 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g91265 = _MotionSpeed_10;
				half Input_MotionVariation284_g91265 = _MotionVariation_10;
				float4x4 break19_g91272 = unity_ObjectToWorld;
				float3 appendResult20_g91272 = (float3(break19_g91272[ 0 ][ 3 ] , break19_g91272[ 1 ][ 3 ] , break19_g91272[ 2 ][ 3 ]));
				float3 appendResult60_g91271 = (float3(IN.ase_texcoord10.x , IN.ase_texcoord10.z , IN.ase_texcoord10.y));
				float3 temp_output_122_0_g91272 = ( appendResult60_g91271 * _VertexPivotMode );
				float3 PivotsOnly105_g91272 = (mul( unity_ObjectToWorld, float4( temp_output_122_0_g91272 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g91274 = ( appendResult20_g91272 + PivotsOnly105_g91272 );
				half3 WorldData19_g91274 = worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g91274 = WorldData19_g91274;
				#else
				float3 staticSwitch14_g91274 = ObjectData20_g91274;
				#endif
				float3 temp_output_114_0_g91272 = staticSwitch14_g91274;
				half3 ObjectData20_g91264 = temp_output_114_0_g91272;
				half3 WorldData19_g91264 = worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g91264 = WorldData19_g91264;
				#else
				float3 staticSwitch14_g91264 = ObjectData20_g91264;
				#endif
				float3 ObjectPosition890_g91117 = staticSwitch14_g91264;
				half3 Input_Position167_g91281 = ObjectPosition890_g91117;
				float dotResult156_g91281 = dot( (Input_Position167_g91281).xz , float2( 12.9898,78.233 ) );
				half Input_DynamicMode120_g91281 = _VertexDynamicMode;
				float Postion_Random162_g91281 = ( sin( dotResult156_g91281 ) * ( 1.0 - Input_DynamicMode120_g91281 ) );
				half Input_Variation124_g91281 = IN.ase_color.r;
				half ObjectData20_g91283 = frac( ( Postion_Random162_g91281 + Input_Variation124_g91281 ) );
				half WorldData19_g91283 = Input_Variation124_g91281;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g91283 = WorldData19_g91283;
				#else
				float staticSwitch14_g91283 = ObjectData20_g91283;
				#endif
				float temp_output_112_0_g91281 = staticSwitch14_g91283;
				float clampResult171_g91281 = clamp( temp_output_112_0_g91281 , 0.01 , 0.99 );
				half Global_MeshVariation1176_g91117 = clampResult171_g91281;
				half Input_GlobalMeshVariation569_g91265 = Global_MeshVariation1176_g91117;
				float temp_output_630_0_g91265 = ( ( ( lerpResult115_g91266 * Input_MotionSpeed62_g91265 ) + ( Input_MotionVariation284_g91265 * Input_GlobalMeshVariation569_g91265 ) ) * 0.03 );
				float temp_output_607_0_g91265 = frac( temp_output_630_0_g91265 );
				float4 lerpResult590_g91265 = lerp( SAMPLE_TEXTURE2D( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g91265 + ( -Input_DirectionWS423_g91265 * temp_output_607_0_g91265 ) ) ) , SAMPLE_TEXTURE2D( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g91265 + ( -Input_DirectionWS423_g91265 * frac( ( temp_output_630_0_g91265 + 0.5 ) ) ) ) ) , ( abs( ( temp_output_607_0_g91265 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g91265 = lerpResult590_g91265;
				float2 temp_output_645_0_g91265 = ((Noise_Complex703_g91265).rg*2.0 + -1.0);
				float2 break650_g91265 = temp_output_645_0_g91265;
				float3 appendResult649_g91265 = (float3(break650_g91265.x , 0.0 , break650_g91265.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ) );
				half2 Motion_Noise915_g91117 = (( mul( unity_WorldToObject, float4( appendResult649_g91265 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				float3 appendResult1180_g91117 = (float3(Motion_Noise915_g91117 , 0.0));
				float3 ifLocalVar40_g91127 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91127 = appendResult1180_g91117;
				float Debug_Layer885_g91117 = TVE_DEBUG_Layer;
				float temp_output_82_0_g91170 = Debug_Layer885_g91117;
				float temp_output_19_0_g91174 = TVE_ColorsUsage[(int)temp_output_82_0_g91170];
				float4 temp_output_91_19_g91170 = TVE_ColorsCoords;
				half2 UV94_g91170 = ( (temp_output_91_19_g91170).zw + ( (temp_output_91_19_g91170).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode83_g91170 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, float3(UV94_g91170,temp_output_82_0_g91170), 0.0 );
				float4 temp_output_17_0_g91174 = tex2DArrayNode83_g91170;
				float4 temp_output_92_86_g91170 = TVE_ColorsParams;
				float4 temp_output_3_0_g91174 = temp_output_92_86_g91170;
				float4 ifLocalVar18_g91174 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91174 >= 0.5 )
				ifLocalVar18_g91174 = temp_output_17_0_g91174;
				else
				ifLocalVar18_g91174 = temp_output_3_0_g91174;
				float4 lerpResult22_g91174 = lerp( temp_output_3_0_g91174 , temp_output_17_0_g91174 , temp_output_19_0_g91174);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91174 = lerpResult22_g91174;
				#else
				float4 staticSwitch24_g91174 = ifLocalVar18_g91174;
				#endif
				float3 ifLocalVar40_g91142 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91142 = (staticSwitch24_g91174).rgb;
				float temp_output_82_0_g91155 = Debug_Layer885_g91117;
				float temp_output_19_0_g91159 = TVE_ColorsUsage[(int)temp_output_82_0_g91155];
				float4 temp_output_91_19_g91155 = TVE_ColorsCoords;
				half2 UV94_g91155 = ( (temp_output_91_19_g91155).zw + ( (temp_output_91_19_g91155).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode83_g91155 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, float3(UV94_g91155,temp_output_82_0_g91155), 0.0 );
				float4 temp_output_17_0_g91159 = tex2DArrayNode83_g91155;
				float4 temp_output_92_86_g91155 = TVE_ColorsParams;
				float4 temp_output_3_0_g91159 = temp_output_92_86_g91155;
				float4 ifLocalVar18_g91159 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91159 >= 0.5 )
				ifLocalVar18_g91159 = temp_output_17_0_g91159;
				else
				ifLocalVar18_g91159 = temp_output_3_0_g91159;
				float4 lerpResult22_g91159 = lerp( temp_output_3_0_g91159 , temp_output_17_0_g91159 , temp_output_19_0_g91159);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91159 = lerpResult22_g91159;
				#else
				float4 staticSwitch24_g91159 = ifLocalVar18_g91159;
				#endif
				float ifLocalVar40_g91152 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91152 = saturate( (staticSwitch24_g91159).a );
				float temp_output_84_0_g91165 = Debug_Layer885_g91117;
				float temp_output_19_0_g91169 = TVE_ExtrasUsage[(int)temp_output_84_0_g91165];
				float4 temp_output_93_19_g91165 = TVE_ExtrasCoords;
				half2 UV96_g91165 = ( (temp_output_93_19_g91165).zw + ( (temp_output_93_19_g91165).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91165 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91165,temp_output_84_0_g91165), 0.0 );
				float4 temp_output_17_0_g91169 = tex2DArrayNode48_g91165;
				float4 temp_output_94_85_g91165 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91169 = temp_output_94_85_g91165;
				float4 ifLocalVar18_g91169 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91169 >= 0.5 )
				ifLocalVar18_g91169 = temp_output_17_0_g91169;
				else
				ifLocalVar18_g91169 = temp_output_3_0_g91169;
				float4 lerpResult22_g91169 = lerp( temp_output_3_0_g91169 , temp_output_17_0_g91169 , temp_output_19_0_g91169);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91169 = lerpResult22_g91169;
				#else
				float4 staticSwitch24_g91169 = ifLocalVar18_g91169;
				#endif
				float ifLocalVar40_g91135 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91135 = (staticSwitch24_g91169).r;
				float temp_output_84_0_g91118 = Debug_Layer885_g91117;
				float temp_output_19_0_g91122 = TVE_ExtrasUsage[(int)temp_output_84_0_g91118];
				float4 temp_output_93_19_g91118 = TVE_ExtrasCoords;
				half2 UV96_g91118 = ( (temp_output_93_19_g91118).zw + ( (temp_output_93_19_g91118).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91118 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91118,temp_output_84_0_g91118), 0.0 );
				float4 temp_output_17_0_g91122 = tex2DArrayNode48_g91118;
				float4 temp_output_94_85_g91118 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91122 = temp_output_94_85_g91118;
				float4 ifLocalVar18_g91122 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91122 >= 0.5 )
				ifLocalVar18_g91122 = temp_output_17_0_g91122;
				else
				ifLocalVar18_g91122 = temp_output_3_0_g91122;
				float4 lerpResult22_g91122 = lerp( temp_output_3_0_g91122 , temp_output_17_0_g91122 , temp_output_19_0_g91122);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91122 = lerpResult22_g91122;
				#else
				float4 staticSwitch24_g91122 = ifLocalVar18_g91122;
				#endif
				float ifLocalVar40_g91207 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91207 = (staticSwitch24_g91122).g;
				float temp_output_84_0_g91177 = Debug_Layer885_g91117;
				float temp_output_19_0_g91181 = TVE_ExtrasUsage[(int)temp_output_84_0_g91177];
				float4 temp_output_93_19_g91177 = TVE_ExtrasCoords;
				half2 UV96_g91177 = ( (temp_output_93_19_g91177).zw + ( (temp_output_93_19_g91177).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91177 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91177,temp_output_84_0_g91177), 0.0 );
				float4 temp_output_17_0_g91181 = tex2DArrayNode48_g91177;
				float4 temp_output_94_85_g91177 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91181 = temp_output_94_85_g91177;
				float4 ifLocalVar18_g91181 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91181 >= 0.5 )
				ifLocalVar18_g91181 = temp_output_17_0_g91181;
				else
				ifLocalVar18_g91181 = temp_output_3_0_g91181;
				float4 lerpResult22_g91181 = lerp( temp_output_3_0_g91181 , temp_output_17_0_g91181 , temp_output_19_0_g91181);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91181 = lerpResult22_g91181;
				#else
				float4 staticSwitch24_g91181 = ifLocalVar18_g91181;
				#endif
				float ifLocalVar40_g91136 = 0;
				if( Debug_Index464_g91117 == 5.0 )
				ifLocalVar40_g91136 = (staticSwitch24_g91181).b;
				float temp_output_84_0_g91197 = Debug_Layer885_g91117;
				float temp_output_19_0_g91201 = TVE_ExtrasUsage[(int)temp_output_84_0_g91197];
				float4 temp_output_93_19_g91197 = TVE_ExtrasCoords;
				half2 UV96_g91197 = ( (temp_output_93_19_g91197).zw + ( (temp_output_93_19_g91197).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode48_g91197 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, float3(UV96_g91197,temp_output_84_0_g91197), 0.0 );
				float4 temp_output_17_0_g91201 = tex2DArrayNode48_g91197;
				float4 temp_output_94_85_g91197 = TVE_ExtrasParams;
				float4 temp_output_3_0_g91201 = temp_output_94_85_g91197;
				float4 ifLocalVar18_g91201 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91201 >= 0.5 )
				ifLocalVar18_g91201 = temp_output_17_0_g91201;
				else
				ifLocalVar18_g91201 = temp_output_3_0_g91201;
				float4 lerpResult22_g91201 = lerp( temp_output_3_0_g91201 , temp_output_17_0_g91201 , temp_output_19_0_g91201);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91201 = lerpResult22_g91201;
				#else
				float4 staticSwitch24_g91201 = ifLocalVar18_g91201;
				#endif
				float ifLocalVar40_g91129 = 0;
				if( Debug_Index464_g91117 == 6.0 )
				ifLocalVar40_g91129 = saturate( (staticSwitch24_g91201).a );
				float temp_output_84_0_g91160 = Debug_Layer885_g91117;
				float temp_output_19_0_g91164 = TVE_MotionUsage[(int)temp_output_84_0_g91160];
				float4 temp_output_91_19_g91160 = TVE_MotionCoords;
				half2 UV94_g91160 = ( (temp_output_91_19_g91160).zw + ( (temp_output_91_19_g91160).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91160 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g91160,temp_output_84_0_g91160), 0.0 );
				float4 temp_output_17_0_g91164 = tex2DArrayNode50_g91160;
				float4 temp_output_112_19_g91160 = TVE_MotionParams;
				float4 temp_output_3_0_g91164 = temp_output_112_19_g91160;
				float4 ifLocalVar18_g91164 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91164 >= 0.5 )
				ifLocalVar18_g91164 = temp_output_17_0_g91164;
				else
				ifLocalVar18_g91164 = temp_output_3_0_g91164;
				float4 lerpResult22_g91164 = lerp( temp_output_3_0_g91164 , temp_output_17_0_g91164 , temp_output_19_0_g91164);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91164 = lerpResult22_g91164;
				#else
				float4 staticSwitch24_g91164 = ifLocalVar18_g91164;
				#endif
				float3 appendResult1012_g91117 = (float3((staticSwitch24_g91164).rg , 0.0));
				float3 ifLocalVar40_g91125 = 0;
				if( Debug_Index464_g91117 == 7.0 )
				ifLocalVar40_g91125 = appendResult1012_g91117;
				float temp_output_84_0_g91183 = Debug_Layer885_g91117;
				float temp_output_19_0_g91187 = TVE_MotionUsage[(int)temp_output_84_0_g91183];
				float4 temp_output_91_19_g91183 = TVE_MotionCoords;
				half2 UV94_g91183 = ( (temp_output_91_19_g91183).zw + ( (temp_output_91_19_g91183).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91183 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g91183,temp_output_84_0_g91183), 0.0 );
				float4 temp_output_17_0_g91187 = tex2DArrayNode50_g91183;
				float4 temp_output_112_19_g91183 = TVE_MotionParams;
				float4 temp_output_3_0_g91187 = temp_output_112_19_g91183;
				float4 ifLocalVar18_g91187 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91187 >= 0.5 )
				ifLocalVar18_g91187 = temp_output_17_0_g91187;
				else
				ifLocalVar18_g91187 = temp_output_3_0_g91187;
				float4 lerpResult22_g91187 = lerp( temp_output_3_0_g91187 , temp_output_17_0_g91187 , temp_output_19_0_g91187);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91187 = lerpResult22_g91187;
				#else
				float4 staticSwitch24_g91187 = ifLocalVar18_g91187;
				#endif
				float ifLocalVar40_g91139 = 0;
				if( Debug_Index464_g91117 == 8.0 )
				ifLocalVar40_g91139 = (staticSwitch24_g91187).b;
				float temp_output_84_0_g91189 = Debug_Layer885_g91117;
				float temp_output_19_0_g91193 = TVE_MotionUsage[(int)temp_output_84_0_g91189];
				float4 temp_output_91_19_g91189 = TVE_MotionCoords;
				half2 UV94_g91189 = ( (temp_output_91_19_g91189).zw + ( (temp_output_91_19_g91189).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91189 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, float3(UV94_g91189,temp_output_84_0_g91189), 0.0 );
				float4 temp_output_17_0_g91193 = tex2DArrayNode50_g91189;
				float4 temp_output_112_19_g91189 = TVE_MotionParams;
				float4 temp_output_3_0_g91193 = temp_output_112_19_g91189;
				float4 ifLocalVar18_g91193 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91193 >= 0.5 )
				ifLocalVar18_g91193 = temp_output_17_0_g91193;
				else
				ifLocalVar18_g91193 = temp_output_3_0_g91193;
				float4 lerpResult22_g91193 = lerp( temp_output_3_0_g91193 , temp_output_17_0_g91193 , temp_output_19_0_g91193);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91193 = lerpResult22_g91193;
				#else
				float4 staticSwitch24_g91193 = ifLocalVar18_g91193;
				#endif
				float ifLocalVar40_g91194 = 0;
				if( Debug_Index464_g91117 == 9.0 )
				ifLocalVar40_g91194 = saturate( (staticSwitch24_g91193).a );
				float temp_output_84_0_g91147 = Debug_Layer885_g91117;
				float temp_output_19_0_g91151 = TVE_VertexUsage[(int)temp_output_84_0_g91147];
				float4 temp_output_94_19_g91147 = TVE_VertexCoords;
				half2 UV97_g91147 = ( (temp_output_94_19_g91147).zw + ( (temp_output_94_19_g91147).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91147 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g91147,temp_output_84_0_g91147), 0.0 );
				float4 temp_output_17_0_g91151 = tex2DArrayNode50_g91147;
				float4 temp_output_111_19_g91147 = TVE_VertexParams;
				float4 temp_output_3_0_g91151 = temp_output_111_19_g91147;
				float4 ifLocalVar18_g91151 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91151 >= 0.5 )
				ifLocalVar18_g91151 = temp_output_17_0_g91151;
				else
				ifLocalVar18_g91151 = temp_output_3_0_g91151;
				float4 lerpResult22_g91151 = lerp( temp_output_3_0_g91151 , temp_output_17_0_g91151 , temp_output_19_0_g91151);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91151 = lerpResult22_g91151;
				#else
				float4 staticSwitch24_g91151 = ifLocalVar18_g91151;
				#endif
				float3 appendResult1013_g91117 = (float3((staticSwitch24_g91151).rg , 0.0));
				float3 ifLocalVar40_g91313 = 0;
				if( Debug_Index464_g91117 == 10.0 )
				ifLocalVar40_g91313 = appendResult1013_g91117;
				float temp_output_84_0_g91130 = Debug_Layer885_g91117;
				float temp_output_19_0_g91134 = TVE_VertexUsage[(int)temp_output_84_0_g91130];
				float4 temp_output_94_19_g91130 = TVE_VertexCoords;
				half2 UV97_g91130 = ( (temp_output_94_19_g91130).zw + ( (temp_output_94_19_g91130).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91130 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g91130,temp_output_84_0_g91130), 0.0 );
				float4 temp_output_17_0_g91134 = tex2DArrayNode50_g91130;
				float4 temp_output_111_19_g91130 = TVE_VertexParams;
				float4 temp_output_3_0_g91134 = temp_output_111_19_g91130;
				float4 ifLocalVar18_g91134 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91134 >= 0.5 )
				ifLocalVar18_g91134 = temp_output_17_0_g91134;
				else
				ifLocalVar18_g91134 = temp_output_3_0_g91134;
				float4 lerpResult22_g91134 = lerp( temp_output_3_0_g91134 , temp_output_17_0_g91134 , temp_output_19_0_g91134);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91134 = lerpResult22_g91134;
				#else
				float4 staticSwitch24_g91134 = ifLocalVar18_g91134;
				#endif
				float ifLocalVar40_g91287 = 0;
				if( Debug_Index464_g91117 == 11.0 )
				ifLocalVar40_g91287 = saturate( (staticSwitch24_g91134).b );
				float temp_output_84_0_g91202 = Debug_Layer885_g91117;
				float temp_output_19_0_g91206 = TVE_VertexUsage[(int)temp_output_84_0_g91202];
				float4 temp_output_94_19_g91202 = TVE_VertexCoords;
				half2 UV97_g91202 = ( (temp_output_94_19_g91202).zw + ( (temp_output_94_19_g91202).xy * (WorldPosition893_g91117).xz ) );
				float4 tex2DArrayNode50_g91202 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, float3(UV97_g91202,temp_output_84_0_g91202), 0.0 );
				float4 temp_output_17_0_g91206 = tex2DArrayNode50_g91202;
				float4 temp_output_111_19_g91202 = TVE_VertexParams;
				float4 temp_output_3_0_g91206 = temp_output_111_19_g91202;
				float4 ifLocalVar18_g91206 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g91206 >= 0.5 )
				ifLocalVar18_g91206 = temp_output_17_0_g91206;
				else
				ifLocalVar18_g91206 = temp_output_3_0_g91206;
				float4 lerpResult22_g91206 = lerp( temp_output_3_0_g91206 , temp_output_17_0_g91206 , temp_output_19_0_g91206);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g91206 = lerpResult22_g91206;
				#else
				float4 staticSwitch24_g91206 = ifLocalVar18_g91206;
				#endif
				float ifLocalVar40_g91288 = 0;
				if( Debug_Index464_g91117 == 12.0 )
				ifLocalVar40_g91288 = saturate( (staticSwitch24_g91206).a );
				float temp_output_7_0_g91209 = Debug_Min721_g91117;
				float3 temp_cast_44 = (temp_output_7_0_g91209).xxx;
				float temp_output_10_0_g91209 = ( Debug_Max723_g91117 - temp_output_7_0_g91209 );
				float3 Output_Globals888_g91117 = saturate( ( ( ( ifLocalVar40_g91127 + ( ifLocalVar40_g91142 + ifLocalVar40_g91152 ) + ( ifLocalVar40_g91135 + ifLocalVar40_g91207 + ifLocalVar40_g91136 + ifLocalVar40_g91129 ) + ( ifLocalVar40_g91125 + ifLocalVar40_g91139 + ifLocalVar40_g91194 ) + ( ifLocalVar40_g91313 + ifLocalVar40_g91287 + ifLocalVar40_g91288 ) ) - temp_cast_44 ) / ( temp_output_10_0_g91209 + 0.0001 ) ) );
				float3 ifLocalVar40_g91310 = 0;
				if( Debug_Type367_g91117 == 9.0 )
				ifLocalVar40_g91310 = Output_Globals888_g91117;
				float4 temp_output_35_0_g91293 = TVE_ColorsCoords;
				float temp_output_7_0_g91294 = 1.0;
				float2 temp_cast_46 = (temp_output_7_0_g91294).xx;
				float temp_output_10_0_g91294 = ( 1.0 - temp_output_7_0_g91294 );
				float2 temp_output_1583_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91293).zw + ( (temp_output_35_0_g91293).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_46 ) / temp_output_10_0_g91294 ) );
				float2 temp_output_1582_0_g91117 = ( temp_output_1583_0_g91117 * temp_output_1583_0_g91117 );
				float3 ifLocalVar40_g91314 = 0;
				if( Debug_Index464_g91117 == 0.0 )
				ifLocalVar40_g91314 = ( ( 1.0 - saturate( ( (temp_output_1582_0_g91117).x + (temp_output_1582_0_g91117).y ) ) ) * float3(0.5,0,0) );
				float4 temp_output_35_0_g91295 = TVE_ExtrasCoords;
				float temp_output_7_0_g91296 = 1.0;
				float2 temp_cast_47 = (temp_output_7_0_g91296).xx;
				float temp_output_10_0_g91296 = ( 1.0 - temp_output_7_0_g91296 );
				float2 temp_output_1602_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91295).zw + ( (temp_output_35_0_g91295).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_47 ) / temp_output_10_0_g91296 ) );
				float2 temp_output_1595_0_g91117 = ( temp_output_1602_0_g91117 * temp_output_1602_0_g91117 );
				float3 ifLocalVar40_g91315 = 0;
				if( Debug_Index464_g91117 == 1.0 )
				ifLocalVar40_g91315 = ( ( 1.0 - saturate( ( (temp_output_1595_0_g91117).x + (temp_output_1595_0_g91117).y ) ) ) * float3(0,0.5,0) );
				float4 temp_output_35_0_g91297 = TVE_MotionCoords;
				float temp_output_7_0_g91298 = 1.0;
				float2 temp_cast_48 = (temp_output_7_0_g91298).xx;
				float temp_output_10_0_g91298 = ( 1.0 - temp_output_7_0_g91298 );
				float2 temp_output_1615_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91297).zw + ( (temp_output_35_0_g91297).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_48 ) / temp_output_10_0_g91298 ) );
				float2 temp_output_1609_0_g91117 = ( temp_output_1615_0_g91117 * temp_output_1615_0_g91117 );
				float3 ifLocalVar40_g91316 = 0;
				if( Debug_Index464_g91117 == 2.0 )
				ifLocalVar40_g91316 = ( ( 1.0 - saturate( ( (temp_output_1609_0_g91117).x + (temp_output_1609_0_g91117).y ) ) ) * float3(0,0,1) );
				float4 temp_output_35_0_g91299 = TVE_VertexCoords;
				float temp_output_7_0_g91300 = 1.0;
				float2 temp_cast_49 = (temp_output_7_0_g91300).xx;
				float temp_output_10_0_g91300 = ( 1.0 - temp_output_7_0_g91300 );
				float2 temp_output_1628_0_g91117 = saturate( ( ( abs( (( (temp_output_35_0_g91299).zw + ( (temp_output_35_0_g91299).xy * (worldPos).xz ) )*2.0 + -1.0) ) - temp_cast_49 ) / temp_output_10_0_g91300 ) );
				float2 temp_output_1622_0_g91117 = ( temp_output_1628_0_g91117 * temp_output_1628_0_g91117 );
				float3 ifLocalVar40_g91317 = 0;
				if( Debug_Index464_g91117 == 3.0 )
				ifLocalVar40_g91317 = ( ( 1.0 - saturate( ( (temp_output_1622_0_g91117).x + (temp_output_1622_0_g91117).y ) ) ) * float3(0.5,0.5,0.5) );
				float3 Output_Volume1591_g91117 = saturate( ( ifLocalVar40_g91314 + ifLocalVar40_g91315 + ifLocalVar40_g91316 + ifLocalVar40_g91317 ) );
				float3 ifLocalVar40_g91311 = 0;
				if( Debug_Type367_g91117 == 10.0 )
				ifLocalVar40_g91311 = Output_Volume1591_g91117;
				float3 vertexToFrag328_g91117 = IN.ase_texcoord11.xyz;
				float4 color1016_g91117 = IsGammaSpace() ? float4(0.5831653,0.6037736,0.2135992,0) : float4(0.2992498,0.3229691,0.03750122,0);
				float4 color1017_g91117 = IsGammaSpace() ? float4(0.8117647,0.3488252,0.2627451,0) : float4(0.6239604,0.0997834,0.05612849,0);
				float4 switchResult1015_g91117 = (((ase_vface>0)?(color1016_g91117):(color1017_g91117)));
				float3 ifLocalVar40_g91128 = 0;
				if( Debug_Index464_g91117 == 4.0 )
				ifLocalVar40_g91128 = (switchResult1015_g91117).rgb;
				float temp_output_7_0_g91286 = Debug_Min721_g91117;
				float3 temp_cast_51 = (temp_output_7_0_g91286).xxx;
				float temp_output_10_0_g91286 = ( Debug_Max723_g91117 - temp_output_7_0_g91286 );
				float Debug_Filter322_g91117 = TVE_DEBUG_Filter;
				float lerpResult1524_g91117 = lerp( 1.0 , _IsTVEShader647_g91117 , Debug_Filter322_g91117);
				float4 lerpResult1517_g91117 = lerp( Shading_Inactive1492_g91117 , float4( saturate( ( ( ( vertexToFrag328_g91117 + ifLocalVar40_g91128 ) - temp_cast_51 ) / ( temp_output_10_0_g91286 + 0.0001 ) ) ) , 0.0 ) , lerpResult1524_g91117);
				float4 Output_Mesh316_g91117 = lerpResult1517_g91117;
				float4 ifLocalVar40_g91312 = 0;
				if( Debug_Type367_g91117 == 11.0 )
				ifLocalVar40_g91312 = Output_Mesh316_g91117;
				float Debug_Clip623_g91117 = TVE_DEBUG_Clip;
				float lerpResult622_g91117 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g91117 * _RenderClip ));
				clip( lerpResult622_g91117 - _Cutoff);
				clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
				
				o.Albedo = fixed3( 0.5, 0.5, 0.5 );
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = ( ( ifLocalVar40_g91301 + ifLocalVar40_g91302 + ifLocalVar40_g91303 + ifLocalVar40_g91304 + ifLocalVar40_g91305 + ifLocalVar40_g91306 ) + ( ifLocalVar40_g91307 + ifLocalVar40_g91308 + ifLocalVar40_g91309 ) + ( float4( ifLocalVar40_g91310 , 0.0 ) + float4( ifLocalVar40_g91311 , 0.0 ) + ifLocalVar40_g91312 ) ).rgb;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float3 BakedGI = 0;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = 0;
				gi.light.dir = half3(0,1,0);

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI( o, giInput, gi );
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					outEmission = LightingStandardSpecular_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#else
					outEmission = LightingStandard_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#endif

				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
					outShadowMask = UnityGetRawBakedOcclusions (IN.lmap.xy, float3(0, 0, 0));
				#endif
				#ifndef UNITY_HDR_ON
					outEmission.rgb = exp2(-outEmission.rgb);
				#endif
			}
			ENDCG
		}

	
	}
	
	
	Dependency "LightMode"="ForwardBase"

	Fallback Off
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.RangedFloatNode;2069;-1792,-4992;Half;False;Global;TVE_DEBUG_Min;TVE_DEBUG_Min;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2155;-1792,-5248;Half;False;Global;TVE_DEBUG_Layer;TVE_DEBUG_Layer;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2013;-1792,-5312;Half;False;Global;TVE_DEBUG_Index;TVE_DEBUG_Index;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1908;-1792,-5376;Half;False;Global;TVE_DEBUG_Type;TVE_DEBUG_Type;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1953;-1792,-5120;Half;False;Global;TVE_DEBUG_Filter;TVE_DEBUG_Filter;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2032;-1792,-5056;Half;False;Global;TVE_DEBUG_Clip;TVE_DEBUG_Clip;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2070;-1792,-4928;Half;False;Global;TVE_DEBUG_Max;TVE_DEBUG_Max;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1774;-880,2944;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1803;-1344,2944;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1878;-1792,-5632;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;True;1;StyledBanner(Debug);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1772;-1088,3072;Float;False;Constant;_Float3;Float 3;31;0;Create;True;0;0;0;False;0;False;24;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1931;-1408,-5632;Half;False;Property;_DebugCategory;[ Debug Category ];97;0;Create;True;0;0;0;False;1;StyledCategory(Debug Settings, 5, 10);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1843;-1632,2944;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1771;-1088,2944;Inherit;False;-1;;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;1800;-1472,2944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1804;-1792,2944;Inherit;False;Constant;_Float1;Float 1;0;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1881;-1600,-5632;Half;False;Property;_Message;Message;98;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2109;-896,-5376;Float;False;True;-1;2;;0;4;Hidden/BOXOPHOBIC/The Vegetation Engine/Helpers/Debug;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ForwardBase;0;1;ForwardBase;18;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=True=DisableBatching;True;7;False;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;False;0;;1;LightMode=ForwardBase;0;Standard;40;Workflow,InvertActionOnDeselection;1;0;Surface;0;0;  Blend;0;0;  Refraction Model;0;0;  Dither Shadows;1;0;Two Sided;0;638071577106831206;Deferred Pass;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;0;0;  Use Shadow Threshold;0;0;Receive Shadows;0;0;GPU Instancing;0;638141543866713469;LOD CrossFade;0;0;Built-in Fog;0;0;Ambient Light;0;0;Meta Pass;0;0;Add Pass;0;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Fwd Specular Highlights Toggle;0;0;Fwd Reflections Toggle;0;0;Disable Batching;1;0;Vertex Position,InvertActionOnDeselection;1;0;0;6;False;True;False;True;False;False;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2112;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;Meta;0;4;Meta;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;True;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;False;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2113;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ShadowCaster;0;5;ShadowCaster;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;True;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;True;1;=;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2110;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ForwardAdd;0;2;ForwardAdd;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;True;4;1;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;True;1;LightMode=ForwardAdd;False;False;0;True;1;LightMode=ForwardAdd;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2108;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;True;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=ForwardBase;False;False;0;-1;59;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;LightMode=ForwardBase;=;=;=;=;=;=;=;=;=;=;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2111;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;Deferred;0;3;Deferred;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;True;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Deferred;True;2;False;0;False;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;2203;-896,-5632;Inherit;False;Compile All Shaders;-1;;73162;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2325;-1408,-5376;Inherit;False;Tool Debug;1;;91117;d48cde928c5068141abea1713047719b;1,1236,0;7;336;FLOAT;0;False;465;FLOAT;0;False;884;FLOAT;0;False;337;FLOAT;0;False;624;FLOAT;0;False;720;FLOAT;0;False;722;FLOAT;0;False;1;COLOR;338
WireConnection;1774;0;1771;0
WireConnection;1774;1;1772;0
WireConnection;1774;3;1803;0
WireConnection;1803;0;1800;0
WireConnection;1843;0;1804;0
WireConnection;1800;0;1843;0
WireConnection;2109;2;2325;338
WireConnection;2325;336;1908;0
WireConnection;2325;465;2013;0
WireConnection;2325;884;2155;0
WireConnection;2325;337;1953;0
WireConnection;2325;624;2032;0
WireConnection;2325;720;2069;0
WireConnection;2325;722;2070;0
ASEEND*/
//CHKSM=FAF4B3D6A7C79696C116800BF006E157306F66B5