// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise' to new syntax.

// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors Noise"
{
	Properties
	{
		[StyledMessage(Info, Use the Colors Noise elements to add two colors noise tinting to the vegetation assets. Element Texture A is used as alpha mask., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Render Settings)]_CategoryRender("[ Category Render ]", Float) = 0
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMask(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[StyledCategory(Element Settings)]_CategoryElement("[ Category Element ]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[StyledSpace(10)]_SpaceTexture("#SpaceTexture", Float) = 0
		[Enum(Main UVs,0,Planar UVs,1)]_ElementUVsMode("Element UVs", Float) = 0
		[StyledVector(9)]_MainUVs("Element UVs", Vector) = (1,1,0,0)
		[StyledRemapSlider(_MainTexColorMinValue, _MainTexColorMaxValue, 0, 1)]_MainTexColorRemap("Element Color", Vector) = (0,0,0,0)
		[StyledRemapSlider(_MainTexAlphaMinValue, _MainTexAlphaMaxValue, 0, 1)]_MainTexAlphaRemap("Element Alpha", Vector) = (0,0,0,0)
		[HideInInspector]_MainTexAlphaMinValue("Element Alpha Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexAlphaMaxValue("Element Alpha Max", Range( 0 , 1)) = 1
		[StyledRemapSlider(_MainTexFallofMinValue, _MainTexFallofMaxValue, 0, 1)]_MainTexFallofRemap("Element Fallof", Vector) = (0,0,0,0)
		[HideInInspector]_MainTexFallofMinValue("Element Fallof Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexFallofMaxValue("Element Fallof Max", Range( 0 , 1)) = 0
		[HDR][Gamma][Space(10)]_NoiseColorOne("Noise Color One", Color) = (0,1,0,1)
		[HDR][Gamma]_NoiseColorTwo("Noise Color Two", Color) = (1,0,0,1)
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseRemap("Noise Remap", Vector) = (0,0,0,0)
		[HideInInspector]_NoiseMinValue("Noise Min", Range( 0 , 1)) = 0
		[HideInInspector]_NoiseMaxValue("Noise Max", Range( 0 , 1)) = 1
		_NoiseScaleValue("Noise Scale", Float) = 1
		[StyledMessage(Info, The Particle Velocity mode requires the particle to have custom vertex streams for Velocity and Speed set after the UV stream under the particle Renderer module. , _ElementDirectionMode, 40, 10, 0)]_ElementDirectionMessage("Element Direction Message", Float) = 0
		[Enum(Element Forward,10,Element Texture,20,Particle Translate,30,Particle Velocity,40)][Space(10)]_ElementDirectionMode("Direction Mode", Float) = 20
		[Space(10)]_InfluenceValue1("Winter Influence", Range( 0 , 1)) = 1
		_InfluenceValue2("Spring Influence", Range( 0 , 1)) = 1
		_InfluenceValue3("Summer Influence", Range( 0 , 1)) = 1
		_InfluenceValue4("Autumn Influence", Range( 0 , 1)) = 1
		[StyledCategory(Fading Settings)]_CategoryFade("[ Category Fade ]", Float) = 0
		[HDR][StyledToggle]_ElementRaycastMode("Enable Raycast Fading", Float) = 0
		[StyledToggle]_ElementVolumeFadeMode("Enable Volume Edge Fading", Float) = 0
		[Space(10)][StyledLayers()]_RaycastLayerMask("Raycast Layer", Float) = 1
		[ASEEnd]_RaycastDistanceEndValue("Raycast Distance", Float) = 2
		[HideInInspector]_ElementLayerValue("Legacy Layer Value", Float) = -1
		[HideInInspector]_InvertX("Legacy Invert Mode", Float) = 0
		[HideInInspector]_ElementFadeSupport("Legacy Edge Fading", Float) = 0
		[HideInInspector]_IsElementShader("_IsElementShader", Float) = 1
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1000
		[HideInInspector]_IsColorsElement("_IsColorsElement", Float) = 1
		[HideInInspector]_render_colormask("_render_colormask", Float) = 15

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "DisableBatching"="True" }
	LOD 100

		
		Pass
		{
			
			Name "VolumePass"
			Tags { "LightMode"="VolumePass" }
			
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend SrcAlpha OneMinusSrcAlpha
			AlphaToMask Off
			Cull Back
			ColorMask RGBA
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define TVE_IS_COLORS_ELEMENT


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsColorsElement;
			uniform half _render_colormask;
			uniform half _Message;
			uniform float _ElementFadeSupport;
			uniform half _ElementLayerValue;
			uniform float _InvertX;
			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _CategoryRender;
			uniform half _CategoryElement;
			uniform half4 _MainTexFallofRemap;
			uniform half _ElementLayerMask;
			uniform half _ElementDirectionMessage;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform float _ElementDirectionMode;
			uniform half _ElementRaycastMode;
			uniform half _RaycastLayerMask;
			uniform half _RaycastDistanceEndValue;
			uniform half4 _NoiseRemap;
			uniform half _CategoryFade;
			uniform half _SpaceTexture;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexColorRemap;
			uniform half4 _NoiseColorOne;
			uniform half4 _NoiseColorTwo;
			uniform half _NoiseScaleValue;
			uniform half _NoiseMinValue;
			uniform half _NoiseMaxValue;
			uniform half _ElementIntensity;
			uniform sampler2D _MainTex;
			uniform half _ElementUVsMode;
			uniform half4 _MainUVs;
			uniform half _MainTexAlphaMinValue;
			uniform half _MainTexAlphaMaxValue;
			uniform half _MainTexFallofMinValue;
			uniform half _MainTexFallofMaxValue;
			uniform half4 TVE_ColorsCoords;
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_MotionCoords;
			uniform half4 TVE_VertexCoords;
			uniform half TVE_ElementsFadeValue;
			uniform half _ElementVolumeFadeMode;
			uniform half4 TVE_SeasonOptions;
			uniform half _InfluenceValue1;
			uniform half _InfluenceValue2;
			uniform half TVE_SeasonLerp;
			uniform half _InfluenceValue3;
			uniform half _InfluenceValue4;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise)
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
			half4 IS_ELEMENT( half4 Colors, half4 Extras, half4 Motion, half4 Vertex )
			{
				#if defined (TVE_IS_COLORS_ELEMENT)
				return Colors;
				#elif defined (TVE_IS_EXTRAS_ELEMENT)
				return Extras;
				#elif defined (TVE_IS_MOTION_ELEMENT)
				return Motion;
				#elif defined (TVE_IS_VERTEX_ELEMENT)
				return Vertex;
				#else
				return Colors;
				#endif
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				half2 appendResult1900_g21889 = (half2(ase_worldPos.x , ase_worldPos.z));
				half2 lerpResult1899_g21889 = lerp( ( 1.0 - v.ase_texcoord.xy ) , appendResult1900_g21889 , _ElementUVsMode);
				half2 vertexToFrag11_g22152 = ( ( lerpResult1899_g21889 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord1.zw = vertexToFrag11_g22152;
				half TVE_SeasonOptions_X50_g21889 = TVE_SeasonOptions.x;
				half Influence_Winter808_g21889 = _InfluenceValue1;
				half Influence_Spring814_g21889 = _InfluenceValue2;
				half TVE_SeasonLerp54_g21889 = TVE_SeasonLerp;
				half lerpResult829_g21889 = lerp( Influence_Winter808_g21889 , Influence_Spring814_g21889 , TVE_SeasonLerp54_g21889);
				half TVE_SeasonOptions_Y51_g21889 = TVE_SeasonOptions.y;
				half Influence_Summer815_g21889 = _InfluenceValue3;
				half lerpResult833_g21889 = lerp( Influence_Spring814_g21889 , Influence_Summer815_g21889 , TVE_SeasonLerp54_g21889);
				half TVE_SeasonOptions_Z52_g21889 = TVE_SeasonOptions.z;
				half Influence_Autumn810_g21889 = _InfluenceValue4;
				half lerpResult816_g21889 = lerp( Influence_Summer815_g21889 , Influence_Autumn810_g21889 , TVE_SeasonLerp54_g21889);
				half TVE_SeasonOptions_W53_g21889 = TVE_SeasonOptions.w;
				half lerpResult817_g21889 = lerp( Influence_Autumn810_g21889 , Influence_Winter808_g21889 , TVE_SeasonLerp54_g21889);
				half vertexToFrag11_g21893 = ( ( TVE_SeasonOptions_X50_g21889 * lerpResult829_g21889 ) + ( TVE_SeasonOptions_Y51_g21889 * lerpResult833_g21889 ) + ( TVE_SeasonOptions_Z52_g21889 * lerpResult816_g21889 ) + ( TVE_SeasonOptions_W53_g21889 * lerpResult817_g21889 ) );
				o.ase_texcoord2.x = vertexToFrag11_g21893;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.yzw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				half Noise_Scale892_g21889 = _NoiseScaleValue;
				half simpleNoise775_g21889 = SimpleNoise( i.ase_texcoord1.xy*Noise_Scale892_g21889 );
				half Noise_Min893_g21889 = _NoiseMinValue;
				half temp_output_7_0_g21896 = Noise_Min893_g21889;
				half Noise_Max894_g21889 = _NoiseMaxValue;
				half temp_output_10_0_g21896 = ( Noise_Max894_g21889 - temp_output_7_0_g21896 );
				half WorldNoise1483_g21889 = saturate( ( ( simpleNoise775_g21889 - temp_output_7_0_g21896 ) / temp_output_10_0_g21896 ) );
				half4 lerpResult772_g21889 = lerp( _NoiseColorOne , _NoiseColorTwo , WorldNoise1483_g21889);
				half3 Final_ColorsNoise_RGB784_g21889 = (lerpResult772_g21889).rgb;
				half2 vertexToFrag11_g22152 = i.ase_texcoord1.zw;
				half4 MainTex_RGBA587_g21889 = tex2D( _MainTex, vertexToFrag11_g22152 );
				half clampResult17_g22148 = clamp( (MainTex_RGBA587_g21889).a , 0.0001 , 0.9999 );
				half temp_output_7_0_g22149 = _MainTexAlphaMinValue;
				half temp_output_10_0_g22149 = ( _MainTexAlphaMaxValue - temp_output_7_0_g22149 );
				half Element_Remap_A74_g21889 = saturate( ( ( clampResult17_g22148 - temp_output_7_0_g22149 ) / ( temp_output_10_0_g22149 + 0.0001 ) ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g21889 = _ElementParams_Instance.w;
				half clampResult17_g21978 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.xy*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				half temp_output_7_0_g21979 = _MainTexFallofMinValue;
				half temp_output_10_0_g21979 = ( _MainTexFallofMaxValue - temp_output_7_0_g21979 );
				half Element_Fallof1883_g21889 = saturate( ( ( clampResult17_g21978 - temp_output_7_0_g21979 ) / ( temp_output_10_0_g21979 + 0.0001 ) ) );
				half4 Colors37_g21900 = TVE_ColorsCoords;
				half4 Extras37_g21900 = TVE_ExtrasCoords;
				half4 Motion37_g21900 = TVE_MotionCoords;
				half4 Vertex37_g21900 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g21900 = IS_ELEMENT( Colors37_g21900 , Extras37_g21900 , Motion37_g21900 , Vertex37_g21900 );
				half4 temp_output_35_0_g21904 = localIS_ELEMENT37_g21900;
				half temp_output_7_0_g21905 = TVE_ElementsFadeValue;
				half2 temp_cast_0 = (temp_output_7_0_g21905).xx;
				half temp_output_10_0_g21905 = ( 1.0 - temp_output_7_0_g21905 );
				half2 temp_output_16_0_g21898 = saturate( ( ( abs( (( (temp_output_35_0_g21904).zw + ( (temp_output_35_0_g21904).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_0 ) / temp_output_10_0_g21905 ) );
				half2 temp_output_12_0_g21898 = ( temp_output_16_0_g21898 * temp_output_16_0_g21898 );
				half lerpResult842_g21889 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g21898).x + (temp_output_12_0_g21898).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g21889 = ( _ElementIntensity * Element_Remap_A74_g21889 * Element_Params_A1737_g21889 * i.ase_color.a * Element_Fallof1883_g21889 * lerpResult842_g21889 );
				half vertexToFrag11_g21893 = i.ase_texcoord2.x;
				half Element_Seasons834_g21889 = vertexToFrag11_g21893;
				half Final_ColorsNoise_A785_g21889 = ( (lerpResult772_g21889).a * Element_Alpha56_g21889 * Element_Seasons834_g21889 );
				half4 appendResult790_g21889 = (half4(Final_ColorsNoise_RGB784_g21889 , Final_ColorsNoise_A785_g21889));
				
				
				finalColor = appendResult790_g21889;
				return finalColor;
			}
			ENDCG
		}
		
		
		Pass
		{
			
			Name "VisualPass"
			
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend SrcAlpha OneMinusSrcAlpha
			AlphaToMask Off
			Cull Back
			ColorMask RGBA
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define TVE_IS_COLORS_ELEMENT


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsColorsElement;
			uniform half _render_colormask;
			uniform half _Message;
			uniform half _ElementFadeSupport;
			uniform half _ElementLayerValue;
			uniform half _InvertX;
			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _CategoryRender;
			uniform half _CategoryElement;
			uniform half4 _MainTexFallofRemap;
			uniform half _ElementLayerMask;
			uniform half _ElementDirectionMessage;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _ElementDirectionMode;
			uniform half _ElementRaycastMode;
			uniform half _RaycastLayerMask;
			uniform half _RaycastDistanceEndValue;
			uniform half4 _NoiseRemap;
			uniform half _CategoryFade;
			uniform half _SpaceTexture;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexColorRemap;
			uniform half4 _NoiseColorOne;
			uniform half4 _NoiseColorTwo;
			uniform half _NoiseScaleValue;
			uniform half _NoiseMinValue;
			uniform half _NoiseMaxValue;
			uniform half4 TVE_ColorsPosition;
			uniform half4 TVE_ExtrasPosition;
			uniform half4 TVE_MotionPosition;
			uniform half4 TVE_VertexPosition;
			uniform half4 TVE_ColorsScale;
			uniform half4 TVE_ExtrasScale;
			uniform half4 TVE_MotionScale;
			uniform half4 TVE_VertexScale;
			uniform half _ElementIntensity;
			uniform sampler2D _MainTex;
			uniform half _ElementUVsMode;
			uniform half4 _MainUVs;
			uniform half _MainTexAlphaMinValue;
			uniform half _MainTexAlphaMaxValue;
			uniform half _MainTexFallofMinValue;
			uniform half _MainTexFallofMaxValue;
			uniform half4 TVE_ColorsCoords;
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_MotionCoords;
			uniform half4 TVE_VertexCoords;
			uniform half TVE_ElementsFadeValue;
			uniform half _ElementVolumeFadeMode;
			uniform half4 TVE_SeasonOptions;
			uniform half _InfluenceValue1;
			uniform half _InfluenceValue2;
			uniform half TVE_SeasonLerp;
			uniform half _InfluenceValue3;
			uniform half _InfluenceValue4;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultColorsNoise)
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
			half4 IS_ELEMENT( half4 Colors, half4 Extras, half4 Motion, half4 Vertex )
			{
				#if defined (TVE_IS_COLORS_ELEMENT)
				return Colors;
				#elif defined (TVE_IS_EXTRAS_ELEMENT)
				return Extras;
				#elif defined (TVE_IS_MOTION_ELEMENT)
				return Motion;
				#elif defined (TVE_IS_VERTEX_ELEMENT)
				return Vertex;
				#else
				return Colors;
				#endif
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				half2 appendResult1900_g21889 = (half2(ase_worldPos.x , ase_worldPos.z));
				half2 lerpResult1899_g21889 = lerp( ( 1.0 - v.ase_texcoord.xy ) , appendResult1900_g21889 , _ElementUVsMode);
				half2 vertexToFrag11_g22152 = ( ( lerpResult1899_g21889 * (_MainUVs).xy ) + (_MainUVs).zw );
				o.ase_texcoord1.zw = vertexToFrag11_g22152;
				half TVE_SeasonOptions_X50_g21889 = TVE_SeasonOptions.x;
				half Influence_Winter808_g21889 = _InfluenceValue1;
				half Influence_Spring814_g21889 = _InfluenceValue2;
				half TVE_SeasonLerp54_g21889 = TVE_SeasonLerp;
				half lerpResult829_g21889 = lerp( Influence_Winter808_g21889 , Influence_Spring814_g21889 , TVE_SeasonLerp54_g21889);
				half TVE_SeasonOptions_Y51_g21889 = TVE_SeasonOptions.y;
				half Influence_Summer815_g21889 = _InfluenceValue3;
				half lerpResult833_g21889 = lerp( Influence_Spring814_g21889 , Influence_Summer815_g21889 , TVE_SeasonLerp54_g21889);
				half TVE_SeasonOptions_Z52_g21889 = TVE_SeasonOptions.z;
				half Influence_Autumn810_g21889 = _InfluenceValue4;
				half lerpResult816_g21889 = lerp( Influence_Summer815_g21889 , Influence_Autumn810_g21889 , TVE_SeasonLerp54_g21889);
				half TVE_SeasonOptions_W53_g21889 = TVE_SeasonOptions.w;
				half lerpResult817_g21889 = lerp( Influence_Autumn810_g21889 , Influence_Winter808_g21889 , TVE_SeasonLerp54_g21889);
				half vertexToFrag11_g21893 = ( ( TVE_SeasonOptions_X50_g21889 * lerpResult829_g21889 ) + ( TVE_SeasonOptions_Y51_g21889 * lerpResult833_g21889 ) + ( TVE_SeasonOptions_Z52_g21889 * lerpResult816_g21889 ) + ( TVE_SeasonOptions_W53_g21889 * lerpResult817_g21889 ) );
				o.ase_texcoord2.x = vertexToFrag11_g21893;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.yzw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				half3 temp_cast_0 = (0.0).xxx;
				half Noise_Scale892_g21889 = _NoiseScaleValue;
				half simpleNoise775_g21889 = SimpleNoise( i.ase_texcoord1.xy*Noise_Scale892_g21889 );
				half Noise_Min893_g21889 = _NoiseMinValue;
				half temp_output_7_0_g21896 = Noise_Min893_g21889;
				half Noise_Max894_g21889 = _NoiseMaxValue;
				half temp_output_10_0_g21896 = ( Noise_Max894_g21889 - temp_output_7_0_g21896 );
				half WorldNoise1483_g21889 = saturate( ( ( simpleNoise775_g21889 - temp_output_7_0_g21896 ) / temp_output_10_0_g21896 ) );
				half4 lerpResult772_g21889 = lerp( _NoiseColorOne , _NoiseColorTwo , WorldNoise1483_g21889);
				half3 Final_ColorsNoise_RGB784_g21889 = (lerpResult772_g21889).rgb;
				half3 Input_Color94_g22008 = Final_ColorsNoise_RGB784_g21889;
				half3 Element_Valid47_g22008 = Input_Color94_g22008;
				half4 Colors37_g22020 = TVE_ColorsPosition;
				half4 Extras37_g22020 = TVE_ExtrasPosition;
				half4 Motion37_g22020 = TVE_MotionPosition;
				half4 Vertex37_g22020 = TVE_VertexPosition;
				half4 localIS_ELEMENT37_g22020 = IS_ELEMENT( Colors37_g22020 , Extras37_g22020 , Motion37_g22020 , Vertex37_g22020 );
				half4 Colors37_g22021 = TVE_ColorsScale;
				half4 Extras37_g22021 = TVE_ExtrasScale;
				half4 Motion37_g22021 = TVE_MotionScale;
				half4 Vertex37_g22021 = TVE_VertexScale;
				half4 localIS_ELEMENT37_g22021 = IS_ELEMENT( Colors37_g22021 , Extras37_g22021 , Motion37_g22021 , Vertex37_g22021 );
				half Bounds42_g22008 = ( 1.0 - saturate( ( distance( max( ( abs( ( WorldPosition - (localIS_ELEMENT37_g22020).xyz ) ) - ( (localIS_ELEMENT37_g22021).xyz * float3( 0.5,0.5,0.5 ) ) ) , float3( 0,0,0 ) ) , float3( 0,0,0 ) ) / 0.001 ) ) );
				half3 lerpResult50_g22008 = lerp( temp_cast_0 , Element_Valid47_g22008 , Bounds42_g22008);
				half CrossHatch44_g22008 = ( saturate( ( ( abs( sin( ( ( WorldPosition.x + WorldPosition.z ) * 3.0 ) ) ) - 0.7 ) * 100.0 ) ) * 0.25 );
				half2 vertexToFrag11_g22152 = i.ase_texcoord1.zw;
				half4 MainTex_RGBA587_g21889 = tex2D( _MainTex, vertexToFrag11_g22152 );
				half clampResult17_g22148 = clamp( (MainTex_RGBA587_g21889).a , 0.0001 , 0.9999 );
				half temp_output_7_0_g22149 = _MainTexAlphaMinValue;
				half temp_output_10_0_g22149 = ( _MainTexAlphaMaxValue - temp_output_7_0_g22149 );
				half Element_Remap_A74_g21889 = saturate( ( ( clampResult17_g22148 - temp_output_7_0_g22149 ) / ( temp_output_10_0_g22149 + 0.0001 ) ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g21889 = _ElementParams_Instance.w;
				half clampResult17_g21978 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.xy*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				half temp_output_7_0_g21979 = _MainTexFallofMinValue;
				half temp_output_10_0_g21979 = ( _MainTexFallofMaxValue - temp_output_7_0_g21979 );
				half Element_Fallof1883_g21889 = saturate( ( ( clampResult17_g21978 - temp_output_7_0_g21979 ) / ( temp_output_10_0_g21979 + 0.0001 ) ) );
				half4 Colors37_g21900 = TVE_ColorsCoords;
				half4 Extras37_g21900 = TVE_ExtrasCoords;
				half4 Motion37_g21900 = TVE_MotionCoords;
				half4 Vertex37_g21900 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g21900 = IS_ELEMENT( Colors37_g21900 , Extras37_g21900 , Motion37_g21900 , Vertex37_g21900 );
				half4 temp_output_35_0_g21904 = localIS_ELEMENT37_g21900;
				half temp_output_7_0_g21905 = TVE_ElementsFadeValue;
				half2 temp_cast_1 = (temp_output_7_0_g21905).xx;
				half temp_output_10_0_g21905 = ( 1.0 - temp_output_7_0_g21905 );
				half2 temp_output_16_0_g21898 = saturate( ( ( abs( (( (temp_output_35_0_g21904).zw + ( (temp_output_35_0_g21904).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_1 ) / temp_output_10_0_g21905 ) );
				half2 temp_output_12_0_g21898 = ( temp_output_16_0_g21898 * temp_output_16_0_g21898 );
				half lerpResult842_g21889 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g21898).x + (temp_output_12_0_g21898).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g21889 = ( _ElementIntensity * Element_Remap_A74_g21889 * Element_Params_A1737_g21889 * i.ase_color.a * Element_Fallof1883_g21889 * lerpResult842_g21889 );
				half vertexToFrag11_g21893 = i.ase_texcoord2.x;
				half Element_Seasons834_g21889 = vertexToFrag11_g21893;
				half Final_ColorsNoise_A785_g21889 = ( (lerpResult772_g21889).a * Element_Alpha56_g21889 * Element_Seasons834_g21889 );
				half Input_Alpha48_g22008 = Final_ColorsNoise_A785_g21889;
				half lerpResult57_g22008 = lerp( CrossHatch44_g22008 , Input_Alpha48_g22008 , Bounds42_g22008);
				half4 appendResult58_g22008 = (half4(lerpResult50_g22008 , lerpResult57_g22008));
				
				
				finalColor = appendResult58_g22008;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderElementGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.FunctionNode;108;-640,-768;Inherit;False;Define Element Colors;71;;20749;378049ebac362e14aae08c2daa8ed737;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;159;-640,-640;Half;False;Property;_render_colormask;_render_colormask;73;1;[HideInInspector];Create;True;0;0;0;True;0;False;15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;100;-256,-768;Half;False;Property;_Message;Message;1;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Colors Noise elements to add two colors noise tinting to the vegetation assets. Element Texture A is used as alpha mask., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-384,-768;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;False;1;StyledBanner(Color Noise Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;181;0,-768;Inherit;False;Compile All Elements;-1;;21472;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;182;0,-384;Half;False;True;-1;2;TVEShaderElementGUI;100;13;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Colors Noise;f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=VolumePass;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;183;0,-272;Float;False;False;-1;2;ASEMaterialInspector;100;13;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;185;-640,-384;Inherit;False;Base Element;2;;21889;0e972c73cae2ee54ea51acc9738801d0;10,477,0,1778,0,478,2,1824,2,145,0,1814,0,481,0,1784,0,1904,1,1907,1;0;2;FLOAT4;0;FLOAT4;1779
WireConnection;182;0;185;0
WireConnection;183;0;185;1779
ASEEND*/
//CHKSM=4292CBE01E1D7AB5A8AF1800059D4E997CF2F40D