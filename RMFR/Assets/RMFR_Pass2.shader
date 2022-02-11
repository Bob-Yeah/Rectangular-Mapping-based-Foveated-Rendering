Shader "Custom/RMFR_Pass2"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_MidTex("Texture", 2D) = "white" {}
		_eyeX("_eyeX", float) = 0.5
		_eyeY("_eyeY", float) = 0.5
		_scaleRatio("_scaleRatio", float) = 2.0
		_fx("_fx", float) = 1.0
		_fy("_fy", float) = 1.0
		_iApplyLogMap2("_iApplyRFRMap2", int) = 1
	}
		SubShader
		{
			// No culling or depth
			Cull Off ZWrite Off ZTest Always

			Pass
			{
				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag

				#include "UnityCG.cginc"

				struct appdata
				{
					float4 vertex : POSITION;
					float2 uv : TEXCOORD0;
				};

				struct v2f
				{
					float2 uv : TEXCOORD0;
					float4 vertex : SV_POSITION;
				};

				v2f vert(appdata v)
				{
					v2f o;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.uv = v.uv;
					return o;
				}
				sampler2D _MainTex;
				sampler2D _MidTex;
				uniform float _eyeX;
				uniform float _eyeY;
				uniform float _scaleRatio;
				uniform float _kernel;
				uniform float _fx;
				uniform float _fy;
				uniform int _iApplyRFRMap2;

				fixed4 frag(v2f i) : SV_Target
				{
					if (_iApplyRFRMap2 < 0.5)
						return tex2D(_MidTex, i.uv);

				float2 cursorPos = float2(_eyeX, _eyeY); //0-1 -> -1,1 (0,0)
				float2 tc = (i.uv - cursorPos);

				float maxDxPos = 1.0 - cursorPos.x; // >= 0.5
				float maxDyPos = 1.0 - cursorPos.y;
				float maxDxNeg = cursorPos.x;
				float maxDyNeg = cursorPos.y;

				float norDxPos = _fx * maxDxPos / (_fx + maxDxPos);
				float norDyPos = _fy * maxDyPos / (_fy + maxDyPos);
				float norDxNeg = _fx * maxDxNeg / (_fx + maxDxNeg);
				float norDyNeg = _fy * maxDyNeg / (_fy + maxDyNeg);

				float x = 0.0;
				float y = 0.0;
				float2 pq = float2(0.0, 0.0);
				if (tc.x >= 0) {
					x = _fx * tc.x / (_fx + tc.x); //>0
					x = x / norDxPos;
					pq.x = x * maxDxPos + cursorPos.x;
				}
				else {
					x = _fx * tc.x / (_fx - tc.x); //<0
					x = x / norDxNeg;
					pq.x = x * maxDxNeg + cursorPos.x;
				}

				if (tc.y >= 0) {
					y = _fy * tc.y / (_fy + tc.y);
					y = y / norDyPos;
					pq.y = y * maxDyPos + cursorPos.y;
				}
				else {
					y = _fy * tc.y / (_fy - tc.y);
					y = y / norDyNeg;
					pq.y = y * maxDyNeg + cursorPos.y;
				}
				fixed4 col = tex2D(_MidTex, pq);
				return col;
			}
			ENDCG
		}
	}
}
