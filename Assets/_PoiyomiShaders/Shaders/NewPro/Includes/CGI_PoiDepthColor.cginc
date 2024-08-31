#ifndef POI_DEPTH_COLOR
    #define POI_DEPTH_COLOR
    
    float4 _DepthGlowColor;
    float _DepthGlowEmission;
    float _FadeLength;
    float _DepthAlphaMin;
    float _DepthAlphaMax;
    UNITY_DECLARE_TEX2D_NOSAMPLER(_DepthGradient);
    float4 _DepthGradient_ST;
    UNITY_DECLARE_TEX2D_NOSAMPLER(_DepthMask);
    float4 _DepthMask_ST;
    
    float3 applyDepthColor(inout float4 finalColor, inout float3 finalEmission, float4 screenPos, float4 clipPos)
    {
        float3 touchEmission = 0;
        if (!IsInMirror())
        {
            float fadeLength = _FadeLength;
            fadeLength *= 0.01;
            float depth = DecodeFloatRG(tex2Dproj(_CameraDepthTexture, screenPos));
            depth = Linear01Depth(depth);
            if(depth != 1)
            {
                float diff = distance(depth, Linear01Depth(clipPos.z));
                float intersect = 0;
                if(diff > 0)
                {
                    intersect = clamp(1 - smoothstep(0, _ProjectionParams.w * fadeLength, diff), 0, 1);
                }
                half4 depthGradient = UNITY_SAMPLE_TEX2D_SAMPLER(_DepthGradient, _MainTex, intersect);
                half3 depthMask = UNITY_SAMPLE_TEX2D_SAMPLER(_DepthMask, _MainTex, poiMesh.uv[0]);
                half3 depthColor = depthGradient.rgb * _DepthGlowColor.rgb;
                finalColor.rgb = lerp(finalColor.rgb, depthColor, intersect * depthMask);
                finalColor.a *= lerp(_DepthAlphaMax, _DepthAlphaMin, intersect);
                touchEmission = depthColor * _DepthGlowEmission * intersect * depthMask;
            }
        }
        return touchEmission;
    }
    
#endif