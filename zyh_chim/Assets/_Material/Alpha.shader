Shader "Custom/Alpha" {
		Properties{
			_BaseColor("BaseColor",color) = (1,1,1,1)
			_MainTex("Texture",2D) = "white"{}
		_ReflectionTex("ReflectionTex",2D) = ""{}
		_Bias("Bias",range(0,1)) = 0
			_Scale("Scale",range(0,1)) = 0
			_Pow("Pow",range(0,5)) = 1
		}
			SubShader{
			Tags{ "RenderType" = "Opaque" "Queue" = "transparent" }

			LOD 100
			grabpass{}
			Pass{
			CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"
#include "Lighting.cginc"


			float4 _BaseColor;
		sampler2D _MainTex;
		float4 _MainTex_ST;
		sampler2D _GrabTexture;
		sampler2D _ReflectionTex;
		float _Bias,_Scale,_Pow;


		struct v2f {
			float4 pos : SV_POSITION;
			float2 uv : TEXCOORD0;
			float4 proj:TEXCOORD1;
			float4 refl:TEXCOORD2;
			float3 L:TEXCOORD3;
			float3 V:TEXCOORD4;
		};



		v2f vert(appdata_tan v) {

			v2f o;

			o.pos = UnityObjectToClipPos(v.vertex);
			o.uv = TRANSFORM_TEX(v.texcoord.xy,_MainTex);
			o.proj = ComputeGrabScreenPos(o.pos);
			o.refl = ComputeScreenPos(o.pos);
			o.L = ObjSpaceLightDir(v.vertex);
			o.V = ObjSpaceViewDir(v.vertex);

			TANGENT_SPACE_ROTATION;
			o.L = mul(rotation,o.L);
			o.V = mul(rotation,o.V);

			return o;
		}

		float4 frag(v2f IN) :SV_Target{
			float4 col1 = tex2D(_MainTex,IN.uv + float2(_Time.x,0));
			float4 col2 = tex2D(_MainTex,float2(1 - IN.uv.y,IN.uv.x) + float2(_Time.x,0)); //水的波动
			float4 col = (col1 + col2) / 2;

			float3 N = normalize(UnpackNormal(col));  //法向量
			float off_xy = dot(N,float3(0,1,0));      //法向量和竖直方向向量的点积

			IN.proj.xy += off_xy*0.1;                //顶点加上偏移量
			float4 gcol = tex2Dproj(_GrabTexture,IN.proj);  //折射效果

			float diff = max(0,dot(N,normalize(IN.L)));  //法线与灯光的点积
			float3 H = normalize(normalize(IN.L) + normalize(IN.V));
			float spec = pow(max(0,dot(N,H)),128);   //高光效果

			float4 diffCol = diff*_BaseColor;
			diffCol.rgb += spec*_LightColor0.rgb;
			IN.refl.xy += off_xy*0.3;
			float4 reflcol = tex2Dproj(_ReflectionTex,IN.refl);
			float4 fresnel = _Bias + _Scale*pow(1 + dot(N,-normalize(IN.V)),_Pow);
			float4 finalColor = lerp(gcol,reflcol,fresnel);
			//fixed4 finalColor=lerp(fresnel,gcol,diffCol);
			return finalColor;


		}
			ENDCG
		}
		}
	}
