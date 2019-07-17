// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:35516,y:31853,varname:node_2865,prsc:2|diff-9564-OUT,spec-2528-OUT,gloss-9662-OUT,normal-5964-RGB,alpha-9203-OUT,refract-8987-OUT;n:type:ShaderForge.SFN_Color,id:6665,x:34395,y:31393,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5019608,c2:0.5019608,c3:0.5019608,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5964,x:35068,y:32171,ptovrint:True,ptlb:Normal Map I,ptin:_BumpMap,varname:_BumpMap,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e3ba8bc476e919b4b9308f1d6abe660b,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Slider,id:358,x:34381,y:31757,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_358,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6030321,max:1;n:type:ShaderForge.SFN_Slider,id:1813,x:34303,y:31868,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Metallic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3252537,max:1;n:type:ShaderForge.SFN_NormalVector,id:923,x:30267,y:32984,prsc:2,pt:False;n:type:ShaderForge.SFN_Abs,id:1916,x:30875,y:33194,varname:node_1916,prsc:2|IN-2671-OUT;n:type:ShaderForge.SFN_Multiply,id:3104,x:31086,y:33121,varname:node_3104,prsc:2|A-2671-OUT,B-1916-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6719,x:31301,y:33047,cmnt:Here we got the  G component from the RGB mask,varname:node_6719,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-3104-OUT;n:type:ShaderForge.SFN_Tex2d,id:2075,x:34257,y:31552,ptovrint:False,ptlb:snow,ptin:_snow,varname:node_2075,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:50c397b0cfd8e7f4cb233370c8999495,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Subtract,id:2187,x:32969,y:32608,cmnt:We remove G info to get cracks,varname:node_2187,prsc:2|A-6719-OUT;n:type:ShaderForge.SFN_Multiply,id:4640,x:33255,y:32639,varname:node_4640,prsc:2|A-2187-OUT,B-7590-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:9434,x:33151,y:32864,cmnt:Choosing a smaller range of info,varname:node_9434,prsc:2,min:0,max:0.8;n:type:ShaderForge.SFN_Slider,id:7590,x:32754,y:32362,ptovrint:False,ptlb:snow_slider,ptin:_snow_slider,varname:node_7590,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:7.350427,max:10;n:type:ShaderForge.SFN_Clamp01,id:4570,x:33466,y:32596,cmnt:This removes negative info wich includes the G values at the bottom,varname:node_4570,prsc:2|IN-4640-OUT;n:type:ShaderForge.SFN_Tex2d,id:3573,x:32867,y:33239,ptovrint:False,ptlb:Normal Map II,ptin:_NormalMapII,varname:node_3573,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fbba011cc6fa1474294f6700f3e9ac41,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector1,id:2855,x:34460,y:31954,varname:node_2855,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Vector1,id:5029,x:34617,y:31836,varname:node_5029,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:8846,x:33623,y:32376,varname:node_8846,prsc:2|A-7044-OUT,B-8462-OUT,C-4570-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:8462,x:33277,y:32401,varname:node_8462,prsc:2,min:0,max:1.2|IN-7590-OUT;n:type:ShaderForge.SFN_Vector1,id:7044,x:33277,y:32310,varname:node_7044,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Add,id:8245,x:33871,y:32398,cmnt:added freezing effect,varname:node_8245,prsc:2|A-8846-OUT,B-7249-OUT;n:type:ShaderForge.SFN_Multiply,id:7249,x:33681,y:32878,cmnt:added freezing effect...,varname:node_7249,prsc:2|A-9434-OUT,B-4603-OUT;n:type:ShaderForge.SFN_Slider,id:4603,x:33341,y:32971,ptovrint:False,ptlb:Freeze effect (normal),ptin:_Freezeeffectnormal,varname:node_4603,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.77537,max:10;n:type:ShaderForge.SFN_Transform,id:1053,x:30472,y:32829,varname:node_1053,prsc:2,tffrom:0,tfto:1|IN-923-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:2671,x:30670,y:33000,ptovrint:False,ptlb:Local/Global,ptin:_LocalGlobal,cmnt:Change between local orientation or global,varname:node_2671,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1053-XYZ,B-923-OUT;n:type:ShaderForge.SFN_Fresnel,id:1294,x:34865,y:32565,varname:node_1294,prsc:2|EXP-6482-OUT;n:type:ShaderForge.SFN_Lerp,id:9203,x:35088,y:32445,varname:node_9203,prsc:2|A-1294-OUT,B-337-OUT,T-5885-OUT;n:type:ShaderForge.SFN_Vector1,id:337,x:34865,y:32406,varname:node_337,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:4152,x:34983,y:32715,varname:node_4152,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8987,x:35200,y:32661,varname:node_8987,prsc:2|A-4152-UVOUT,B-1294-OUT;n:type:ShaderForge.SFN_Multiply,id:9564,x:34884,y:31515,varname:node_9564,prsc:2|A-6665-RGB,B-2075-RGB;n:type:ShaderForge.SFN_Slider,id:5885,x:34492,y:32458,ptovrint:False,ptlb:Transparency,ptin:_Transparency,varname:node_5885,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.490779,max:1;n:type:ShaderForge.SFN_Slider,id:6482,x:34492,y:32585,ptovrint:False,ptlb:Ice_fresnel,ptin:_Ice_fresnel,varname:node_6482,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4528386,max:3;n:type:ShaderForge.SFN_Multiply,id:2528,x:35018,y:31779,varname:node_2528,prsc:2|A-358-OUT,B-5029-OUT;n:type:ShaderForge.SFN_Multiply,id:9662,x:35107,y:31969,varname:node_9662,prsc:2|A-1813-OUT,B-2855-OUT;proporder:2075-6665-358-1813-5964-3573-7590-4603-2671-5885-6482;pass:END;sub:END;*/

