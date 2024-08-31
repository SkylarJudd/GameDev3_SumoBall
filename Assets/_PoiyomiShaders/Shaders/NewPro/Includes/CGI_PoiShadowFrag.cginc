#ifndef SHADOW_FRAG
    #define SHADOW_FRAG
    
    float2 _MainDistanceFade;
    float _ForceOpaque;
    float _MainShadowClipMod;
    float2 _AlphaMaskPan;
    float _AlphaMaskUV;
    float _AlphaMod;
    
    sampler3D _DitherMaskLOD;
    
    half4 fragShadowCaster(
        #if !defined(V2F_SHADOW_CASTER_NOPOS_IS_EMPTY) || defined(UNITY_STANDARD_USE_SHADOW_UVS)
            V2FShadow i
            #endif
        ): SV_Target
        {
            //Possible Bug with clip
            float clipValue = clamp(_Cutoff + _MainShadowClipMod, - .001, 1.001);
            float2 uv[4] = {
                i.uv, i.uv1, i.uv2, i.uv3,
            };
            
            #ifdef POI_MIRROR
                applyMirrorRenderFrag();
            #endif
            
            #if defined(UNITY_STANDARD_USE_SHADOW_UVS)
                
                half alpha = UNITY_SAMPLE_TEX2D(_MainTex, TRANSFORM_TEX(i.uv, _MainTex)).a;
                
                
                
                UNITY_BRANCH
                if (_EnableMirrorTexture)
                {
                    if(IsInMirror())
                    {
                        alpha = UNITY_SAMPLE_TEX2D_SAMPLER(_MirrorTexture, _MainTex, TRANSFORM_TEX(i.uv, _MirrorTexture)).a;
                    }
                }
                
                
                alpha *= smoothstep(_MainDistanceFade.x, _MainDistanceFade.y, distance(i.modelPos, _WorldSpaceCameraPos));
                half alphaMask = POI2D_PAN(_AlphaMask, uv[_AlphaMaskUV], _AlphaMaskPan);
                alpha *= alphaMask;
                alpha *= _Color.a;
                alpha += _AlphaMod;
                alpha = saturate(alpha);
                
                UNITY_BRANCH
                if(_Mode == 0)
                {
                    alpha = 1;
                }
                
                clip(alpha - 0.01);
                
                UNITY_BRANCH
                if(_Mode == 1)
                {
                    applyShadowDithering(alpha, calcScreenUVs(i.grabPos).xy);
                }
                
                #ifdef POI_DISSOLVE
                    alpha *= calculateShadowDissolveAlpha(i.worldPos, i.localPos, uv[0]);
                #endif
                
                #ifdef POI_RANDOM
                    alpha *= i.angleAlpha;
                #endif
                
                UNITY_BRANCH
                if(_Mode >= 1)
                {
                    applySpawnInShadow(uv[0], i.localPos);
                    
                    #if defined(POI_FLIPBOOK)
                        alpha *= applyFlipbookAlphaToShadow(uv[_FlipbookTexArrayUV]);
                    #endif
                }
                
                UNITY_BRANCH
                if(_Mode == 1)
                {
                    clip(alpha - clipValue);
                }
                
                UNITY_BRANCH
                if(_Mode > 1)
                {
                    float dither = tex3D(_DitherMaskLOD, float3(i.pos.xy * .25, alpha * 0.9375)).a;
                    clip(dither - 0.01);
                }
                
            #endif
            SHADOW_CASTER_FRAGMENT(i)
        }
        
    #endif