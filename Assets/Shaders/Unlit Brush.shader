Shader "Brush/Unlit"
{
    Properties
    {
        _MainTex("Brush Texture", 2D) = "white" {}
        _Intensity("Intensity", Float) = 1
        _Cutoff("Alpha Cutoff", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="TransparentCutout" "Queue"="AlphaTest"}

        Cull off

        Pass
        {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float4 color : COLOR;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            half _Intensity;
            half _Cutoff;

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color = v.color;
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                half4 c = tex2D(_MainTex, i.uv) * i.color;
                clip(c.a - _Cutoff);
                c.rgb *= _Intensity;
                return c;
            }

            ENDCG
        }
    }
}
