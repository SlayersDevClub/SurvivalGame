// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVegetationEngineElementsDefaultMotionAdvanced' to new syntax.

// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Motion Advanced"
{
	Properties
	{
		[StyledMessage(Info, Use the Motion Advanced elements to add noise to the motion direction. Element Texture A is used as alpha mask. Particle Alpha is used as Element Intensity multiplier. The noise is animated in the element forward direction and it is updated with particles or in play mode only., 0,0)]_Message("Message", Float) = 0
		[StyledCategory(Render Settings)]_CategoryRender("[ Category Render ]", Float) = 0
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMask(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[Enum(Affect Material Interaction,13,Affect Interaction and Wind Power,15)]_ElementMotionMode("Render Effect", Float) = 15
		[StyledCategory(Element Settings)]_CategoryElement("[ Category Element ]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[StyledSpace(10)]_SpaceTexture("#SpaceTexture", Float) = 0
		[StyledRemapSlider(_MainTexColorMinValue, _MainTexColorMaxValue, 0, 1)]_MainTexColorRemap("Element Color", Vector) = (0,0,0,0)
		[HideInInspector]_MainTexColorMinValue("Element Color Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexColorMaxValue("Element Color Max", Range( 0 , 1)) = 1
		[StyledRemapSlider(_MainTexAlphaMinValue, _MainTexAlphaMaxValue, 0, 1)]_MainTexAlphaRemap("Element Alpha", Vector) = (0,0,0,0)
		[HideInInspector]_MainTexAlphaMinValue("Element Alpha Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainTexAlphaMaxValue("Element Alpha Max", Range( 0 , 1)) = 1
		[StyledRemapSlider(_MainTexFallofMinValue, _MainTexFallofMaxValue, 0, 1)]_MainTexFallofRemap("Element Fallof", Vector) = (0,0,0,0)
		[Space(10)][StyledTextureSingleLine]_NoiseTex("Noise Texture", 2D) = "gray" {}
		[Space(10)]_NoiseIntensityValue("Noise Intensity", Range( 0 , 1)) = 0
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseRemap("Noise Remap", Vector) = (0,0,0,0)
		[HideInInspector]_NoiseMinValue("Noise Min", Range( 0 , 1)) = 0
		[HideInInspector]_NoiseMaxValue("Noise Max", Range( 0 , 1)) = 1
		_NoiseScaleValue("Noise Scale", Float) = 1
		_NoiseSpeedValue("Noise Speed", Float) = 1
		[Space(10)]_MotionPower("Wind Power", Range( 0 , 1)) = 0
		[StyledMessage(Info, The Particle Velocity mode requires the particle to have custom vertex streams for Velocity and Speed set after the UV stream under the particle Renderer module. , _ElementDirectionMode, 40, 10, 0)]_ElementDirectionMessage("Element Direction Message", Float) = 0
		[Enum(Element Forward,10,Element Texture,20,Particle Translate,30,Particle Velocity,40)][Space(10)]_ElementDirectionMode("Direction Mode", Float) = 20
		[Space(10)][StyledToggle]_ElementInvertMode("Use Inverted Element Direction", Float) = 0
		[StyledCategory(Fading Settings)]_CategoryFade("[ Category Fade ]", Float) = 0
		[HDR][StyledToggle]_ElementRaycastMode("Enable Raycast Fading", Float) = 0
		[StyledToggle]_ElementVolumeFadeMode("Enable Volume Edge Fading", Float) = 0
		[Space(10)][StyledLayers()]_RaycastLayerMask("Raycast Layer", Float) = 1
		[ASEEnd]_RaycastDistanceEndValue("Raycast Distance", Float) = 2
		[HideInInspector]_ElementLayerValue("Legacy Layer Value", Float) = -1
		[HideInInspector]_InvertX("Legacy Invert Mode", Float) = 0
		[HideInInspector]_ElementFadeSupport("Legacy Edge Fading", Float) = 0
		[HideInInspector]_IsElementShader("_IsElementShader", Float) = 1
		[HideInInspector]_element_direction_mode("_element_direction_mode", Vector) = (0,0,0,0)
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1200
		[HideInInspector]_IsMotionElement("_IsMotionElement", Float) = 1
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
			Blend SrcAlpha OneMinusSrcAlpha, One One
			AlphaToMask Off
			Cull Back
			ColorMask [_render_colormask]
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
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define TVE_IS_MOTION_ELEMENT


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
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

			uniform half _IsMotionElement;
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
			uniform half4 _element_direction_mode;
			uniform sampler2D _MainTex;
			uniform half _MainTexColorMinValue;
			uniform half _MainTexColorMaxValue;
			uniform float _ElementInvertMode;
			uniform sampler2D _NoiseTex;
			uniform float3 TVE_WorldOrigin;
			uniform half _NoiseScaleValue;
			uniform half4 TVE_TimeParams;
			uniform half _NoiseSpeedValue;
			uniform half _NoiseMinValue;
			uniform half _NoiseMaxValue;
			uniform half _NoiseIntensityValue;
			uniform half _MotionPower;
			uniform float _ElementIntensity;
			uniform half _MainTexAlphaMinValue;
			uniform half _MainTexAlphaMaxValue;
			uniform half4 TVE_ColorsCoords;
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_MotionCoords;
			uniform half4 TVE_VertexCoords;
			uniform half TVE_ElementsFadeValue;
			uniform float _ElementVolumeFadeMode;
			uniform half _ElementMotionMode;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultMotionAdvanced)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultMotionAdvanced
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultMotionAdvanced)
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

				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_color = v.color;
				o.ase_texcoord2 = v.ase_texcoord1;
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
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				half2 Direction_Transform1406_g23019 = (( mul( unity_ObjectToWorld, float4( float3(0,0,1) , 0.0 ) ).xyz / ase_objectScale )).xz;
				half4 MainTex_RGBA587_g23019 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.xy ) );
				float3 temp_cast_2 = (0.0001).xxx;
				float3 temp_cast_3 = (0.9999).xxx;
				float3 clampResult17_g23212 = clamp( (MainTex_RGBA587_g23019).rgb , temp_cast_2 , temp_cast_3 );
				float temp_output_7_0_g23213 = _MainTexColorMinValue;
				float3 temp_cast_4 = (temp_output_7_0_g23213).xxx;
				float temp_output_10_0_g23213 = ( _MainTexColorMaxValue - temp_output_7_0_g23213 );
				float3 temp_output_1765_0_g23019 = saturate( ( ( clampResult17_g23212 - temp_cast_4 ) / temp_output_10_0_g23213 ) );
				half Element_Remap_R73_g23019 = (temp_output_1765_0_g23019).x;
				half Element_Remap_G265_g23019 = (temp_output_1765_0_g23019).y;
				float3 appendResult274_g23019 = (float3((Element_Remap_R73_g23019*2.0 + -1.0) , 0.0 , (Element_Remap_G265_g23019*2.0 + -1.0)));
				float3 break281_g23019 = ( mul( unity_ObjectToWorld, float4( appendResult274_g23019 , 0.0 ) ).xyz / ase_objectScale );
				float2 appendResult1403_g23019 = (float2(break281_g23019.x , break281_g23019.z));
				half2 Direction_Texture284_g23019 = appendResult1403_g23019;
				float2 appendResult1404_g23019 = (float2(i.ase_color.r , i.ase_color.g));
				half2 Direction_VertexColor1150_g23019 = (appendResult1404_g23019*2.0 + -1.0);
				float2 appendResult1382_g23019 = (float2(i.ase_texcoord1.z , i.ase_texcoord2.x));
				half2 Direction_Velocity1394_g23019 = ( appendResult1382_g23019 / i.ase_texcoord2.y );
				float2 temp_output_1452_0_g23019 = ( ( _element_direction_mode.x * Direction_Transform1406_g23019 ) + ( _element_direction_mode.y * Direction_Texture284_g23019 ) + ( _element_direction_mode.z * Direction_VertexColor1150_g23019 ) + ( _element_direction_mode.w * Direction_Velocity1394_g23019 ) );
				half Element_InvertMode489_g23019 = _ElementInvertMode;
				float2 lerpResult1468_g23019 = lerp( temp_output_1452_0_g23019 , -temp_output_1452_0_g23019 , Element_InvertMode489_g23019);
				half2 Direction_Advanced1454_g23019 = lerpResult1468_g23019;
				half Noise_Scale892_g23019 = _NoiseScaleValue;
				half2 Noise_Coords1409_g23019 = ( -( (( WorldPosition - TVE_WorldOrigin )).xz * 0.1 ) * Noise_Scale892_g23019 );
				float2 temp_output_3_0_g23025 = Noise_Coords1409_g23019;
				float2 temp_output_21_0_g23025 = Direction_Advanced1454_g23019;
				float lerpResult115_g23024 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Noise_Speed898_g23019 = _NoiseSpeedValue;
				float temp_output_15_0_g23025 = ( lerpResult115_g23024 * Noise_Speed898_g23019 );
				float temp_output_23_0_g23025 = frac( temp_output_15_0_g23025 );
				float4 lerpResult39_g23025 = lerp( tex2D( _NoiseTex, ( temp_output_3_0_g23025 + ( temp_output_21_0_g23025 * temp_output_23_0_g23025 ) ) ) , tex2D( _NoiseTex, ( temp_output_3_0_g23025 + ( temp_output_21_0_g23025 * frac( ( temp_output_15_0_g23025 + 0.5 ) ) ) ) ) , ( abs( ( temp_output_23_0_g23025 - 0.5 ) ) / 0.5 ));
				half Noise_Min893_g23019 = _NoiseMinValue;
				float temp_output_7_0_g23027 = Noise_Min893_g23019;
				float4 temp_cast_7 = (temp_output_7_0_g23027).xxxx;
				half Noise_Max894_g23019 = _NoiseMaxValue;
				float temp_output_10_0_g23027 = ( Noise_Max894_g23019 - temp_output_7_0_g23027 );
				half2 Noise_Advanced1427_g23019 = (saturate( ( ( lerpResult39_g23025 - temp_cast_7 ) / temp_output_10_0_g23027 ) )).rg;
				half Noise_Intensity965_g23019 = _NoiseIntensityValue;
				float2 lerpResult1435_g23019 = lerp( (Direction_Advanced1454_g23019*0.5 + 0.5) , Noise_Advanced1427_g23019 , Noise_Intensity965_g23019);
				half Motion_Power1000_g23019 = _MotionPower;
				float3 appendResult1436_g23019 = (float3(lerpResult1435_g23019 , Motion_Power1000_g23019));
				half3 Final_MotionAdvanced_RGB1438_g23019 = appendResult1436_g23019;
				float clampResult17_g23210 = clamp( (MainTex_RGBA587_g23019).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g23211 = _MainTexAlphaMinValue;
				float temp_output_10_0_g23211 = ( _MainTexAlphaMaxValue - temp_output_7_0_g23211 );
				half Element_Remap_A74_g23019 = saturate( ( ( clampResult17_g23210 - temp_output_7_0_g23211 ) / ( temp_output_10_0_g23211 + 0.0001 ) ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g23019 = _ElementParams_Instance.w;
				half Element_Fallof1883_g23019 = 1.0;
				half4 Colors37_g23030 = TVE_ColorsCoords;
				half4 Extras37_g23030 = TVE_ExtrasCoords;
				half4 Motion37_g23030 = TVE_MotionCoords;
				half4 Vertex37_g23030 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g23030 = IS_ELEMENT( Colors37_g23030 , Extras37_g23030 , Motion37_g23030 , Vertex37_g23030 );
				float4 temp_output_35_0_g23034 = localIS_ELEMENT37_g23030;
				float temp_output_7_0_g23035 = TVE_ElementsFadeValue;
				float2 temp_cast_8 = (temp_output_7_0_g23035).xx;
				float temp_output_10_0_g23035 = ( 1.0 - temp_output_7_0_g23035 );
				float2 temp_output_16_0_g23028 = saturate( ( ( abs( (( (temp_output_35_0_g23034).zw + ( (temp_output_35_0_g23034).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_8 ) / temp_output_10_0_g23035 ) );
				float2 temp_output_12_0_g23028 = ( temp_output_16_0_g23028 * temp_output_16_0_g23028 );
				float lerpResult842_g23019 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g23028).x + (temp_output_12_0_g23028).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g23019 = ( _ElementIntensity * Element_Remap_A74_g23019 * Element_Params_A1737_g23019 * i.ase_color.a * Element_Fallof1883_g23019 * lerpResult842_g23019 );
				half Final_MotionAdvanced_A1439_g23019 = Element_Alpha56_g23019;
				float4 appendResult1463_g23019 = (float4(Final_MotionAdvanced_RGB1438_g23019 , Final_MotionAdvanced_A1439_g23019));
				half Element_EffectMotion946_g23019 = _ElementMotionMode;
				
				
				finalColor = ( appendResult1463_g23019 + ( Element_EffectMotion946_g23019 * 0.0 ) );
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
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define TVE_IS_MOTION_ELEMENT


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
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

			uniform half _IsMotionElement;
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
			uniform half4 _element_direction_mode;
			uniform sampler2D _MainTex;
			uniform half _MainTexColorMinValue;
			uniform half _MainTexColorMaxValue;
			uniform float _ElementInvertMode;
			uniform sampler2D _NoiseTex;
			uniform float3 TVE_WorldOrigin;
			uniform half _NoiseScaleValue;
			uniform half4 TVE_TimeParams;
			uniform half _NoiseSpeedValue;
			uniform half _NoiseMinValue;
			uniform half _NoiseMaxValue;
			uniform half _NoiseIntensityValue;
			uniform half _MotionPower;
			uniform half4 TVE_ColorsPosition;
			uniform half4 TVE_ExtrasPosition;
			uniform half4 TVE_MotionPosition;
			uniform half4 TVE_VertexPosition;
			uniform half4 TVE_ColorsScale;
			uniform half4 TVE_ExtrasScale;
			uniform half4 TVE_MotionScale;
			uniform half4 TVE_VertexScale;
			uniform float _ElementIntensity;
			uniform half _MainTexAlphaMinValue;
			uniform half _MainTexAlphaMaxValue;
			uniform half4 TVE_ColorsCoords;
			uniform half4 TVE_ExtrasCoords;
			uniform half4 TVE_MotionCoords;
			uniform half4 TVE_VertexCoords;
			uniform half TVE_ElementsFadeValue;
			uniform float _ElementVolumeFadeMode;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultMotionAdvanced)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultMotionAdvanced
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultMotionAdvanced)
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

				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_color = v.color;
				o.ase_texcoord2 = v.ase_texcoord1;
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
				float3 temp_cast_0 = (0.0).xxx;
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				half2 Direction_Transform1406_g23019 = (( mul( unity_ObjectToWorld, float4( float3(0,0,1) , 0.0 ) ).xyz / ase_objectScale )).xz;
				half4 MainTex_RGBA587_g23019 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.xy ) );
				float3 temp_cast_3 = (0.0001).xxx;
				float3 temp_cast_4 = (0.9999).xxx;
				float3 clampResult17_g23212 = clamp( (MainTex_RGBA587_g23019).rgb , temp_cast_3 , temp_cast_4 );
				float temp_output_7_0_g23213 = _MainTexColorMinValue;
				float3 temp_cast_5 = (temp_output_7_0_g23213).xxx;
				float temp_output_10_0_g23213 = ( _MainTexColorMaxValue - temp_output_7_0_g23213 );
				float3 temp_output_1765_0_g23019 = saturate( ( ( clampResult17_g23212 - temp_cast_5 ) / temp_output_10_0_g23213 ) );
				half Element_Remap_R73_g23019 = (temp_output_1765_0_g23019).x;
				half Element_Remap_G265_g23019 = (temp_output_1765_0_g23019).y;
				float3 appendResult274_g23019 = (float3((Element_Remap_R73_g23019*2.0 + -1.0) , 0.0 , (Element_Remap_G265_g23019*2.0 + -1.0)));
				float3 break281_g23019 = ( mul( unity_ObjectToWorld, float4( appendResult274_g23019 , 0.0 ) ).xyz / ase_objectScale );
				float2 appendResult1403_g23019 = (float2(break281_g23019.x , break281_g23019.z));
				half2 Direction_Texture284_g23019 = appendResult1403_g23019;
				float2 appendResult1404_g23019 = (float2(i.ase_color.r , i.ase_color.g));
				half2 Direction_VertexColor1150_g23019 = (appendResult1404_g23019*2.0 + -1.0);
				float2 appendResult1382_g23019 = (float2(i.ase_texcoord1.z , i.ase_texcoord2.x));
				half2 Direction_Velocity1394_g23019 = ( appendResult1382_g23019 / i.ase_texcoord2.y );
				float2 temp_output_1452_0_g23019 = ( ( _element_direction_mode.x * Direction_Transform1406_g23019 ) + ( _element_direction_mode.y * Direction_Texture284_g23019 ) + ( _element_direction_mode.z * Direction_VertexColor1150_g23019 ) + ( _element_direction_mode.w * Direction_Velocity1394_g23019 ) );
				half Element_InvertMode489_g23019 = _ElementInvertMode;
				float2 lerpResult1468_g23019 = lerp( temp_output_1452_0_g23019 , -temp_output_1452_0_g23019 , Element_InvertMode489_g23019);
				half2 Direction_Advanced1454_g23019 = lerpResult1468_g23019;
				half Noise_Scale892_g23019 = _NoiseScaleValue;
				half2 Noise_Coords1409_g23019 = ( -( (( WorldPosition - TVE_WorldOrigin )).xz * 0.1 ) * Noise_Scale892_g23019 );
				float2 temp_output_3_0_g23025 = Noise_Coords1409_g23019;
				float2 temp_output_21_0_g23025 = Direction_Advanced1454_g23019;
				float lerpResult115_g23024 = lerp( _Time.y , ( ( _Time.y * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Noise_Speed898_g23019 = _NoiseSpeedValue;
				float temp_output_15_0_g23025 = ( lerpResult115_g23024 * Noise_Speed898_g23019 );
				float temp_output_23_0_g23025 = frac( temp_output_15_0_g23025 );
				float4 lerpResult39_g23025 = lerp( tex2D( _NoiseTex, ( temp_output_3_0_g23025 + ( temp_output_21_0_g23025 * temp_output_23_0_g23025 ) ) ) , tex2D( _NoiseTex, ( temp_output_3_0_g23025 + ( temp_output_21_0_g23025 * frac( ( temp_output_15_0_g23025 + 0.5 ) ) ) ) ) , ( abs( ( temp_output_23_0_g23025 - 0.5 ) ) / 0.5 ));
				half Noise_Min893_g23019 = _NoiseMinValue;
				float temp_output_7_0_g23027 = Noise_Min893_g23019;
				float4 temp_cast_8 = (temp_output_7_0_g23027).xxxx;
				half Noise_Max894_g23019 = _NoiseMaxValue;
				float temp_output_10_0_g23027 = ( Noise_Max894_g23019 - temp_output_7_0_g23027 );
				half2 Noise_Advanced1427_g23019 = (saturate( ( ( lerpResult39_g23025 - temp_cast_8 ) / temp_output_10_0_g23027 ) )).rg;
				half Noise_Intensity965_g23019 = _NoiseIntensityValue;
				float2 lerpResult1435_g23019 = lerp( (Direction_Advanced1454_g23019*0.5 + 0.5) , Noise_Advanced1427_g23019 , Noise_Intensity965_g23019);
				half Motion_Power1000_g23019 = _MotionPower;
				float3 appendResult1436_g23019 = (float3(lerpResult1435_g23019 , Motion_Power1000_g23019));
				half3 Final_MotionAdvanced_RGB1438_g23019 = appendResult1436_g23019;
				half3 Input_Color94_g23140 = Final_MotionAdvanced_RGB1438_g23019;
				half3 Element_Valid47_g23140 = ( Input_Color94_g23140 * Input_Color94_g23140 );
				half4 Colors37_g23152 = TVE_ColorsPosition;
				half4 Extras37_g23152 = TVE_ExtrasPosition;
				half4 Motion37_g23152 = TVE_MotionPosition;
				half4 Vertex37_g23152 = TVE_VertexPosition;
				half4 localIS_ELEMENT37_g23152 = IS_ELEMENT( Colors37_g23152 , Extras37_g23152 , Motion37_g23152 , Vertex37_g23152 );
				half4 Colors37_g23153 = TVE_ColorsScale;
				half4 Extras37_g23153 = TVE_ExtrasScale;
				half4 Motion37_g23153 = TVE_MotionScale;
				half4 Vertex37_g23153 = TVE_VertexScale;
				half4 localIS_ELEMENT37_g23153 = IS_ELEMENT( Colors37_g23153 , Extras37_g23153 , Motion37_g23153 , Vertex37_g23153 );
				half Bounds42_g23140 = ( 1.0 - saturate( ( distance( max( ( abs( ( WorldPosition - (localIS_ELEMENT37_g23152).xyz ) ) - ( (localIS_ELEMENT37_g23153).xyz * float3( 0.5,0.5,0.5 ) ) ) , float3( 0,0,0 ) ) , float3( 0,0,0 ) ) / 0.001 ) ) );
				float3 lerpResult50_g23140 = lerp( temp_cast_0 , Element_Valid47_g23140 , Bounds42_g23140);
				half CrossHatch44_g23140 = ( saturate( ( ( abs( sin( ( ( WorldPosition.x + WorldPosition.z ) * 3.0 ) ) ) - 0.7 ) * 100.0 ) ) * 0.25 );
				float clampResult17_g23210 = clamp( (MainTex_RGBA587_g23019).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g23211 = _MainTexAlphaMinValue;
				float temp_output_10_0_g23211 = ( _MainTexAlphaMaxValue - temp_output_7_0_g23211 );
				half Element_Remap_A74_g23019 = saturate( ( ( clampResult17_g23210 - temp_output_7_0_g23211 ) / ( temp_output_10_0_g23211 + 0.0001 ) ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g23019 = _ElementParams_Instance.w;
				half Element_Fallof1883_g23019 = 1.0;
				half4 Colors37_g23030 = TVE_ColorsCoords;
				half4 Extras37_g23030 = TVE_ExtrasCoords;
				half4 Motion37_g23030 = TVE_MotionCoords;
				half4 Vertex37_g23030 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g23030 = IS_ELEMENT( Colors37_g23030 , Extras37_g23030 , Motion37_g23030 , Vertex37_g23030 );
				float4 temp_output_35_0_g23034 = localIS_ELEMENT37_g23030;
				float temp_output_7_0_g23035 = TVE_ElementsFadeValue;
				float2 temp_cast_9 = (temp_output_7_0_g23035).xx;
				float temp_output_10_0_g23035 = ( 1.0 - temp_output_7_0_g23035 );
				float2 temp_output_16_0_g23028 = saturate( ( ( abs( (( (temp_output_35_0_g23034).zw + ( (temp_output_35_0_g23034).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_9 ) / temp_output_10_0_g23035 ) );
				float2 temp_output_12_0_g23028 = ( temp_output_16_0_g23028 * temp_output_16_0_g23028 );
				float lerpResult842_g23019 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g23028).x + (temp_output_12_0_g23028).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g23019 = ( _ElementIntensity * Element_Remap_A74_g23019 * Element_Params_A1737_g23019 * i.ase_color.a * Element_Fallof1883_g23019 * lerpResult842_g23019 );
				half Final_MotionAdvanced_A1439_g23019 = Element_Alpha56_g23019;
				half Input_Alpha48_g23140 = Final_MotionAdvanced_A1439_g23019;
				float lerpResult57_g23140 = lerp( CrossHatch44_g23140 , Input_Alpha48_g23140 , Bounds42_g23140);
				float4 appendResult58_g23140 = (float4(lerpResult50_g23140 , lerpResult57_g23140));
				
				
				finalColor = appendResult58_g23140;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderElementGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.FunctionNode;177;-640,-1280;Inherit;False;Define Element Motion;71;;19669;6eebc31017d99e84e811285e6a5d199d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;197;-640,-1152;Half;False;Property;_render_colormask;_render_colormask;73;1;[HideInInspector];Create;True;0;0;0;True;0;False;15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;115;-224,-1280;Half;False;Property;_Message;Message;1;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Motion Advanced elements to add noise to the motion direction. Element Texture A is used as alpha mask. Particle Alpha is used as Element Intensity multiplier. The noise is animated in the element forward direction and it is updated with particles or in play mode only., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-352,-1280;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;False;1;StyledBanner(Motion Advanced Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;416;0,-1280;Inherit;False;Compile All Elements;-1;;22914;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;417;0,-896;Float;False;True;-1;2;TVEShaderElementGUI;100;18;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Motion Advanced;f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;2;5;False;;10;False;;4;1;False;;1;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;True;True;True;True;0;True;_render_colormask;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=VolumePass;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;418;0,-768;Float;False;False;-1;2;ASEMaterialInspector;100;18;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;433;-640,-896;Inherit;False;Base Element;2;;23019;0e972c73cae2ee54ea51acc9738801d0;10,477,2,1778,2,478,0,1824,0,145,3,1814,3,481,2,1784,2,1904,0,1907,0;0;2;FLOAT4;0;FLOAT4;1779
WireConnection;417;0;433;0
WireConnection;418;0;433;1779
ASEEND*/
//CHKSM=224FA91747491AAF4E2544EE82C932173B70AD90