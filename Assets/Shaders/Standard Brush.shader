Shader "Brush/Standard"
{
    Properties
    {
        _MainTex("Brush Texture", 2D) = "white" {}
        _Cutoff("Alpha Cutoff", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="TransparentCutout" "Queue"="AlphaTest"}

        Cull off

        CGPROGRAM

        #pragma surface surf Standard alphatest:_Cutoff
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float4 color : COLOR;
            float vface : VFACE;
        };

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            half4 c = tex2D(_MainTex, IN.uv_MainTex) * IN.color;
            o.Albedo = c.rgb;
            o.Smoothness = 0;
            o.Metallic = 0;
            o.Alpha = c.a;
            o.Normal = float3(0, 0, IN.vface < 0 ? -1 : 1);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
