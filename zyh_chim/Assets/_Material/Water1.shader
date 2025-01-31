﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Custom/Water1" {
//	Properties{
//		_MainTex("Base (RGB)", 2D) = "white" {}
//	_ScrollXSpeed("X Scrll Speed", Range(0, 10)) = 2
//		_ScrollYSpeed("Y Scrll Speed", Range(0, 10)) = 2
//	}
//		SubShader{
//		Tags{ "RenderType" = "Opaque" }
//		LOD 200
//
//		CGPROGRAM
//		// Physically based Standard lighting model, and enable shadows on all light types
//#pragma surface surf Lambert
//
//		// Use shader model 3.0 target, to get nicer looking lighting
//#pragma target 3.0
//
//		fixed _ScrollXSpeed;
//	fixed _ScrollYSpeed;
//	sampler2D _MainTex;
//
//	struct Input {
//		float2 uv_MainTex;
//	};
//
//
//
//	void surf(Input IN, inout SurfaceOutput o) {
//		fixed2 scrolledUV = IN.uv_MainTex;
//
//		fixed xScrollValue = _ScrollXSpeed * _Time;
//		fixed yScrollValue = _ScrollYSpeed * _Time;
//
//		scrolledUV += fixed2(xScrollValue, yScrollValue);
//
//		half4 c = tex2D(_MainTex, scrolledUV);
//		o.Albedo = c.rgb;
//		o.Alpha = c.a;
//	}
//	ENDCG
//	}
//		FallBack "Diffuse"
//}


	/*	Properties{
			_MainTex("Water Texture1", 2D) = "white" {}
		_MainTex2("Water Texture2", 2D) = "white" {}

		_XScrollSpeed1("X ScrollSpeed 1", float) = 0
			_YScrollSpeed1("Y ScrollSpeed 1", float) = 0

			_XScrollSpeed2("X ScrollSpeed 2", float) = 0
			_YScrollSpeed2("Y ScrollSpeed 2", float) = 0
		}
			SubShader{
			Tags{ "RenderType" = "Opaque" }
			LOD 200

			CGPROGRAM
#pragma surface surf Lambert

			sampler2D _MainTex;
		sampler2D _MainTex2;

		float _XScrollSpeed1;
		float _YScrollSpeed1;
		float _XScrollSpeed2;
		float _YScrollSpeed2;

		struct Input {
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o) {
			float2 uvScrolled1 = IN.uv_MainTex;
			float2 uvScrolled2 = IN.uv_MainTex;

			uvScrolled1 += float2(_XScrollSpeed1 * _Time.y, _YScrollSpeed1 * _Time.y);
			uvScrolled2 += float2(_XScrollSpeed2 * _Time.y, _YScrollSpeed2 * _Time.y);

			half4 water1 = tex2D(_MainTex, uvScrolled1);
			half4 water2 = tex2D(_MainTex2, uvScrolled2);

			o.Albedo = water1.rgb * 0.5 + water2.rgb * 0.5;
			o.Alpha = 1.0;
		}
		ENDCG
		}
			FallBack "Diffuse"
	}*/

	Properties{
		_snow("snow", 2D) = "white" {}
	_Color("Color", Color) = (0.5019608,0.5019608,0.5019608,1)
		_Metallic("Metallic", Range(0, 1)) = 0.6030321
		_Gloss("Gloss", Range(0, 1)) = 0.3252537
		_BumpMap("Normal Map I", 2D) = "bump" {}
	_NormalMapII("Normal Map II", 2D) = "bump" {}
	_snow_slider("snow_slider", Range(0, 10)) = 7.350427
		_Freezeeffectnormal("Freeze effect (normal)", Range(0, 10)) = 4.77537
		[MaterialToggle] _LocalGlobal("Local/Global", Float) = 0
		_Transparency("Transparency", Range(-1, 1)) = 0.490779
		_Ice_fresnel("Ice_fresnel", Range(0, 3)) = 0.4528386
		[HideInInspector]_Cutoff("Alpha cutoff", Range(0,1)) = 0.5
	}
		SubShader{
		Tags{
		"IgnoreProjector" = "True"
		"Queue" = "Transparent"
		"RenderType" = "Transparent"
	}
		GrabPass{}
		Pass{
		Name "FORWARD"
		Tags{
		"LightMode" = "ForwardBase"
	}
		Blend SrcAlpha OneMinusSrcAlpha
		ZWrite Off

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#define UNITY_PASS_FORWARDBASE
#define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
#define _GLOSSYENV 1
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"
#include "UnityStandardBRDF.cginc"
#pragma multi_compile_fwdbase
#pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
#pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
#pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
#pragma multi_compile_fog
#pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
#pragma target 3.0
		uniform sampler2D _GrabTexture;
	uniform float4 _Color;
	uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
	uniform float _Metallic;
	uniform float _Gloss;
	uniform sampler2D _snow; uniform float4 _snow_ST;
	uniform float _Transparency;
	uniform float _Ice_fresnel;
	struct VertexInput {
		float4 vertex : POSITION;
		float3 normal : NORMAL;
		float4 tangent : TANGENT;
		float2 texcoord0 : TEXCOORD0;
		float2 texcoord1 : TEXCOORD1;
		float2 texcoord2 : TEXCOORD2;
	};
	struct VertexOutput {
		float4 pos : SV_POSITION;
		float2 uv0 : TEXCOORD0;
		float2 uv1 : TEXCOORD1;
		float2 uv2 : TEXCOORD2;
		float4 posWorld : TEXCOORD3;
		float3 normalDir : TEXCOORD4;
		float3 tangentDir : TEXCOORD5;
		float3 bitangentDir : TEXCOORD6;
		float4 projPos : TEXCOORD7;
		UNITY_FOG_COORDS(8)
#if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
			float4 ambientOrLightmapUV : TEXCOORD9;
#endif
	};
	VertexOutput vert(VertexInput v) {
		VertexOutput o = (VertexOutput)0;
		o.uv0 = v.texcoord0;
		o.uv1 = v.texcoord1;
		o.uv2 = v.texcoord2;
#ifdef LIGHTMAP_ON
		o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
		o.ambientOrLightmapUV.zw = 0;
#elif UNITY_SHOULD_SAMPLE_SH
#endif
#ifdef DYNAMICLIGHTMAP_ON
		o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif
		o.normalDir = UnityObjectToWorldNormal(v.normal);
		o.tangentDir = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
		o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
		o.posWorld = mul(unity_ObjectToWorld, v.vertex);
		float3 lightColor = _LightColor0.rgb;
		o.pos = UnityObjectToClipPos(v.vertex);
		UNITY_TRANSFER_FOG(o,o.pos);
		o.projPos = ComputeScreenPos(o.pos);
		COMPUTE_EYEDEPTH(o.projPos.z);
		return o;
	}
	float4 frag(VertexOutput i) : COLOR{
		i.normalDir = normalize(i.normalDir);
	float3x3 tangentTransform = float3x3(i.tangentDir, i.bitangentDir, i.normalDir);
	float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
	float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
	float3 normalLocal = _BumpMap_var.rgb;
	float3 normalDirection = normalize(mul(normalLocal, tangentTransform)); // Perturbed normals
	float3 viewReflectDirection = reflect(-viewDirection, normalDirection);
	float node_1294 = pow(1.0 - max(0,dot(normalDirection, viewDirection)),_Ice_fresnel);
	float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (i.uv0*node_1294);
	float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
	float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
	float3 lightColor = _LightColor0.rgb;
	float3 halfDirection = normalize(viewDirection + lightDirection);
	////// Lighting:
	float attenuation = 1;
	float3 attenColor = attenuation * _LightColor0.xyz;
	float Pi = 3.141592654;
	float InvPi = 0.31830988618;
	///////// Gloss:
	float gloss = (_Gloss*0.7);
	float perceptualRoughness = 1.0 - (_Gloss*0.7);
	float roughness = perceptualRoughness * perceptualRoughness;
	float specPow = exp2(gloss * 10.0 + 1.0);
	/////// GI Data:
	UnityLight light;
#ifdef LIGHTMAP_OFF
	light.color = lightColor;
	light.dir = lightDirection;
	light.ndotl = LambertTerm(normalDirection, light.dir);
#else
	light.color = half3(0.f, 0.f, 0.f);
	light.ndotl = 0.0f;
	light.dir = half3(0.f, 0.f, 0.f);
#endif
	UnityGIInput d;
	d.light = light;
	d.worldPos = i.posWorld.xyz;
	d.worldViewDir = viewDirection;
	d.atten = attenuation;
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
	d.ambient = 0;
	d.lightmapUV = i.ambientOrLightmapUV;
#else
	d.ambient = i.ambientOrLightmapUV;
#endif
#if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
	d.boxMin[0] = unity_SpecCube0_BoxMin;
	d.boxMin[1] = unity_SpecCube1_BoxMin;
#endif
#if UNITY_SPECCUBE_BOX_PROJECTION
	d.boxMax[0] = unity_SpecCube0_BoxMax;
	d.boxMax[1] = unity_SpecCube1_BoxMax;
	d.probePosition[0] = unity_SpecCube0_ProbePosition;
	d.probePosition[1] = unity_SpecCube1_ProbePosition;
#endif
	d.probeHDR[0] = unity_SpecCube0_HDR;
	d.probeHDR[1] = unity_SpecCube1_HDR;
	Unity_GlossyEnvironmentData ugls_en_data;
	ugls_en_data.roughness = 1.0 - gloss;
	ugls_en_data.reflUVW = viewReflectDirection;
	UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data);
	lightDirection = gi.light.dir;
	lightColor = gi.light.color;
	////// Specular:
	float NdotL = saturate(dot(normalDirection, lightDirection));
	float LdotH = saturate(dot(lightDirection, halfDirection));
	float3 specularColor = (_Metallic*1.0);
	float specularMonochrome;
	float4 _snow_var = tex2D(_snow,TRANSFORM_TEX(i.uv0, _snow));
	float3 diffuseColor = (_Color.rgb*_snow_var.rgb); // Need this for specular when using metallic
	diffuseColor = DiffuseAndSpecularFromMetallic(diffuseColor, specularColor, specularColor, specularMonochrome);
	specularMonochrome = 1.0 - specularMonochrome;
	float NdotV = abs(dot(normalDirection, viewDirection));
	float NdotH = saturate(dot(normalDirection, halfDirection));
	float VdotH = saturate(dot(viewDirection, halfDirection));
	float visTerm = SmithJointGGXVisibilityTerm(NdotL, NdotV, roughness);
	float normTerm = GGXTerm(NdotH, roughness);
	float specularPBL = (visTerm*normTerm) * UNITY_PI;
#ifdef UNITY_COLORSPACE_GAMMA
	specularPBL = sqrt(max(1e-4h, specularPBL));
#endif
	specularPBL = max(0, specularPBL * NdotL);
#if defined(_SPECULARHIGHLIGHTS_OFF)
	specularPBL = 0.0;
#endif
	half surfaceReduction;
#ifdef UNITY_COLORSPACE_GAMMA
	surfaceReduction = 1.0 - 0.28*roughness*perceptualRoughness;
#else
	surfaceReduction = 1.0 / (roughness*roughness + 1.0);
#endif
	specularPBL *= any(specularColor) ? 1.0 : 0.0;
	float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
	half grazingTerm = saturate(gloss + specularMonochrome);
	float3 indirectSpecular = (gi.indirect.specular);
	indirectSpecular *= FresnelLerp(specularColor, grazingTerm, NdotV);
	indirectSpecular *= surfaceReduction;
	float3 specular = (directSpecular + indirectSpecular);
	/////// Diffuse:
	NdotL = max(0.0,dot(normalDirection, lightDirection));
	half fd90 = 0.5 + 2 * LdotH * LdotH * (1 - gloss);
	float nlPow5 = Pow5(1 - NdotL);
	float nvPow5 = Pow5(1 - NdotV);
	float3 directDiffuse = ((1 + (fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
	float3 indirectDiffuse = float3(0,0,0);
	indirectDiffuse += gi.indirect.diffuse;
	float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
	/// Final Color:
	float3 finalColor = diffuse + specular;
	fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,lerp(node_1294,1.0,_Transparency)),1);
	UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
	return finalRGBA;
	}
		ENDCG
	}
		Pass{
		Name "FORWARD_DELTA"
		Tags{
		"LightMode" = "ForwardAdd"
	}
		Blend One One
		ZWrite Off

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#define UNITY_PASS_FORWARDADD
#define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
#define _GLOSSYENV 1
#include "UnityCG.cginc"
#include "AutoLight.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"
#include "UnityStandardBRDF.cginc"
#pragma multi_compile_fwdadd
#pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
#pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
#pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
#pragma multi_compile_fog
#pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
#pragma target 3.0
		uniform sampler2D _GrabTexture;
	uniform float4 _Color;
	uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
	uniform float _Metallic;
	uniform float _Gloss;
	uniform sampler2D _snow; uniform float4 _snow_ST;
	uniform float _Transparency;
	uniform float _Ice_fresnel;
	struct VertexInput {
		float4 vertex : POSITION;
		float3 normal : NORMAL;
		float4 tangent : TANGENT;
		float2 texcoord0 : TEXCOORD0;
		float2 texcoord1 : TEXCOORD1;
		float2 texcoord2 : TEXCOORD2;
	};
	struct VertexOutput {
		float4 pos : SV_POSITION;
		float2 uv0 : TEXCOORD0;
		float2 uv1 : TEXCOORD1;
		float2 uv2 : TEXCOORD2;
		float4 posWorld : TEXCOORD3;
		float3 normalDir : TEXCOORD4;
		float3 tangentDir : TEXCOORD5;
		float3 bitangentDir : TEXCOORD6;
		float4 projPos : TEXCOORD7;
		LIGHTING_COORDS(8,9)
			UNITY_FOG_COORDS(10)
	};
	VertexOutput vert(VertexInput v) {
		VertexOutput o = (VertexOutput)0;
		o.uv0 = v.texcoord0;
		o.uv1 = v.texcoord1;
		o.uv2 = v.texcoord2;
		o.normalDir = UnityObjectToWorldNormal(v.normal);
		o.tangentDir = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
		o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
		o.posWorld = mul(unity_ObjectToWorld, v.vertex);
		float3 lightColor = _LightColor0.rgb;
		o.pos = UnityObjectToClipPos(v.vertex);
		UNITY_TRANSFER_FOG(o,o.pos);
		o.projPos = ComputeScreenPos(o.pos);
		COMPUTE_EYEDEPTH(o.projPos.z);
		TRANSFER_VERTEX_TO_FRAGMENT(o)
			return o;
	}
	float4 frag(VertexOutput i) : COLOR{
		i.normalDir = normalize(i.normalDir);
	float3x3 tangentTransform = float3x3(i.tangentDir, i.bitangentDir, i.normalDir);
	float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
	float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
	float3 normalLocal = _BumpMap_var.rgb;
	float3 normalDirection = normalize(mul(normalLocal, tangentTransform)); // Perturbed normals
	float node_1294 = pow(1.0 - max(0,dot(normalDirection, viewDirection)),_Ice_fresnel);
	float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (i.uv0*node_1294);
	float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
	float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
	float3 lightColor = _LightColor0.rgb;
	float3 halfDirection = normalize(viewDirection + lightDirection);
	////// Lighting:
	float attenuation = LIGHT_ATTENUATION(i);
	float3 attenColor = attenuation * _LightColor0.xyz;
	float Pi = 3.141592654;
	float InvPi = 0.31830988618;
	///////// Gloss:
	float gloss = (_Gloss*0.7);
	float perceptualRoughness = 1.0 - (_Gloss*0.7);
	float roughness = perceptualRoughness * perceptualRoughness;
	float specPow = exp2(gloss * 10.0 + 1.0);
	////// Specular:
	float NdotL = saturate(dot(normalDirection, lightDirection));
	float LdotH = saturate(dot(lightDirection, halfDirection));
	float3 specularColor = (_Metallic*1.0);
	float specularMonochrome;
	float4 _snow_var = tex2D(_snow,TRANSFORM_TEX(i.uv0, _snow));
	float3 diffuseColor = (_Color.rgb*_snow_var.rgb); // Need this for specular when using metallic
	diffuseColor = DiffuseAndSpecularFromMetallic(diffuseColor, specularColor, specularColor, specularMonochrome);
	specularMonochrome = 1.0 - specularMonochrome;
	float NdotV = abs(dot(normalDirection, viewDirection));
	float NdotH = saturate(dot(normalDirection, halfDirection));
	float VdotH = saturate(dot(viewDirection, halfDirection));
	float visTerm = SmithJointGGXVisibilityTerm(NdotL, NdotV, roughness);
	float normTerm = GGXTerm(NdotH, roughness);
	float specularPBL = (visTerm*normTerm) * UNITY_PI;
#ifdef UNITY_COLORSPACE_GAMMA
	specularPBL = sqrt(max(1e-4h, specularPBL));
#endif
	specularPBL = max(0, specularPBL * NdotL);
#if defined(_SPECULARHIGHLIGHTS_OFF)
	specularPBL = 0.0;
#endif
	specularPBL *= any(specularColor) ? 1.0 : 0.0;
	float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
	float3 specular = directSpecular;
	/////// Diffuse:
	NdotL = max(0.0,dot(normalDirection, lightDirection));
	half fd90 = 0.5 + 2 * LdotH * LdotH * (1 - gloss);
	float nlPow5 = Pow5(1 - NdotL);
	float nvPow5 = Pow5(1 - NdotV);
	float3 directDiffuse = ((1 + (fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
	float3 diffuse = directDiffuse * diffuseColor;
	/// Final Color:
	float3 finalColor = diffuse + specular;
	fixed4 finalRGBA = fixed4(finalColor * lerp(node_1294,1.0,_Transparency),0);
	UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
	return finalRGBA;
	}
		ENDCG
	}
		Pass{
		Name "Meta"
		Tags{
		"LightMode" = "Meta"
	}
		Cull Off

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#define UNITY_PASS_META 1
#define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
#define _GLOSSYENV 1
#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "UnityPBSLighting.cginc"
#include "UnityStandardBRDF.cginc"
#include "UnityMetaPass.cginc"
#pragma fragmentoption ARB_precision_hint_fastest
#pragma multi_compile_shadowcaster
#pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
#pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
#pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
#pragma multi_compile_fog
#pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
#pragma target 3.0
		uniform float4 _Color;
	uniform float _Metallic;
	uniform float _Gloss;
	uniform sampler2D _snow; uniform float4 _snow_ST;
	struct VertexInput {
		float4 vertex : POSITION;
		float2 texcoord0 : TEXCOORD0;
		float2 texcoord1 : TEXCOORD1;
		float2 texcoord2 : TEXCOORD2;
	};
	struct VertexOutput {
		float4 pos : SV_POSITION;
		float2 uv0 : TEXCOORD0;
		float2 uv1 : TEXCOORD1;
		float2 uv2 : TEXCOORD2;
		float4 posWorld : TEXCOORD3;
	};
	VertexOutput vert(VertexInput v) {
		VertexOutput o = (VertexOutput)0;
		o.uv0 = v.texcoord0;
		o.uv1 = v.texcoord1;
		o.uv2 = v.texcoord2;
		o.posWorld = mul(unity_ObjectToWorld, v.vertex);
		o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
		return o;
	}
	float4 frag(VertexOutput i) : SV_Target{
		float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
		UnityMetaInput o;
		UNITY_INITIALIZE_OUTPUT(UnityMetaInput, o);

		o.Emission = 0;

		float4 _snow_var = tex2D(_snow,TRANSFORM_TEX(i.uv0, _snow));
		float3 diffColor = (_Color.rgb*_snow_var.rgb);
		float specularMonochrome;
		float3 specColor;
		diffColor = DiffuseAndSpecularFromMetallic(diffColor, (_Metallic*1.0), specColor, specularMonochrome);
		float roughness = 1.0 - (_Gloss*0.7);
		o.Albedo = diffColor + specColor * roughness * roughness * 0.5;

		return UnityMetaFragment(o);
	}
		ENDCG
	}
	}
		FallBack "Diffuse"
		CustomEditor "ShaderForgeMaterialInspector"
}
