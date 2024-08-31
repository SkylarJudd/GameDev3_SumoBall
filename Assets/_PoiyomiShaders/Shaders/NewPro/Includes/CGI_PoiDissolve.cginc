// Upgrade NOTE: replaced 'defined POI_BLACKLIGHT' with 'defined (POI_BLACKLIGHT)'

#ifndef POI_DISSOLVE
    // Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
    #pragma exclude_renderers d3d11 gles
    #define POI_DISSOLVE
    
    float _DissolveType;
    float _DissolveEdgeWidth;
    float4 _DissolveEdgeColor;
    sampler2D _DissolveEdgeGradient; float4 _DissolveEdgeGradient_ST;
    float _DissolveEdgeEmission;
    float4 _DissolveTextureColor;
    
    #ifndef POI_SHADOW
        POI_TEXTURE_NOSAMPLER(_DissolveToTexture);
        POI_TEXTURE_NOSAMPLER(_DissolveNoiseTexture);
        POI_TEXTURE_NOSAMPLER(_DissolveDetailNoise);
        POI_TEXTURE_NOSAMPLER(_DissolveMask);
    #endif
    
    #ifdef POI_SHADOW
        POI_TEXTURE(_DissolveToTexture);
        POI_TEXTURE(_DissolveNoiseTexture);
        POI_TEXTURE(_DissolveDetailNoise);
        UNITY_DECLARE_TEX2D(_DissolveMask); float4 _DissolveMask_ST;
    #endif
    
    float _DissolveMaskInvert;
    float _DissolveAlpha;
    float _ContinuousDissolve;
    float _DissolveDetailStrength;
    float _DissolveEdgeHardness;
    float _DissolveInvertNoise;
    float _DissolveInvertDetailNoise;
    float _DissolveToEmissionStrength;
    
    // Point to Point
    float _DissolveP2PWorldLocal;
    float _DissolveP2PEdgeLength;
    float4 _DissolveStartPoint;
    float4 _DissolveEndPoint;
    
    // World Dissolve
    float _DissolveWorldShape;
    float4 _DissolveShapePosition;
    float4 _DissolveShapeRotation;
    float _DissolveShapeScale;
    float _DissolveInvertShape;
    float _DissolveShapeEdgeLength;
    
    // Masking
    float _DissolveEmissionSide;
    float _DissolveEmission1Side;
    
    float4 edgeColor;
    float edgeAlpha;
    float dissolveAlpha;
    float4 dissolveToTexture;
    //Globals
    
    #ifndef POI_SHADOW
        void calculateDissolve(inout float4 albedo)
        {
            float dissolveMask = POI2D_SAMPLER_PAN(_DissolveMask, _MainTex, poiMesh.uv[_DissolveMaskUV], _DissolveMaskPan).r;
            dissolveToTexture = POI2D_SAMPLER_PAN(_DissolveToTexture, _MainTex, poiMesh.uv[_DissolveToTextureUV], _DissolveToTexturePan) * _DissolveTextureColor;
            float dissolveNoiseTexture = POI2D_SAMPLER_PAN(_DissolveNoiseTexture, _MainTex, poiMesh.uv[_DissolveNoiseTextureUV], _DissolveNoiseTexturePan);
            
            float da = _DissolveAlpha;
            float dds = _DissolveDetailStrength;
            #ifdef POI_BLACKLIGHT
                if (_BlackLightMaskDissolve != 4)
                {
                    dissolveMask *= blackLightMask[_BlackLightMaskDissolve];
                }
            #endif
            
            if(_DissolveMaskInvert)
            {
                dissolveMask = 1 - dissolveMask;
            }
            
            float dissolveDetailNoise = POI2D_SAMPLER_PAN(_DissolveDetailNoise, _MainTex, poiMesh.uv[_DissolveDetailNoiseUV], _DissolveDetailNoisePan);
            
            if(_DissolveInvertNoise)
            {
                dissolveNoiseTexture = 1 - dissolveNoiseTexture;
            }
            if(_DissolveInvertDetailNoise)
            {
                dissolveDetailNoise = 1 - dissolveDetailNoise;
            }
            if(_ContinuousDissolve != 0)
            {
                da = sin(_Time.y * _ContinuousDissolve) * .5 + .5;
            }
            da *= dissolveMask;
            dissolveAlpha = da;
            edgeAlpha = 0;
            
            UNITY_BRANCH
            if(_DissolveType == 1) // Basic
            {
                da = remap(da, 0, 1, -_DissolveEdgeWidth, 1);
                dissolveAlpha = da;
                //Adjust detail strength to avoid artifacts
                dds *= smoothstep(1, .99, da);
                float noise = saturate(dissolveNoiseTexture - dissolveDetailNoise * dds);
                
                noise = saturate(noise + 0.001);
                //noise = remap(noise, 0, 1, _DissolveEdgeWidth, 1 - _DissolveEdgeWidth);
                dissolveAlpha = dissolveAlpha >= noise;
                edgeAlpha = remapClamped(noise, da + _DissolveEdgeWidth, da, 0, 1) * (1 - dissolveAlpha);
            }
            else if (_DissolveType == 2) // Point to Point
            {
                float3 direction;
                float3 currentPos;
                float distanceTo = 0;
                direction = normalize(_DissolveEndPoint - _DissolveStartPoint);
                currentPos = lerp(_DissolveStartPoint, _DissolveEndPoint, dissolveAlpha);
                if (_DissolveP2PWorldLocal == 0)
                {
                    distanceTo = dot(poiMesh.localPos - currentPos, direction) - dissolveDetailNoise * dds;
                    edgeAlpha = smoothstep(_DissolveP2PEdgeLength, 0, distanceTo);
                    dissolveAlpha = step(distanceTo, 0);
                    edgeAlpha *= 1 - dissolveAlpha;
                }
                else
                {
                    distanceTo = dot(poiMesh.worldPos - currentPos, direction) - dissolveDetailNoise * dds;
                    edgeAlpha = smoothstep(_DissolveP2PEdgeLength, 0, distanceTo);
                    dissolveAlpha = step(distanceTo, 0);
                    edgeAlpha *= 1 - dissolveAlpha;
                }
            }
            
            albedo = lerp(albedo, dissolveToTexture, dissolveAlpha);
            
            if(_DissolveEdgeWidth)
            {
                edgeColor = tex2D(_DissolveEdgeGradient, TRANSFORM_TEX(float2(edgeAlpha, edgeAlpha), _DissolveEdgeGradient)) * _DissolveEdgeColor;
                albedo.rgb = lerp(albedo.rgb, edgeColor.rgb, remapClamped(edgeAlpha, 0, 1 - _DissolveEdgeHardness, 0, 1));
            }
        }
        
        void applyDissolveEmission(inout float3 finalEmission)
        {
            finalEmission += lerp(0, dissolveToTexture * _DissolveToEmissionStrength, dissolveAlpha);
            finalEmission += lerp(0, edgeColor.rgb * _DissolveEdgeEmission, remapClamped(edgeAlpha, 0, 1 - _DissolveEdgeHardness, 0, 1));
        }
    #endif
    #ifdef POI_SHADOW
        float calculateShadowDissolveAlpha(float3 worldPos, float3 localPos, float2 uv)
        {
            
            float dissolveMask = POI_SAMPLE_TEX2D(_DissolveMask, TRANSFORM_TEX(uv, _DissolveMask));
            dissolveToTexture = POI_SAMPLE_TEX2D_PAN(_DissolveToTexture, uv, _DissolveToTexturePan) * _DissolveTextureColor;
            float dissolveNoiseTexture = POI_SAMPLE_TEX2D_PAN(_DissolveNoiseTexture, uv, _DissolveNoiseTexturePan);
            float dissolveDetailNoise = POI_SAMPLE_TEX2D_PAN(_DissolveDetailNoise, uv, _DissolveDetailNoisePan);
            
            float da = _DissolveAlpha;
            float dds = _DissolveDetailStrength;
            if(_DissolveInvertNoise)
            {
                dissolveNoiseTexture = 1 - dissolveNoiseTexture;
            }
            if(_DissolveInvertDetailNoise)
            {
                dissolveDetailNoise = 1 - dissolveDetailNoise;
            }
            if(_ContinuousDissolve != 0)
            {
                da = sin(_Time.y * _ContinuousDissolve) * .5 + .5;
            }
            da *= dissolveMask;
            dissolveAlpha = da;
            edgeAlpha = 0;
            
            UNITY_BRANCH
            if(_DissolveType == 1) // Basic
            {
                da = remap(da, 0, 1, -_DissolveEdgeWidth, 1);
                dissolveAlpha = da;
                //Adjust detail strength to avoid artifacts
                dds *= smoothstep(1, .99, da);
                float noise = saturate(dissolveNoiseTexture - dissolveDetailNoise * dds);
                
                noise = saturate(noise + 0.001);
                //noise = remap(noise, 0, 1, _DissolveEdgeWidth, 1 - _DissolveEdgeWidth);
                dissolveAlpha = dissolveAlpha >= noise;
                edgeAlpha = remapClamped(noise, da + _DissolveEdgeWidth, da, 0, 1) * (1 - dissolveAlpha);
            }
            else if (_DissolveType == 2) // Point to Point
            {
                float3 direction;
                float3 currentPos;
                float distanceTo = 0;
                direction = normalize(_DissolveEndPoint - _DissolveStartPoint);
                currentPos = lerp(_DissolveStartPoint, _DissolveEndPoint, dissolveAlpha);
                if (_DissolveP2PWorldLocal == 0)
                {
                    distanceTo = dot(localPos - currentPos, direction) - dissolveDetailNoise * dds;
                    dissolveAlpha = step(distanceTo, 0);
                }
                else
                {
                    distanceTo = dot(worldPos - currentPos, direction) - dissolveDetailNoise * dds;
                    dissolveAlpha = step(distanceTo, 0);
                }
            }
            
            return lerp(1, dissolveToTexture, dissolveAlpha).a;
        }
    #endif
    
#endif