Shader "Custom/Water" {
		Properties
		{
			_ColorShallow("Color (Shallow)", Color) = (0,0.2941177,0.2078431,0)
			_ColorDeep("Color (Deep)", Color) = (0,0.1803922,0.1254902,0)
			_Glossiness("Glossiness", Range(0 , 1)) = 0.75
			[HideInInspector]_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalBlendStrength("Normal Blend Strength", Range(0 , 1)) = 0
			_NormalMap1Strength("Normal Map 1 Strength", Range(0 , 1)) = 0
			_NormalMap2Strength("Normal Map 2 Strength", Range(0 , 1)) = 0
			_UVScale("UV Scale", Float) = 1
			_UV1Tiling("UV 1 Tiling", Float) = 0
			_UV2Tiling("UV 2 Tiling", Float) = 0
			_UV1Animator("UV 1 Animator", Vector) = (0,0,0,0)
			_UV2Animator("UV 2 Animator", Vector) = (0,0,0,0)
			[HideInInspector] __dirty("", Int) = 1

			_Color("Main Tint", Color) = (1,1,1,1)
			_MainTex("Main Tex", 2D) = "white" {}
		// 用于在透明纹理的基础上控制整体的透明度
		_AlphaScale("Alpha Scale", Range(0,1)) = 1
		}

			SubShader
		{
			Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
			Cull Off
			CGPROGRAM
#include "UnityStandardUtils.cginc"
#include "UnityShaderVariables.cginc"
#include "Lighting.cginc"

#pragma target 3.0
#pragma surface surf Standard keepalpha noshadow 


			struct Input
		{
			float3 worldPos;
			INTERNAL_DATA
		};



		uniform sampler2D _NormalMap;
		uniform float _NormalMap1Strength;
		uniform float2 _UV1Animator;
		uniform float _UVScale;
		uniform float _UV1Tiling;
		uniform float _NormalMap2Strength;
		uniform float2 _UV2Animator;
		uniform float _UV2Tiling;
		uniform float _NormalBlendStrength;
		uniform float4 _ColorDeep;
		uniform float4 _ColorShallow;
		uniform float _Glossiness;


		void surf(Input i, inout SurfaceOutputStandard o)
		{
			float3 ase_worldPos = i.worldPos;
			float2 appendResult19 = (float2(ase_worldPos.x, ase_worldPos.z));
			float2 _worldUV22 = (appendResult19 / _UVScale);
			float2 panner29 = (_Time.x * _UV1Animator + (_worldUV22 * _UV1Tiling));
			float2 _UV141 = panner29;
			float2 panner30 = (_Time.x * _UV2Animator + (_worldUV22 * _UV2Tiling));
			float2 _UV242 = panner30;
			float3 lerpResult4 = lerp(UnpackScaleNormal(tex2D(_NormalMap, _UV141), _NormalMap1Strength), UnpackScaleNormal(tex2D(_NormalMap, _UV242), _NormalMap2Strength), _NormalBlendStrength);
			float3 _normalMap12 = lerpResult4;
			o.Normal = _normalMap12;
			float3 ase_worldViewDir = normalize(UnityWorldSpaceViewDir(ase_worldPos));
			float fresnelNdotV14 = dot(_normalMap12, ase_worldViewDir);
			float fresnelNode14 = (0.0 + 1.0 * pow(1.0 - fresnelNdotV14, 1.336));
			float4 lerpResult11 = lerp(_ColorDeep, _ColorShallow, fresnelNode14);
			float4 _color16 = lerpResult11;
			o.Albedo = _color16.rgb;
			o.Smoothness = _Glossiness;
			o.Alpha = 1;
		}


		ENDCG
		}
			CustomEditor "ASEMaterialInspector"
	}
	/*ASEBEGIN
	Version=15700
	0;73;1407;813;2081.205;627.2566;1;True;False
	Node;AmplifyShaderEditor.CommentaryNode;25;-1887.509,127.3669;Float;False;1234.871;652.6294;Normal Map;10;5;1;6;7;3;2;4;12;43;44;;1,1,1,1;0;0
	Node;AmplifyShaderEditor.CommentaryNode;23;-1664.718,-1592.372;Float;False;1003.104;344.3098;World UV;5;18;19;20;21;22;;1,1,1,1;0;0
	Node;AmplifyShaderEditor.CommentaryNode;45;-1960.334,-1215.589;Float;False;1307.833;614.6536;UV 1 and 2;19;33;34;28;26;39;38;31;37;32;40;30;29;41;42;48;49;50;51;52;;1,1,1,1;0;0
	Node;AmplifyShaderEditor.CommentaryNode;24;-1857.353,-584.6671;Float;False;1207.816;691.6169;Color;6;15;9;14;10;11;16;;1,1,1,1;0;0
	Node;AmplifyShaderEditor.DynamicAppendNode;19;-1333.614,-1519.062;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.RangedFloatNode;34;-1638.633,-1147.188;Float;False;Property;_UV1Tiling;UV 1 Tiling;8;0;Create;True;0;0;False;0;0;0.5;0;0;0;1;FLOAT;0
	Node;AmplifyShaderEditor.TimeNode;28;-1910.334,-1008.889;Float;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
	Node;AmplifyShaderEditor.WorldPosInputsNode;18;-1614.718,-1542.372;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
	Node;AmplifyShaderEditor.Vector2Node;37;-1640.835,-828.2912;Float;False;Property;_UV2Animator;UV 2 Animator;11;0;Create;True;0;0;False;0;0,0;1,0.5;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
	Node;AmplifyShaderEditor.WireNode;49;-1484.578,-1174.945;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.WireNode;50;-1270.119,-813.7495;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.TexturePropertyNode;1;-1829.295,365.4403;Float;True;Property;_NormalMap;Normal Map;3;1;[HideInInspector];Create;True;0;0;False;0;be533234230ae5e4691ba6c71bd06458;be533234230ae5e4691ba6c71bd06458;True;bump;Auto;Texture2D;0;1;SAMPLER2D;0
	Node;AmplifyShaderEditor.GetLocalVarNode;13;-264.5653,-170.9892;Float;False;12;_normalMap;1;0;OBJECT;0;False;1;FLOAT3;0
	Node;AmplifyShaderEditor.FresnelNode;14;-1516.598,-146.0497;Float;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1.336;False;1;FLOAT;0
	Node;AmplifyShaderEditor.SamplerNode;2;-1485.134,217.5576;Float;True;Property;_TextureSample0;Texture Sample 0;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
	Node;AmplifyShaderEditor.WireNode;39;-1635.153,-682.9353;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
	Node;AmplifyShaderEditor.Vector2Node;38;-1338.752,-755.934;Float;False;Property;_UV1Animator;UV 1 Animator;10;0;Create;True;0;0;False;0;0,0;0.5,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
	Node;AmplifyShaderEditor.GetLocalVarNode;44;-1827.933,263.4472;Float;False;42;_UV2;1;0;OBJECT;0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.SimpleDivideOpNode;20;-1109.614,-1518.062;Float;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.GetLocalVarNode;17;-239.034,-261.7652;Float;False;16;_color;1;0;OBJECT;0;False;1;COLOR;0
	Node;AmplifyShaderEditor.ColorNode;9;-1518.016,-534.6673;Float;False;Property;_ColorDeep;Color (Deep);1;0;Create;True;0;0;False;0;0,0.1803922,0.1254902,0;0,0.160377,0.1115665,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
	Node;AmplifyShaderEditor.ColorNode;10;-1515.598,-348.8681;Float;False;Property;_ColorShallow;Color (Shallow);0;0;Create;True;0;0;False;0;0,0.2941177,0.2078431,0;0,0.3773581,0.2365346,1;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
	Node;AmplifyShaderEditor.GetLocalVarNode;26;-1907.334,-1117.889;Float;False;22;_worldUV;1;0;OBJECT;0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.GetLocalVarNode;43;-1828.743,183.4357;Float;False;41;_UV1;1;0;OBJECT;0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.GetLocalVarNode;15;-1807.353,-151.7233;Float;False;12;_normalMap;1;0;OBJECT;0;False;1;FLOAT3;0
	Node;AmplifyShaderEditor.RangedFloatNode;21;-1332.614,-1367.062;Float;False;Property;_UVScale;UV Scale;7;0;Create;True;0;0;False;0;1;10;0;0;0;1;FLOAT;0
	Node;AmplifyShaderEditor.RangedFloatNode;5;-1841.319,584.0704;Float;False;Property;_NormalMap1Strength;Normal Map 1 Strength;5;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
	Node;AmplifyShaderEditor.PannerNode;30;-1196.334,-967.8888;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.RangedFloatNode;46;-331.2917,-93.32761;Float;False;Property;_Glossiness;Glossiness;2;0;Create;True;0;0;False;0;0.75;0.79;0;1;0;1;FLOAT;0
	Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-895.501,-929.3951;Float;False;_UV2;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-1421.534,-1165.589;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.WireNode;48;-1677.718,-1174.945;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.RegisterLocalVarNode;12;-895.6389,310.3587;Float;False;_normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
	Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-892.5334,-411.2758;Float;False;_color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
	Node;AmplifyShaderEditor.SamplerNode;3;-1478.434,419.6586;Float;True;Property;_TextureSample1;Texture Sample 1;2;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
	Node;AmplifyShaderEditor.RangedFloatNode;33;-1637.535,-900.2913;Float;False;Property;_UV2Tiling;UV 2 Tiling;9;0;Create;True;0;0;False;0;0;0.5;0;0;0;1;FLOAT;0
	Node;AmplifyShaderEditor.RegisterLocalVarNode;41;-899.501,-1091.395;Float;False;_UV1;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.LerpOp;11;-1154.927,-419.7842;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
	Node;AmplifyShaderEditor.WireNode;52;-1490.849,-930.3856;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.WireNode;51;-1677.718,-954.2146;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.PannerNode;29;-1197.334,-1111.889;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.RangedFloatNode;7;-1474.458,650.2872;Float;False;Property;_NormalBlendStrength;Normal Blend Strength;4;0;Create;True;0;0;False;0;0;0.5;0;1;0;1;FLOAT;0
	Node;AmplifyShaderEditor.WireNode;40;-1459.85,-956.6362;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
	Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1418.934,-916.0895;Float;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.LerpOp;4;-1103.509,310.9968;Float;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
	Node;AmplifyShaderEditor.RangedFloatNode;6;-1841.319,672.0699;Float;False;Property;_NormalMap2Strength;Normal Map 2 Strength;6;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
	Node;AmplifyShaderEditor.RegisterLocalVarNode;22;-904.6137,-1509.062;Float;False;_worldUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
	Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;36,-260;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;MagicFire/Water;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
	WireConnection;19;0;18;1
	WireConnection;19;1;18;3
	WireConnection;49;0;48;0
	WireConnection;50;0;37;0
	WireConnection;14;0;15;0
	WireConnection;2;0;1;0
	WireConnection;2;1;43;0
	WireConnection;2;5;5;0
	WireConnection;39;0;28;1
	WireConnection;20;0;19;0
	WireConnection;20;1;21;0
	WireConnection;30;0;32;0
	WireConnection;30;2;50;0
	WireConnection;30;1;39;0
	WireConnection;42;0;30;0
	WireConnection;31;0;49;0
	WireConnection;31;1;34;0
	WireConnection;48;0;26;0
	WireConnection;12;0;4;0
	WireConnection;16;0;11;0
	WireConnection;3;0;1;0
	WireConnection;3;1;44;0
	WireConnection;3;5;6;0
	WireConnection;41;0;29;0
	WireConnection;11;0;9;0
	WireConnection;11;1;10;0
	WireConnection;11;2;14;0
	WireConnection;52;0;51;0
	WireConnection;51;0;26;0
	WireConnection;29;0;31;0
	WireConnection;29;2;38;0
	WireConnection;29;1;40;0
	WireConnection;40;0;28;1
	WireConnection;32;0;52;0
	WireConnection;32;1;33;0
	WireConnection;4;0;2;0
	WireConnection;4;1;3;0
	WireConnection;4;2;7;0
	WireConnection;22;0;20;0
	WireConnection;0;0;17;0
	WireConnection;0;1;13;0
	WireConnection;0;4;46;0
	ASEEND*/
	//CHKSM=A8479E980F2CC0AA438A50E60E601097E1F65379

