// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVegetationEngineElementsDefaultMotionInteraction' to new syntax.

// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Elements/Default/Motion Interaction"
{
	Properties
	{
		[StyledMessage(Info, Use the Motion Interaction elements to add touch bending to the vegetation objects. Element Texture RG is used a World XZ bending and Texture A is used as interaction mask. Particle Color A is used as Element Intensity multiplier. The Noise direction is controled by the Element Texture RG direction and it is updated with particles or in play mode only., 0,0)]_Message("Message", Float) = 0
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
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseRemap("Noise Remap", Vector) = (0,0,0,0)
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
			Offset 0 , 0
			
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define TVE_IS_MOTION_ELEMENT


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsMotionElement;
			uniform half _Message;
			uniform half _render_colormask;
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
			uniform sampler2D _MainTex;
			uniform half _MainTexColorMinValue;
			uniform half _MainTexColorMaxValue;
			uniform float _ElementInvertMode;
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
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultMotionInteraction)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultMotionInteraction
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultMotionInteraction)
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

				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
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
				half4 MainTex_RGBA587_g22224 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.xy ) );
				float3 temp_cast_0 = (0.0001).xxx;
				float3 temp_cast_1 = (0.9999).xxx;
				float3 clampResult17_g22417 = clamp( (MainTex_RGBA587_g22224).rgb , temp_cast_0 , temp_cast_1 );
				float temp_output_7_0_g22418 = _MainTexColorMinValue;
				float3 temp_cast_2 = (temp_output_7_0_g22418).xxx;
				float temp_output_10_0_g22418 = ( _MainTexColorMaxValue - temp_output_7_0_g22418 );
				float3 temp_output_1765_0_g22224 = saturate( ( ( clampResult17_g22417 - temp_cast_2 ) / temp_output_10_0_g22418 ) );
				half Element_Remap_R73_g22224 = (temp_output_1765_0_g22224).x;
				half Element_Remap_G265_g22224 = (temp_output_1765_0_g22224).y;
				float3 appendResult274_g22224 = (float3((Element_Remap_R73_g22224*2.0 + -1.0) , 0.0 , (Element_Remap_G265_g22224*2.0 + -1.0)));
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				float3 break281_g22224 = ( mul( unity_ObjectToWorld, float4( appendResult274_g22224 , 0.0 ) ).xyz / ase_objectScale );
				float2 appendResult1403_g22224 = (float2(break281_g22224.x , break281_g22224.z));
				half2 Direction_Texture284_g22224 = appendResult1403_g22224;
				half Element_InvertMode489_g22224 = _ElementInvertMode;
				float2 lerpResult1471_g22224 = lerp( Direction_Texture284_g22224 , -Direction_Texture284_g22224 , Element_InvertMode489_g22224);
				half Motion_Power1000_g22224 = _MotionPower;
				float3 appendResult292_g22224 = (float3((lerpResult1471_g22224*0.5 + 0.5) , Motion_Power1000_g22224));
				half3 Final_MotionInteraction_RGB303_g22224 = appendResult292_g22224;
				float clampResult17_g22415 = clamp( (MainTex_RGBA587_g22224).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g22416 = _MainTexAlphaMinValue;
				float temp_output_10_0_g22416 = ( _MainTexAlphaMaxValue - temp_output_7_0_g22416 );
				half Element_Remap_A74_g22224 = saturate( ( ( clampResult17_g22415 - temp_output_7_0_g22416 ) / ( temp_output_10_0_g22416 + 0.0001 ) ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g22224 = _ElementParams_Instance.w;
				half Element_Fallof1883_g22224 = 1.0;
				half4 Colors37_g22235 = TVE_ColorsCoords;
				half4 Extras37_g22235 = TVE_ExtrasCoords;
				half4 Motion37_g22235 = TVE_MotionCoords;
				half4 Vertex37_g22235 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g22235 = IS_ELEMENT( Colors37_g22235 , Extras37_g22235 , Motion37_g22235 , Vertex37_g22235 );
				float4 temp_output_35_0_g22239 = localIS_ELEMENT37_g22235;
				float temp_output_7_0_g22240 = TVE_ElementsFadeValue;
				float2 temp_cast_5 = (temp_output_7_0_g22240).xx;
				float temp_output_10_0_g22240 = ( 1.0 - temp_output_7_0_g22240 );
				float2 temp_output_16_0_g22233 = saturate( ( ( abs( (( (temp_output_35_0_g22239).zw + ( (temp_output_35_0_g22239).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_5 ) / temp_output_10_0_g22240 ) );
				float2 temp_output_12_0_g22233 = ( temp_output_16_0_g22233 * temp_output_16_0_g22233 );
				float lerpResult842_g22224 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g22233).x + (temp_output_12_0_g22233).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g22224 = ( _ElementIntensity * Element_Remap_A74_g22224 * Element_Params_A1737_g22224 * i.ase_color.a * Element_Fallof1883_g22224 * lerpResult842_g22224 );
				half Final_MotionInteraction_A305_g22224 = Element_Alpha56_g22224;
				float4 appendResult479_g22224 = (float4(Final_MotionInteraction_RGB303_g22224 , Final_MotionInteraction_A305_g22224));
				half Element_EffectMotion946_g22224 = _ElementMotionMode;
				
				
				finalColor = ( appendResult479_g22224 + ( Element_EffectMotion946_g22224 * 0.0 ) );
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
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define TVE_IS_MOTION_ELEMENT


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsMotionElement;
			uniform half _Message;
			uniform half _render_colormask;
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
			uniform sampler2D _MainTex;
			uniform half _MainTexColorMinValue;
			uniform half _MainTexColorMaxValue;
			uniform float _ElementInvertMode;
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
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVegetationEngineElementsDefaultMotionInteraction)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVegetationEngineElementsDefaultMotionInteraction
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVegetationEngineElementsDefaultMotionInteraction)
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

				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
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
				half4 MainTex_RGBA587_g22224 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.xy ) );
				float3 temp_cast_1 = (0.0001).xxx;
				float3 temp_cast_2 = (0.9999).xxx;
				float3 clampResult17_g22417 = clamp( (MainTex_RGBA587_g22224).rgb , temp_cast_1 , temp_cast_2 );
				float temp_output_7_0_g22418 = _MainTexColorMinValue;
				float3 temp_cast_3 = (temp_output_7_0_g22418).xxx;
				float temp_output_10_0_g22418 = ( _MainTexColorMaxValue - temp_output_7_0_g22418 );
				float3 temp_output_1765_0_g22224 = saturate( ( ( clampResult17_g22417 - temp_cast_3 ) / temp_output_10_0_g22418 ) );
				half Element_Remap_R73_g22224 = (temp_output_1765_0_g22224).x;
				half Element_Remap_G265_g22224 = (temp_output_1765_0_g22224).y;
				float3 appendResult274_g22224 = (float3((Element_Remap_R73_g22224*2.0 + -1.0) , 0.0 , (Element_Remap_G265_g22224*2.0 + -1.0)));
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				float3 break281_g22224 = ( mul( unity_ObjectToWorld, float4( appendResult274_g22224 , 0.0 ) ).xyz / ase_objectScale );
				float2 appendResult1403_g22224 = (float2(break281_g22224.x , break281_g22224.z));
				half2 Direction_Texture284_g22224 = appendResult1403_g22224;
				half Element_InvertMode489_g22224 = _ElementInvertMode;
				float2 lerpResult1471_g22224 = lerp( Direction_Texture284_g22224 , -Direction_Texture284_g22224 , Element_InvertMode489_g22224);
				half Motion_Power1000_g22224 = _MotionPower;
				float3 appendResult292_g22224 = (float3((lerpResult1471_g22224*0.5 + 0.5) , Motion_Power1000_g22224));
				half3 Final_MotionInteraction_RGB303_g22224 = appendResult292_g22224;
				half3 Input_Color94_g22359 = Final_MotionInteraction_RGB303_g22224;
				half3 Element_Valid47_g22359 = ( Input_Color94_g22359 * Input_Color94_g22359 );
				half4 Colors37_g22371 = TVE_ColorsPosition;
				half4 Extras37_g22371 = TVE_ExtrasPosition;
				half4 Motion37_g22371 = TVE_MotionPosition;
				half4 Vertex37_g22371 = TVE_VertexPosition;
				half4 localIS_ELEMENT37_g22371 = IS_ELEMENT( Colors37_g22371 , Extras37_g22371 , Motion37_g22371 , Vertex37_g22371 );
				half4 Colors37_g22372 = TVE_ColorsScale;
				half4 Extras37_g22372 = TVE_ExtrasScale;
				half4 Motion37_g22372 = TVE_MotionScale;
				half4 Vertex37_g22372 = TVE_VertexScale;
				half4 localIS_ELEMENT37_g22372 = IS_ELEMENT( Colors37_g22372 , Extras37_g22372 , Motion37_g22372 , Vertex37_g22372 );
				half Bounds42_g22359 = ( 1.0 - saturate( ( distance( max( ( abs( ( WorldPosition - (localIS_ELEMENT37_g22371).xyz ) ) - ( (localIS_ELEMENT37_g22372).xyz * float3( 0.5,0.5,0.5 ) ) ) , float3( 0,0,0 ) ) , float3( 0,0,0 ) ) / 0.001 ) ) );
				float3 lerpResult50_g22359 = lerp( temp_cast_0 , Element_Valid47_g22359 , Bounds42_g22359);
				half CrossHatch44_g22359 = ( saturate( ( ( abs( sin( ( ( WorldPosition.x + WorldPosition.z ) * 3.0 ) ) ) - 0.7 ) * 100.0 ) ) * 0.25 );
				float clampResult17_g22415 = clamp( (MainTex_RGBA587_g22224).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g22416 = _MainTexAlphaMinValue;
				float temp_output_10_0_g22416 = ( _MainTexAlphaMaxValue - temp_output_7_0_g22416 );
				half Element_Remap_A74_g22224 = saturate( ( ( clampResult17_g22415 - temp_output_7_0_g22416 ) / ( temp_output_10_0_g22416 + 0.0001 ) ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g22224 = _ElementParams_Instance.w;
				half Element_Fallof1883_g22224 = 1.0;
				half4 Colors37_g22235 = TVE_ColorsCoords;
				half4 Extras37_g22235 = TVE_ExtrasCoords;
				half4 Motion37_g22235 = TVE_MotionCoords;
				half4 Vertex37_g22235 = TVE_VertexCoords;
				half4 localIS_ELEMENT37_g22235 = IS_ELEMENT( Colors37_g22235 , Extras37_g22235 , Motion37_g22235 , Vertex37_g22235 );
				float4 temp_output_35_0_g22239 = localIS_ELEMENT37_g22235;
				float temp_output_7_0_g22240 = TVE_ElementsFadeValue;
				float2 temp_cast_6 = (temp_output_7_0_g22240).xx;
				float temp_output_10_0_g22240 = ( 1.0 - temp_output_7_0_g22240 );
				float2 temp_output_16_0_g22233 = saturate( ( ( abs( (( (temp_output_35_0_g22239).zw + ( (temp_output_35_0_g22239).xy * (WorldPosition).xz ) )*2.002 + -1.001) ) - temp_cast_6 ) / temp_output_10_0_g22240 ) );
				float2 temp_output_12_0_g22233 = ( temp_output_16_0_g22233 * temp_output_16_0_g22233 );
				float lerpResult842_g22224 = lerp( 1.0 , ( 1.0 - saturate( ( (temp_output_12_0_g22233).x + (temp_output_12_0_g22233).y ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g22224 = ( _ElementIntensity * Element_Remap_A74_g22224 * Element_Params_A1737_g22224 * i.ase_color.a * Element_Fallof1883_g22224 * lerpResult842_g22224 );
				half Final_MotionInteraction_A305_g22224 = Element_Alpha56_g22224;
				half Input_Alpha48_g22359 = Final_MotionInteraction_A305_g22224;
				float lerpResult57_g22359 = lerp( CrossHatch44_g22359 , Input_Alpha48_g22359 , Bounds42_g22359);
				float4 appendResult58_g22359 = (float4(lerpResult50_g22359 , lerpResult57_g22359));
				
				
				finalColor = appendResult58_g22359;
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
Node;AmplifyShaderEditor.RangedFloatNode;115;-224,-1280;Half;False;Property;_Message;Message;1;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Motion Interaction elements to add touch bending to the vegetation objects. Element Texture RG is used a World XZ bending and Texture A is used as interaction mask. Particle Color A is used as Element Intensity multiplier. The Noise direction is controled by the Element Texture RG direction and it is updated with particles or in play mode only., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-352,-1280;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;False;1;StyledBanner(Motion Interaction Element);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;380;0,-1280;Inherit;False;Compile All Elements;-1;;21541;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;197;-640,-1152;Half;False;Property;_render_colormask;_render_colormask;73;1;[HideInInspector];Create;True;0;0;0;True;0;False;15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;382;0,-896;Float;False;True;-1;2;TVEShaderElementGUI;100;18;BOXOPHOBIC/The Vegetation Engine/Elements/Default/Motion Interaction;f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;2;5;False;;10;False;;4;1;False;;1;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;True;True;True;True;0;True;_render_colormask;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=VolumePass;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;383;0,-768;Float;False;False;-1;2;ASEMaterialInspector;100;18;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;True;True;True;True;0;False;_render_colormask;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;424;-640,-896;Inherit;False;Base Element;2;;22224;0e972c73cae2ee54ea51acc9738801d0;10,477,2,1778,2,478,0,1824,0,145,3,1814,3,481,1,1784,1,1904,0,1907,0;0;2;FLOAT4;0;FLOAT4;1779
WireConnection;382;0;424;0
WireConnection;383;0;424;1779
ASEEND*/
//CHKSM=30224F41CD89F33B87A835606D2145AAAC4372D5