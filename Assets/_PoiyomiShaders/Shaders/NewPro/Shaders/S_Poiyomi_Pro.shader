Shader ".poiyomi/★ Poiyomi Pro ★"
{
    Properties
    {
        [HideInInspector] shader_is_using_thry_editor ("", Float) = 0
        [HideInInspector] shader_master_label ("<color=#000000ff>Poiyomi Pro V7.0.10</color>", Float) = 0
        [HideInInspector] shader_presets ("poiToonPresets", Float) = 0
        [HideInInspector] shader_properties_label_file ("PoiLabels", Float) = 0
        
        [HideInInspector] footer_youtube ("youtube footer button", Float) = 0
        [HideInInspector] footer_twitter ("twitter footer button", Float) = 0
        [HideInInspector] footer_patreon ("patreon footer button", Float) = 0
        [HideInInspector] footer_discord ("discord footer button", Float) = 0
        [HideInInspector] footer_github ("github footer button", Float) = 0
        
        // Keyword to remind users in the VRChat SDK that this material hasn't been locked.  Inelegant but it works.
        [HideInInspector] _ForgotToLockMaterial (";;YOU_FORGOT_TO_LOCK_THIS_MATERIAL;", Int) = 1
        [ShaderOptimizerLockButton] _ShaderOptimizerEnabled ("", Int) = 0
        [HelpBox(3)] _LockTooltip ("ALWAYS LOCK YOUR MATERIALS BEFORE BUILDING VRCHAT AVATARS AND WORLDS", Int) = 0
        
        [PresetsEnum] _Mode ("Rendering Mode;Opaque,RenderQueue=2010,RenderType=,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=1,_DstBlend=0,_SrcBlendAlpha=1,_DstBlendAlpha=0,_AlphaToMask=0,_ZWrite=1,_ZTest=4,_AlphaPremultiply=0;Cutout,RenderQueue=2460,RenderType=TransparentCutout,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=1,_DstBlend=0,_SrcBlendAlpha=1,_DstBlendAlpha=0,_AlphaToMask=1,_ZWrite=1,_ZTest=4,_AlphaPremultiply=0;Fade,RenderQueue=3010,RenderType=Transparent,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=5,_DstBlend=10,_SrcBlendAlpha=5,_DstBlendAlpha=10,_AlphaToMask=0,_ZWrite=0,_ZTest=4,_AlphaPremultiply=0;Transparent,RenderQueue=3010,RenderType=Transparent,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=1,_DstBlend=10,_SrcBlendAlpha=1,_DstBlendAlpha=10,_AlphaToMask=0,_ZWrite=0,_ZTest=4,_AlphaPremultiply=1;Additive,RenderQueue=3010,RenderType=Transparent,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=1,_DstBlend=1,_SrcBlendAlpha=1,_DstBlendAlpha=1,_AlphaToMask=0,_ZWrite=0,_ZTest=4,_AlphaPremultiply=0;Soft Additive,RenderQueue=3010,RenderType=Transparent,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=4,_DstBlend=1,_SrcBlendAlpha=4,_DstBlendAlpha=1,_AlphaToMask=0,_ZWrite=0,_ZTest=4,_AlphaPremultiply=0;Multiplicative,RenderQueue=3010,RenderType=Transparent,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=2,_DstBlend=0,_SrcBlendAlpha=2,_DstBlendAlpha=0,_AlphaToMask=0,_ZWrite=0,_ZTest=4,_AlphaPremultiply=0;2x Multiplicative,RenderQueue=3010,RenderType=Transparent,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=2,_DstBlend=3,_SrcBlendAlpha=2,_DstBlendAlpha=3,_AlphaToMask=0,_ZWrite=0,_ZTest=4,_AlphaPremultiply=0;Transparent Grab Pass,RenderQueue=3010,RenderType=,_BlendOp=0,_BlendOpAlpha=0,_SrcBlend=1,_DstBlend=0,_SrcBlendAlpha=1,_DstBlendAlpha=0,_AlphaToMask=0,_ZWrite=1,_ZTest=4", Int) = 0
        
        // Main
        [HideInInspector] m_mainOptions ("Main", Float) = 0
        _Color ("Color & Alpha", Color) = (1, 1, 1, 1)
        _MainTex ("Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_MainTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MainTextureUV ("UV", Int) = 0
        _Saturation ("Saturation", Range(-1, 1)) = 0
        _MainVertexColoring ("Use Vertex Color", Range(0, 1)) = 0
        _MainEmissionStrength ("Basic Emission", Range(0, 20)) = 0
        [Normal]_BumpMap ("Normal Map", 2D) = "bump" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _BumpMapUV ("UV", Int) = 0
        [HideInInspector][Vector2]_BumpMapPan ("Panning", Vector) = (0, 0, 0, 0)
        _BumpScale ("Normal Intensity", Range(0, 10)) = 1
        _AlphaMask ("Alpha Map", 2D) = "white" { }
        [HideInInspector][Vector2]_AlphaMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _AlphaMaskUV ("UV", Int) = 0
        
        //Hue Shifting
        [HideInInspector] m_start_MainHueShift ("Hue Shift", Float) = 0
        [HideInInspector][ToggleUI]_MainHueShiftToggle ("Toggle Hueshift", Float) = 0
        [ToggleUI]_MainHueShiftReplace ("Replace?", Float) = 1
        _MainHueShift ("Hue Shift", Range(0, 1)) = 0
        _MainHueShiftSpeed ("Shift Speed", Float) = 0
        _MainHueShiftMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_MainHueShiftMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MainHueShiftMaskUV ("UV", Int) = 0
        [HideInInspector] m_end_MainHueShift ("Hue Shift", Float) = 0
        
        // RGB Masking
        [HideInInspector] m_start_RGBMask ("RGB Color Masking", Float) = 0
        [HideInInspector][Toggle(FXAA)]_RGBMaskEnabled ("RGB Mask Enabled", Float) = 0
        [ToggleUI]_RGBBlendMultiplicative ("Multiplicative?", Float) = 0
        _RGBMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBMaskPanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)]_RGBMaskUV ("UV", int) = 0
        _RedColor ("R Color", Color) = (1, 1, 1, 1)
        _RedTexure ("R Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBRedPanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)]_RGBRed_UV ("UV", int) = 0
        _GreenColor ("G Color", Color) = (1, 1, 1, 1)
        _GreenTexture ("G Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBGreenPanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)]_RGBGreen_UV ("UV", int) = 0
        _BlueColor ("B Color", Color) = (1, 1, 1, 1)
        _BlueTexture ("B Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBBluePanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)]_RGBBlue_UV ("UV", int) = 0
        [HideInInspector] m_end_RGBMask ("RGB Color Masking", Float) = 0
        
        // Detail Options
        [HideInInspector] m_start_DetailOptions ("Details", Float) = 0
        _DetailMask ("Detail Mask (R:Texture, G:Normal)", 2D) = "white" { }
        [HideInInspector][Vector2]_DetailMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DetailMaskUV ("UV", Int) = 0
        _DetailTint ("Detail Texture Tint", Color) = (1, 1, 1)
        _DetailTex ("Detail Texture", 2D) = "gray" { }
        [HideInInspector][Vector2]_DetailTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DetailTexUV ("UV", Int) = 0
        _DetailTexIntensity ("Detail Tex Intensity", Range(0, 10)) = 1
        _DetailBrightness ("Detail Brightness:", Range(0, 2)) = 1
        [Normal]_DetailNormalMap ("Detail Normal", 2D) = "bump" { }
        _DetailNormalMapScale ("Detail Normal Intensity", Range(0, 10)) = 1
        [HideInInspector][Vector2]_DetailNormalMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DetailNormalMapUV ("UV", Int) = 0
        [HideInInspector] m_end_DetailOptions ("Details", Float) = 0
        
        //Vertex Manipulations
        [HideInInspector] m_start_vertexManipulation ("Vertex Options", Float) = 0
        [Vector3]_VertexManipulationLocalTranslation ("Local Translation", Vector) = (0, 0, 0, 1)
        [Vector3]_VertexManipulationLocalRotation ("Local Rotation", Vector) = (0, 0, 0, 1)
        [Vector3]_VertexManipulationLocalScale ("Local Scale", Vector) = (1, 1, 1, 1)
        [Vector3]_VertexManipulationWorldTranslation ("World Translation", Vector) = (0, 0, 0, 1)
        _VertexManipulationHeight ("Vertex Height", Float) = 0
        _VertexManipulationHeightMask ("Height Map", 2D) = "while" { }
        [HideInInspector][Vector2]_VertexManipulationHeightPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _VertexManipulationHeightUV ("UV", Int) = 0
        _VertexManipulationHeightBias ("Mask Bias", Range(0, 1)) = 0
        [ToggleUI]_VertexRoundingEnabled ("Rounding Enabled", Float) = 0
        _VertexRoundingDivision ("Division Amount", Float) = 500
        [HideInInspector] m_end_vertexManipulation ("Vertex Options", Float) = 0
        
        // Alpha Options
        [HideInInspector] m_start_Alpha ("Alpha Options", Float) = 0
        _AlphaMod ("Alpha Mod", Range(-1, 1)) = 0.0
        _Cutoff ("Alpha Cuttoff", Range(0, 1.001)) = 0.5
        [ToggleUI]_DitheringEnabled ("Enable Dithering", Float) = 0
        _DitherGradient ("Dither Gradient", Range(0, 1)) = .1
        [ToggleUI]_ForceOpaque ("Force Opaque", Float) = 0
        _MainShadowClipMod ("Shadow Clip Mod", Range(-1, 1)) = 0
        [Enum(Off, 0, On, 1)] _AlphaToMask ("Alpha To Coverage", Float) = 0
        [ToggleUI]_MainAlphaToCoverage ("Sharpenned A2C--{condition_show:{type:PROPERTY_BOOL,data:_AlphaToMask==1}}", Float) = 0
        _MainMipScale ("Mip Level Alpha Scale--{condition_show:{type:PROPERTY_BOOL,data:_AlphaToMask==1}}", Range(0, 1)) = 0.25
        [ToggleUI]_AlphaPremultiply ("Alpha Premultiply", Float) = 0 
        [HideInInspector] m_end_Alpha ("Alpha Options", Float) = 0
        
        // Decal Texture
        [HideInInspector] m_start_DecalSection ("Decal", Float) = 0
        [HideInInspector][Toggle(GEOM_TYPE_BRANCH)]_DecalEnabled ("Enable", Float) = 0
        _DecalColor ("Color", Color) = (1, 1, 1, 1)
        _DecalEmissionStrength ("Emission Strength", Range(0,20)) = 0
        _DecalTexture ("Decal", 2D) = "white" { }
        [HideInInspector][Vector2]_DecalTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DecalTextureUV ("UV", Int) = 0
        _DecalMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_DecalMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DecalMaskUV ("UV", Int) = 0
        [ToggleUI]_DecalTiled ("Tiled?", Float) = 0
        [Vector2]_DecalScale ("Scale", Vector) = (1, 1, 0, 0)
        [Vector2]_DecalPosition ("Position", Vector) = (.5, .5, 0, 0)
        _DecalRotation ("Rotation", Range(0, 360)) = 0
        _DecalRotationSpeed ("Rotation Speed", Float) = 0
        _DecalBlendAdd ("Add", Range(0, 1)) = 0
        _DecalBlendMultiply ("Multiply", Range(0, 1)) = 0
        _DecalBlendReplace ("Replace", Range(0, 1)) = 0
        [HideInInspector] m_end_DecalSection ("Decal", Float) = 0
        
        // Back Face Textures and Emission
        [HideInInspector] m_start_backFace ("Back Face", Float) = 0
        [ToggleUI]_BackFaceEnabled ("Enable Back Face Options", Float) = 0
        _BackFaceTexture ("Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_BackFacePanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)]_BackFaceTextureUV ("UV#", Int) = 0
        _BackFaceDetailIntensity ("Detail Intensity", Range(0, 5)) = 1
        _BackFaceHueShift ("Hue Shift", Range(0, 1)) = 0
        _BackFaceEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [HideInInspector] m_end_backFace ("Back Face", Float) = 0
        
        // Lighting
        [HideInInspector] m_lightingOptions ("Lighting", Float) = 0
        [HideInInspector] m_start_Lighting ("Light and Shadow", Float) = 0
        [Toggle(LOD_FADE_CROSSFADE)]_EnableLighting ("Enable Lighting", Float) = 1
        [Enum(Natural, 0, Controlled, 1, Standardish, 2, Math, 3)] _LightingType ("Lighting Type", Int) = 0
        [ToggleUI]_LightingMonochromatic ("Monochromatic?", Float) = 0
        _LightingGradientStart ("Gradient Start--{condition_show:{type:PROPERTY_BOOL,data:_LightingType==3}}", Range(0, 1)) = 0
        _LightingGradientEnd ("Gradient End--{condition_show:{type:PROPERTY_BOOL,data:_LightingType==3}}", Range(0, 1)) = .5
        _LightingStartColor ("Light Tint--{condition_show:{type:PROPERTY_BOOL,data:_LightingType==3}}", Color) = (1, 1, 1)
        _LightingEndColor ("Shadow Tint--{condition_show:{type:PROPERTY_BOOL,data:_LightingType==3}}", Color) = (1, 1, 1)
        [Gradient]_ToonRamp ("Lighting Ramp--{texture:{width:512,height:4,filterMode:Bilinear,wrapMode:Clamp},force_texture_options:true,condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingType==0},condition2:{type:PROPERTY_BOOL,data:_LightingType==1}}}", 2D) = "white" { }
        _LightingShadowMask ("Shadow Mask (RGBA)--{reference_properties:[_LightingShadowMaskPan, _LightingShadowMaskUV],condition_show:{type:PROPERTY_BOOL,data:_LightingType!=2}}", 2D) = "white" { }
        [HideInInspector][Vector2]_LightingShadowMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _LightingShadowMaskUV ("UV", Int) = 0
        _ShadowStrength ("Shadow Strength--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingType==0},condition2:{type:PROPERTY_BOOL,data:_LightingType==1}}}", Range(0, 1)) = 1
        _ShadowOffset ("Shadow Offset--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingType==0},condition2:{type:PROPERTY_BOOL,data:_LightingType==1}}}", Range(-1, 1)) = 0
        _LightingAOTex ("AO Map", 2D) = "white" { }
        [HideInInspector][Vector2]_LightingAOTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _LightingAOTexUV ("UV", Int) = 0
        _AOStrength ("AO Strength", Range(0, 1)) = 0
        _LightingMinLightBrightness ("Min Brightness--{condition_show:{type:PROPERTY_BOOL,data:_LightingType!=2}}", Range(0, 1)) = 0
        _LightingIndirectContribution ("Indirect Contribution--{condition_show:{type:PROPERTY_BOOL,data:_LightingType!=2}}", Range(0, 1)) = .2
        _AttenuationMultiplier ("Recieve Casted Shadows?", Range(0, 1)) = 0
        _LightingDetailShadows ("Detail Shadows--{reference_properties:[_LightingDetailShadowsPan, _LightingDetailShadowsUV],condition_show:{type:PROPERTY_BOOL,data:_LightingType!=2}}", 2D) = "white" { }
        [HideInInspector][Vector2]_LightingDetailShadowsPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _LightingDetailShadowsUV ("UV", Int) = 0
        _LightingDetailStrength ("Detail Strength--{condition_show:{type:PROPERTY_BOOL,data:_LightingType!=2}}", Range(0, 1)) = 1
        _LightingStandardSmoothness ("Smoothness--{condition_show:{type:PROPERTY_BOOL,data:_LightingType==2}}", Range(0, 1)) = 0
        
        // Lighting Beta Options
        [HideInInspector] m_start_lightingBeta ("Extra Ramps--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingType==0},condition2:{type:PROPERTY_BOOL,data:_LightingType==1}}}", Float) = 0
        _LightingNoIndirectThreshold ("Absent Indirect Threshold", Range(0, 1)) = 0.01
        _LightingNoIndirectMultiplier ("Absent Indirect Multiplier", Range(0, 1)) = 0.5
        [ToggleUI]_LightingStandardControlsToon ("Standard Lighting Controls Toon Ramp", Float) = 0
        [IntRange]_LightingNumRamps ("Num Ramps", Range(1, 3)) = 1
        [Gradient]_ToonRamp1 ("Lighting Ramp 2", 2D) = "white" { }
        _LightingShadowStrength1 ("Shadow Strength 2", Range(0, 1)) = 1
        _ShadowOffset1 ("Shadow Offset 2", Range(-1, 1)) = 0
        [Gradient]_ToonRamp2 ("Lighting Ramp 3", 2D) = "white" { }
        _LightingShadowStrength2 ("Shadow Strength 3", Range(0, 1)) = 1
        _ShadowOffset2 ("Shadow Offset 3", Range(-1, 1)) = 0
        [HideInInspector] m_end_lightingBeta ("Extra Ramps", Float) = 0
        
        // point/spot Light Settings
        [HideInInspector] m_start_lightingAdvanced ("Additive Lighting", Float) = 0
        [Enum(Standard, 0, Controlled, 1)] _LightingAdditiveType ("Lighting Type", Int) = 1
        _LightingAdditiveGradientStart ("Gradient Start", Range(0, 1)) = 0
        _LightingAdditiveGradientEnd ("Gradient End", Range(0, 1)) = .5
        _LightingAdditivePassthrough ("Point Light Passthrough", Range(0, 1)) = .5
        _LightingAdditiveDetailStrength ("Detail Shadow Strength", Range(0, 1)) = 1
        [HideInInspector] m_end_lightingAdvanced ("Additive Lighting", Float) = 0
        [HideInInspector] m_end_Lighting ("Light and Shadow", Float) = 0
        
        // Subsurface Scattering
        [HideInInspector] m_start_subsurface ("Subsurface Scattering", Float) = 0
        [Toggle(_TERRAIN_NORMAL_MAP)]_EnableSSS ("Enable Subsurface Scattering", Float) = 0
        _SSSColor ("Subsurface Color", Color) = (1, 0, 0, 1)
        _SSSThicknessMap ("Thickness Map", 2D) = "black" { }
        [HideInInspector][Vector2]_SSSThicknessMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SSSThicknessMapUV ("UV", Int) = 0
        _SSSThicknessMod ("Thickness mod", Range(-1, 1)) = 0
        _SSSSCale ("Light Strength", Range(0, 1)) = 0.25
        _SSSPower ("Light Spread", Range(1, 100)) = 5
        _SSSDistortion ("Light Distortion", Range(0, 1)) = 1
        [HideInInspector] m_end_subsurface ("Subsurface Scattering", Float) = 0
        
        // Rim Lighting
        [HideInInspector] m_start_rimLightOptions ("Rim Lighting", Float) = 0
        [Toggle(_GLOSSYREFLECTIONS_OFF)]_EnableRimLighting ("Enable Rim Lighting", Float) = 0
        [Enum(vertex, 0, pixel, 1)] _RimLightNormal ("Normal Select", Int) = 1
        [ToggleUI]_RimLightingInvert ("Invert Rim Lighting", Float) = 0
        _RimLightColor ("Rim Color", Color) = (1, 1, 1, 1)
        _RimWidth ("Rim Width", Range(0, 1)) = 0.8
        _RimSharpness ("Rim Sharpness", Range(0, 1)) = .25
        _RimStrength ("Rim Emission", Range(0, 20)) = 0
        _RimBrighten ("Rim Color Brighten", Range(0, 3)) = 0
        _RimLightColorBias ("Rim Color Bias", Range(0, 1)) = 0
        _RimTex ("Rim Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RimTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _RimTexUV ("UV", Int) = 0
        _RimMask ("Rim Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_RimMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _RimMaskUV ("UV", Int) = 0
        
        // Rim Noise
        [HideInInspector] m_start_rimWidthNoise ("Width Noise", Float) = 0
        _RimWidthNoiseTexture ("Rim Width Noise", 2D) = "black" { }
        [HideInInspector][Vector2]_RimWidthNoiseTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _RimWidthNoiseTextureUV ("UV", Int) = 0
        _RimWidthNoiseStrength ("Intensity", Range(0, 1)) = 0.1
        [HideInInspector] m_end_rimWidthNoise ("Width Noise", Float) = 0
        
        // Rim Shadow Mix
        [HideInInspector] m_start_ShadowMix ("Shadow Mix", Float) = 0
        _ShadowMix ("Shadow Mix In", Range(0, 1)) = 0
        _ShadowMixThreshold ("Shadow Mix Threshold", Range(0, 1)) = .5
        _ShadowMixWidthMod ("Shadow Mix Width Mod", Range(0, 10)) = .5
        [HideInInspector] m_end_ShadowMix ("Shadow Mix", Float) = 0
        [HideInInspector] m_end_rimLightOptions ("Rim Lighting", Float) = 0
        
        // Environmental Rim Lighting
        [HideInInspector] m_start_reflectionRim ("Environmental Rim", Float) = 0
        [Toggle(_MAPPING_6_FRAMES_LAYOUT)]_EnableEnvironmentalRim ("Enable Environmental Rim", Float) = 0
        _RimEnviroMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_RimEnviroMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _RimEnviroMaskUV ("UV", Int) = 0
        _RimEnviroBlur ("Blur", Range(0, 1)) = 0.7
        _RimEnviroWidth ("Rim Width", Range(0, 1)) = 0.45
        _RimEnviroSharpness ("Rim Sharpness", Range(0, 1)) = 0
        _RimEnviroMinBrightness ("Min Brightness Threshold", Range(0, 2)) = 0
        _RimEnviroIntensity ("Intensity", Range(0, 1)) = 1
        [HideInInspector] m_end_reflectionRim ("Environmental Rim", Float) = 0
        
        // Baked Lighting
        [HideInInspector] m_start_bakedLighting ("Baked Lighting", Float) = 0
        _GIEmissionMultiplier ("GI Emission Multiplier", Float) = 1
        [HideInInspector] DSGI ("DSGI", Float) = 0 //add this property for double sided illumination settings to be shown
        [HideInInspector] LightmapFlags ("Lightmap Flags", Float) = 0 //add this property for lightmap flags settings to be shown
        [HideInInspector] m_end_bakedLighting ("Baked Lighting", Float) = 0
        
        // Metallics
        [HideInInspector] m_start_Metallic ("Metallics", Float) = 0
        [Toggle(_METALLICGLOSSMAP)]_EnableMetallic ("Enable Metallics", Float) = 0
        _CubeMap ("Baked CubeMap", Cube) = "" { }
        [ToggleUI]_SampleWorld ("Force Baked Cubemap", Range(0, 1)) = 0
        _MetalReflectionTint ("Reflection Tint", Color) = (1, 1, 1)
        _MetallicTintMap ("Tint Map", 2D) = "white" { }
        [HideInInspector][Vector2]_MetallicTintMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MetallicTintMapUV ("UV", Int) = 0
        _MetallicMask ("Metallic Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_MetallicMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MetallicMaskUV ("UV", Int) = 0
        _Metallic ("Metallic", Range(0, 1)) = 0
        _SmoothnessMask ("Smoothness Map", 2D) = "white" { }
        [HideInInspector][Vector2]_SmoothnessMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SmoothnessMaskUV ("UV", Int) = 0
        [ToggleUI]_InvertSmoothness ("Invert Smoothness Map", Range(0, 1)) = 0
        _Smoothness ("Smoothness", Range(0, 1)) = 0
        [HideInInspector] m_end_Metallic ("Metallics", Float) = 0
        
        // Clearcoat
        [HideInInspector] m_start_clearCoat ("Clear Coat", Float) = 0
        [Toggle(_COLORCOLOR_ON)]_EnableClearCoat ("Enable Clear Coat", Float) = 0
        [Enum(Vertex, 0, Pixel, 1)] _ClearCoatNormalToUse ("What Normal?", Int) = 0
        _ClearCoatCubeMap ("Baked CubeMap", Cube) = "" { }
        [ToggleUI]_ClearCoatSampleWorld ("Force Baked Cubemap", Range(0, 1)) = 0
        _ClearCoatTint ("Reflection Tint", Color) = (1, 1, 1)
        _ClearCoatMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_ClearCoatMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _ClearCoatMaskUV ("UV", Int) = 0
        _ClearCoat ("Clear Coat", Range(0, 1)) = 1
        _ClearCoatSmoothnessMap ("Smoothness Map", 2D) = "white" { }
        [HideInInspector][Vector2]_ClearCoatSmoothnessMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _ClearCoatSmoothnessMapUV ("UV", Int) = 0
        [ToggleUI]_ClearCoatInvertSmoothness ("Invert Smoothness Map", Range(0, 1)) = 0
        _ClearCoatSmoothness ("Smoothness", Range(0, 1)) = 0
        [ToggleUI]_ClearCoatForceLighting ("Force Lighting", Float) = 0
        [HideInInspector] m_end_clearCoat ("Clear Coat", Float) = 0
        
        // First Matcap
        [HideInInspector] m_start_matcap ("Matcap / Sphere Textures", Float) = 0
        [Toggle(_COLORADDSUBDIFF_ON)]_MatcapEnable ("Enable Matcap", Float) = 0
        _MatcapColor ("Color", Color) = (1, 1, 1, 1)
        [TextureNoSO]_Matcap ("Matcap", 2D) = "white" { }
        _MatcapBorder ("Border", Range(0, .5)) = 0.43
        _MatcapMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_MatcapMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MatcapMaskUV ("UV", Int) = 0
        _MatcapEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        _MatcapIntensity ("Intensity", Range(0, 5)) = 1
        _MatcapLightMask ("Hide in Shadow", Range(0, 1)) = 0
        _MatcapReplace ("Replace With Matcap", Range(0, 1)) = 1
        _MatcapMultiply ("Multiply Matcap", Range(0, 1)) = 0
        _MatcapAdd ("Add Matcap", Range(0, 1)) = 0
        [Enum(Vertex, 0, Pixel, 1)] _MatcapNormal ("Normal to use", Int) = 1
        [HideInInspector] m_end_matcap ("Matcap", Float) = 0
        
        // Second Matcap
        [HideInInspector] m_start_Matcap2 ("Matcap 2", Float) = 0
        [ToggleUI]_Matcap2Enable ("Enable Matcap 2", Float) = 0
        _Matcap2Color ("Color", Color) = (1, 1, 1, 1)
        [TextureNoSO]_Matcap2 ("Matcap", 2D) = "white" { }
        _Matcap2Border ("Border", Range(0, .5)) = 0.43
        _Matcap2Mask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_Matcap2MaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _Matcap2MaskUV ("UV", Int) = 0
        _Matcap2EmissionStrength ("Emission Strength", Range(0, 20)) = 0
        _Matcap2Intensity ("Intensity", Range(0, 5)) = 1
        _Matcap2LightMask ("Hide in Shadow", Range(0, 1)) = 0
        _Matcap2Replace ("Replace With Matcap", Range(0, 1)) = 0
        _Matcap2Multiply ("Multiply Matcap", Range(0, 1)) = 0
        _Matcap2Add ("Add Matcap", Range(0, 1)) = 0
        [Enum(Vertex, 0, Pixel, 1)] _Matcap2Normal ("Normal to use", Int) = 1
        [HideInInspector] m_end_Matcap2 ("Matcap 2", Float) = 0
        
        // Specular
        [HideInInspector] m_start_specular ("Specular Reflections", Float) = 0
        [Toggle(_SPECGLOSSMAP)]_EnableSpecular ("Enable Specular", Float) = 0
        [Enum(Realistic, 1, Toon, 2, Anisotropic, 3, Toon Aniso, 4)] _SpecularType ("Specular Type", Int) = 1
        [Enum(vertex, 0, pixel, 1)] _SpecularNormal ("Normal Select", Int) = 1
        _SpecularAttenuation ("Attenuation Strength", Range(0, 1)) = 1
        _SpecularTint ("Specular Tint", Color) = (1, 1, 1, 1)
        _SpecularMetallic ("Metallic", Range(0, 1)) = 0
        _SpecularSmoothness ("Smoothness--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==1},condition2:{type:PROPERTY_BOOL,data:_SpecularType==3}}}", Range(0, 1)) = 1
        [Gradient]_SpecularMap ("Specular Map", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularMapUV ("UV", Int) = 0
        [ToggleUI]_SpecularInvertSmoothness ("Invert Smoothness", Float) = 0
        _SpecularMask ("Specular Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularMaskUV ("UV", Int) = 0
        [Enum(Alpha, 0, Grayscale, 1)] _SmoothnessFrom ("Smoothness From", Int) = 1
        // Anisotropic Specular
        [Enum(Tangent, 0, binormal, 1)] _SpecWhatTangent ("(Bi)Tangent?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Int) = 0
        _AnisoSpec1Alpha ("Spec1 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(0, 1)) = 1
        _AnisoSpec2Alpha ("Spec2 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(0, 1)) = 1
        _Spec1Offset ("Spec1 Offset--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(-1, 1)) = 0
        _Spec2Smoothness ("Spec2 Smoothness--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(0, 1)) = 0
        [ToggleUI]_AnisoUseTangentMap ("Use Directional Map?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Float) = 0
        _AnisoTangentMap ("Anisotropic Directional Map--{reference_properties:[_AnisoTangentMapPan, _AnisoTangentMapUV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_AnisoTangentMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _AnisoTangentMapUV ("UV", Int) = 0
        //toon aniso
        _SpecularToonStart ("Spec Toon Start--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==4}}", Range(0, 1)) = .95
        _SpecularToonEnd ("Spec Toon End--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==4}}", Range(0, 2)) = 1
        //[ToggleUI]_CenterOutSpecColor ("Center Out SpecMap--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==4}}", Float) = 0
        [ToggleUI]_SpecularAnisoJitterMirrored ("Mirrored?--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==4}}", Float) = 0
        [Curve]_SpecularAnisoJitterMicro ("Micro Shift--{reference_properties:[_SpecularAnisoJitterMicroPan, _SpecularAnisoJitterMicroUV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMicroMultiplier ("Micro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMicroPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularAnisoJitterMicroUV ("UV", Int) = 0
        [Curve]_SpecularAnisoJitterMacro ("Macro Shift--{reference_properties:[_SpecularAnisoJitterMacroPan, _SpecularAnisoJitterMacroUV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMacroMultiplier ("Macro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMacroPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularAnisoJitterMacroUV ("UV", Int) = 0
        // Toon Specular
        [MultiSlider]_SpecularToonInnerOuter ("Inner/Outer Edge--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==2}}", Vector) = (0.25, 0.3, 0, 1)
        [HideInInspector] m_end_specular ("Specular Reflections", Float) = 0
        
        // Second Specular
        [HideInInspector] m_start_specular1 ("Specular Reflections 2", Float) = 0
        [ToggleUI]_EnableSpecular1 ("Enable Specular", Float) = 0
        [Enum(Realistic, 1, Toon, 2, Anisotropic, 3, Toon Aniso, 4)] _SpecularType1 ("Specular Type", Int) = 1
        [Enum(vertex, 0, pixel, 1)] _SpecularNormal1 ("Normal Select", Int) = 1
        _SpecularAttenuation1 ("Attenuation Strength", Range(0, 1)) = 1
        _SpecularTint1 ("Specular Tint", Color) = (1, 1, 1, 1)
        _SpecularMetallic1 ("Metallic", Range(0, 1)) = 0
        _SpecularSmoothness1 ("Smoothness--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==1},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==3}}}", Range(-2, 1)) = .75
        _SpecularMap1 ("Specular Map", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularMap1UV ("UV", Int) = 0
        [ToggleUI]_SpecularInvertSmoothness1 ("Invert Smoothness", Float) = 0
        _SpecularMask1 ("Specular Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMask1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularMask1UV ("UV", Int) = 0
        [Enum(Alpha, 0, Grayscale, 1)] _SmoothnessFrom1 ("Smoothness From", Int) = 1
        // Second Anisotropic Specular
        [Enum(Tangent, 0, binormal, 1)] _SpecWhatTangent1 ("(Bi)Tangent?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Int) = 0
        _AnisoSpec1Alpha1 ("Spec1 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(0, 1)) = 1
        _AnisoSpec2Alpha1 ("Spec2 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(0, 1)) = 1
        _Spec1Offset1 ("Spec1 Offset--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(-1, 1)) = 0
        _Spec2Smoothness1 ("Spec2 Smoothness--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(0, 1)) = 0
        [ToggleUI]_AnisoUseTangentMap1 ("Use Directional Map?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Float) = 0
        _AnisoTangentMap1 ("Anisotropic Directional Map--{reference_properties:[_AnisoTangentMap1Pan, _AnisoTangentMap1UV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_AnisoTangentMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _AnisoTangentMap1UV ("UV", Int) = 0
        // Second toon aniso
        _SpecularToonStart1 ("Spec Toon Start--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==4}}", Range(0, 1)) = .95
        _SpecularToonEnd1 ("Spec Toon End--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==4}}", Range(0, 2)) = 1
        //[ToggleUI]_CenterOutSpecColor1 ("Center Out SpecMap--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==4}}", Float) = 0
        [ToggleUI]_SpecularAnisoJitterMirrored1 ("Mirrored?--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==4}}", Float) = 0
        [Curve]_SpecularAnisoJitterMicro1 ("Micro Shift--{reference_properties:[_SpecularAnisoJitterMicro1Pan, _SpecularAnisoJitterMicro1UV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMicroMultiplier1 ("Micro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMicro1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularAnisoJitterMicro1UV ("UV", Int) = 0
        [Curve]_SpecularAnisoJitterMacro1 ("Macro Shift--{reference_properties:[_SpecularAnisoJitterMacro1Pan, _SpecularAnisoJitterMacro1UV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMacroMultiplier1 ("Macro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMacro1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _SpecularAnisoJitterMacro1UV ("UV", Int) = 0
        // Second Toon Specular
        [MultiSlider]_SpecularToonInnerOuter1 ("Inner/Outer Edge--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==2}}", Vector) = (0.25, 0.3, 0, 1)
        [HideInInspector] m_end_specular1 ("Specular Reflections", Float) = 0
        
        // Outline Options
        [HideInInspector] m_outlineOptions ("Outlines", Float) = 0
        [ToggleUI]_commentIfZero_EnableOutlinePass ("Enable Outlines", float) = 0
        [Enum(Basic, 0, Tint, 1, Rim Light, 2, Directional, 3, DropShadow, 4)]_OutlineMode ("Mode", Int) = 0
        [ToggleUI]_OutlineFixedSize ("Fixed Size?", Float) = 0
        [ToggleUI]_OutlineUseVertexColors ("V Color as Normal", Float) = 0
        [ToggleUI]_OutlineLit ("Enable Lighting", Float) = 1
        _LineWidth ("Width", Float) = 0
        _LineColor ("Color", Color) = (1, 1, 1, 1)
        _OutlineTintMix ("Tint Mix", Range(0, 1)) = 0
        _OutlineEmission ("Outline Emission", Float) = 0
        _OutlineTexture ("Outline Texture", 2D) = "white" { }
        _OutlineMask ("Outline Mask", 2D) = "white" { }
        _OutlineTexturePan ("Outline Texture Pan", Vector) = (0, 0, 0, 0)
        _OutlineShadowStrength ("Shadow Strength", Range(0, 1)) = 1
        _OutlineRimLightBlend ("Rim Light Blend", Range(0, 1)) = 0
        _OutlinePersonaDirection ("directional Offset XY", Vector) = (1, 0, 0, 0)
        _OutlineDropShadowOffset ("Drop Direction XY", Vector) = (1, 0, 0, 0)
        [HideInInspector] m_start_outlineAdvanced ("Advanced", Float) = 0
        [Vector2]_OutlineFadeDistance ("Outline distance Fade", Vector) = (0, 0, 0, 0)
        [Enum(UnityEngine.Rendering.CullMode)] _OutlineCull ("Cull", Float) = 1
        [HideInInspector] m_end_outlineAdvanced ("Advanced", Float) = 0
        
        // First Emission
        [HideInInspector] m_Special_Effects ("Special Effects", Float) = 0
        [HideInInspector] m_start_emissionOptions ("Emission / Glow", Float) = 0
        [Toggle(_EMISSION)]_EnableEmission ("Enable Emission", Float) = 0
        [ToggleUI]_EmissionReplace ("Replace Base Color", Float) = 0
        [HDR]_EmissionColor ("Emission Color", Color) = (1, 1, 1, 1)
        [Gradient]_EmissionMap ("Emission Map", 2D) = "white" { }
        [ToggleUI]_EmissionBaseColorAsMap ("Base Color as Map?", Float) = 0
        [HideInInspector][Vector2]_EmissionMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _EmissionMapUV ("UV", Int) = 0
        _EmissionMask ("Emission Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_EmissionMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _EmissionMaskUV ("UV", Int) = 0
        _EmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [ToggleUI]_EmissionHueShiftEnabled ("Enable Hue Shift", Float) = 0
        _EmissionHueShift ("Hue Shift", Range(0, 1)) = 0
        
        // Center out emission
        [HideInInspector] m_start_CenterOutEmission ("Center Out Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionCenterOutEnabled ("Enable Center Out", Float) = 0
        _EmissionCenterOutSpeed ("Flow Speed", Float) = 5
        [HideInInspector] m_end_CenterOutEmission ("inward out emission", Float) = 0
        
        // Glow in the dark Emission
        [HideInInspector] m_start_glowInDarkEmissionOptions ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        [HideInInspector][ToggleUI]_EnableGITDEmission ("Enable Glow In The Dark", Float) = 0
        [Enum(World, 0, Mesh, 1)] _GITDEWorldOrMesh ("Lighting Type", Int) = 0
        _GITDEMinEmissionMultiplier ("Min Emission Multiplier", Range(0, 1)) = 1
        _GITDEMaxEmissionMultiplier ("Max Emission Multiplier", Range(0, 1)) = 0
        _GITDEMinLight ("Min Lighting", Range(0, 1)) = 0
        _GITDEMaxLight ("Max Lighting", Range(0, 1)) = 1
        [HideInInspector] m_end_glowInDarkEmissionOptions ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        
        // Blinking Emission
        [HideInInspector] m_start_blinkingEmissionOptions ("Blinking Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionBlinkingEnabled ("Enable Blinking", Float) = 0
        _EmissiveBlink_Min ("Emissive Blink Min", Float) = 0
        _EmissiveBlink_Max ("Emissive Blink Max", Float) = 1
        _EmissiveBlink_Velocity ("Emissive Blink Velocity", Float) = 4
        _EmissionBlinkingOffset ("Offset", Float) = 0
        [HideInInspector] m_end_blinkingEmissionOptions ("Blinking Emission", Float) = 0
        
        // Scrolling Emission
        [HideInInspector] m_start_scrollingEmissionOptions ("Scrolling Emission", Float) = 0
        [HideInInspector][ToggleUI] _ScrollingEmission ("Enable Scrolling Emission", Float) = 0
        [ToggleUI]_EmissionScrollingUseCurve ("Use Curve", float) = 0
        [Curve]_EmissionScrollingCurve ("Curve", 2D) = "white" { }
        _EmissiveScroll_Direction ("Direction", Vector) = (0, -10, 0, 0)
        _EmissiveScroll_Width ("Width", Float) = 10
        _EmissiveScroll_Velocity ("Velocity", Float) = 10
        _EmissiveScroll_Interval ("Interval", Float) = 20
        _EmissionScrollingOffset ("Offset", Float) = 0
        [HideInInspector] m_end_scrollingEmissionOptions ("Scrolling Emission", Float) = 0
        [HideInInspector] m_end_emissionOptions ("Emission / Glow", Float) = 0
        
        // Second Enission
        [HideInInspector] m_start_emission1Options ("Emission / Glow 2 (Requires Emission 1 Enabled)", Float) = 0
        [ToggleUI]_EnableEmission1 ("Enable Emission 2", Float) = 0
        [HDR]_EmissionColor1 ("Emission Color", Color) = (1, 1, 1, 1)
        [Gradient]_EmissionMap1 ("Emission Map", 2D) = "white" { }
        [ToggleUI]_EmissionBaseColorAsMap1 ("Base Color as Map?", Float) = 0
        [HideInInspector][Vector2]_EmissionMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _EmissionMap1UV ("UV", Int) = 0
        _EmissionMask1 ("Emission Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_EmissionMask1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _EmissionMask1UV ("UV", Int) = 0
        _EmissionStrength1 ("Emission Strength", Range(0, 20)) = 0
        [ToggleUI]_EmissionHueShiftEnabled1 ("Enable Hue Shift", Float) = 0
        _EmissionHueShift1 ("Hue Shift", Range(0, 1)) = 0
        
        // Second Center Out Enission
        [HideInInspector] m_start_CenterOutEmission1 ("Center Out Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionCenterOutEnabled1 ("Enable Center Out", Float) = 0
        _EmissionCenterOutSpeed1 ("Flow Speed", Float) = 5
        [HideInInspector] m_end_CenterOutEmission1 ("inward out emission", Float) = 0
        
        // Second Glow In The Dark Emission
        [HideInInspector] m_start_glowInDarkEmissionOptions1 ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        [HideInInspector][ToggleUI]_EnableGITDEmission1 ("Enable Glow In The Dark", Float) = 0
        [Enum(World, 0, Mesh, 1)] _GITDEWorldOrMesh1 ("Lighting Type", Int) = 0
        _GITDEMinEmissionMultiplier1 ("Min Emission Multiplier", Range(0, 1)) = 1
        _GITDEMaxEmissionMultiplier1 ("Max Emission Multiplier", Range(0, 1)) = 0
        _GITDEMinLight1 ("Min Lighting", Range(0, 1)) = 0
        _GITDEMaxLight1 ("Max Lighting", Range(0, 1)) = 1
        [HideInInspector] m_end_glowInDarkEmissionOptions1 ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        
        // Second Blinking Emission
        [HideInInspector] m_start_blinkingEmissionOptions1 ("Blinking Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionBlinkingEnabled1 ("Enable Blinking", Float) = 0
        _EmissiveBlink_Min1 ("Emissive Blink Min", Float) = 0
        _EmissiveBlink_Max1 ("Emissive Blink Max", Float) = 1
        _EmissiveBlink_Velocity1 ("Emissive Blink Velocity", Float) = 4
        _EmissionBlinkingOffset1 ("Offset", Float) = 0
        [HideInInspector] m_end_blinkingEmissionOptions1 ("Blinking Emission", Float) = 0
        
        // Scrolling Scrolling Emission
        [HideInInspector] m_start_scrollingEmissionOptions1 ("Scrolling Emission", Float) = 0
        [HideInInspector][ToggleUI] _ScrollingEmission1 ("Enable Scrolling Emission", Float) = 0
        [ToggleUI]_EmissionScrollingUseCurve1 ("Use Curve", float) = 0
        [Curve]_EmissionScrollingCurve1 ("Curve", 2D) = "white" { }
        _EmissiveScroll_Direction1 ("Direction", Vector) = (0, -10, 0, 0)
        _EmissiveScroll_Width1 ("Width", Float) = 10
        _EmissiveScroll_Velocity1 ("Velocity", Float) = 10
        _EmissiveScroll_Interval1 ("Interval", Float) = 20
        _EmissionScrollingOffset1 ("Offset", Float) = 0
        [HideInInspector] m_end_scrollingEmission1Options ("Scrolling Emission", Float) = 0
        [HideInInspector] m_end_emission1Options ("Emission / Glow 2", Float) = 0
        
        // Flipbook
        [HideInInspector] m_start_flipBook ("Flipbook", Float) = 0
        [Toggle(_SUNDISK_HIGH_QUALITY)]_EnableFlipbook ("Enable Flipbook", Float) = 0
        [ToggleUI]_FlipbookAlphaControlsFinalAlpha ("Flipbook Controls Alpha?", Float) = 0
        [ToggleUI]_FlipbookIntensityControlsAlpha ("Intensity Controls Alpha?", Float) = 0
        [ToggleUI]_FlipbookColorReplaces ("Color Replaces Flipbook", Float) = 0
        [TextureArray]_FlipbookTexArray ("Texture Array", 2DArray) = "" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _FlipbookTexArrayUV ("UV", Int) = 0
        [HideInInspector][Vector2]_FlipbookTexArrayPan ("Panning", Vector) = (0, 0, 0, 0)
        _FlipbookMask ("Mask", 2D) = "white" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _FlipbookMaskUV ("UV", Int) = 0
        [HideInInspector][Vector2]_FlipbookMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        _FlipbookColor ("Color & alpha", Color) = (1, 1, 1, 1)
        _FlipbookTotalFrames ("Total Frames", Int) = 1
        _FlipbookFPS ("FPS", Float) = 30.0
        _FlipbookScaleOffset ("Scale | Offset", Vector) = (1, 1, 0, 0)
        [ToggleUI]_FlipbookTiled ("Tiled?", Float) = 0
        _FlipbookEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        _FlipbookRotation ("Rotation", Range(0, 360)) = 0
        _FlipbookRotationSpeed ("Rotation Speed", Float) = 0
        _FlipbookReplace ("Replace", Range(0, 1)) = 1
        _FlipbookMultiply ("Multiply", Range(0, 1)) = 0
        _FlipbookAdd ("Add", Range(0, 1)) = 0
        
        // Flipbook Manual Control
        [HideInInspector] m_start_manualFlipbookControl ("Manual Control", Float) = 0
        _FlipbookCurrentFrame ("Current Frame", Float) = -1
        [HideInInspector] m_end_manualFlipbookControl ("Manual Control", Float) = 0
        [HideInInspector] m_end_flipBook ("Flipbook", Float) = 0
        
        // Dissolve
        [HideInInspector] m_start_dissolve ("Dissolve", Float) = 0
        [Toggle(DISTORT)]_EnableDissolve ("Enable Dissolve", Float) = 0
        [Enum(Basic, 1, Point2Point, 2)] _DissolveType ("Dissolve Type", Int) = 1
        _DissolveEdgeWidth ("Edge Width", Range(0, .5)) = 0.025
        _DissolveEdgeHardness ("Edge Hardness", Range(0, 1)) = 0.5
        _DissolveEdgeColor ("Edge Color", Color) = (1, 1, 1, 1)
        [Gradient]_DissolveEdgeGradient ("Edge Gradient", 2D) = "white" { }
        _DissolveEdgeEmission ("Edge Emission", Range(0, 20)) = 0
        _DissolveTextureColor ("Dissolved Color", Color) = (1, 1, 1, 1)
        _DissolveToTexture ("Dissolved Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_DissolveToTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DissolveToTextureUV ("UV", Int) = 0
        _DissolveToEmissionStrength ("Dissolved Emission Strength", Range(0, 20)) = 0
        _DissolveNoiseTexture ("Dissolve Noise", 2D) = "white" { }
        [HideInInspector][Vector2]_DissolveNoiseTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DissolveNoiseTextureUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_DissolveInvertNoise ("Invert?", Float) = 0
        _DissolveDetailNoise ("Dissolve Detail Noise", 2D) = "black" { }
        [HideInInspector][Vector2]_DissolveDetailNoisePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DissolveDetailNoiseUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_DissolveInvertDetailNoise ("Invert?", Float) = 0
        _DissolveDetailStrength ("Dissolve Detail Strength", Range(0, 1)) = 0.1
        _DissolveAlpha ("Dissolve Alpha", Range(0, 1)) = 0
        _DissolveMask ("Dissolve Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_DissolveMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _DissolveMaskUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_DissolveMaskInvert ("Invert?", Float) = 0
        _ContinuousDissolve ("Continuous Dissolve Speed", Float) = 0
        [HideInInspector] m_start_dissolveMasking ("Effect Masking", Float) = 0
        [Enum(Undissolved, 0, Dissolved, 1)] _DissolveEmissionSide ("Emission 1", Int) = 0
        [Enum(Undissolved, 0, Dissolved, 1)] _DissolveEmission1Side ("Emission 2", Int) = 0
        [HideInInspector] m_end_dissolveMasking ("Effect Masking", Float) = 0
        
        
        // Point to Point Dissolve
        [HideInInspector] m_start_pointToPoint ("point to point", Float) = 0
        [Enum(Local, 0, World, 1)] _DissolveP2PWorldLocal ("World/Local", Int) = 0
        _DissolveP2PEdgeLength ("Edge Length", Float) = 0.1
        [Vector3]_DissolveStartPoint ("Start Point", Vector) = (0, -1, 0, 0)
        [Vector3]_DissolveEndPoint ("End Point", Vector) = (0, 1, 0, 0)
        [HideInInspector] m_end_pointToPoint ("Point To Point", Float) = 0
        [HideInInspector] m_end_dissolve ("Dissolve", Float) = 0
        
        // Panosphere
        [HideInInspector] m_start_panosphereOptions ("Panosphere / Cubemaps", Float) = 0
        [Toggle(_DETAIL_MULX2)]_PanoToggle ("Enable Panosphere", Float) = 0
        [ToggleUI]_PanoInfiniteStereoToggle ("Infinite Stereo", Float) = 0
        _PanosphereColor ("Color", Color) = (1, 1, 1, 1)
        _PanosphereTexture ("Texture", 2D) = "white" { }
        _PanoMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_PanoMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _PanoMaskUV ("UV", Int) = 0
        _PanoEmission ("Emission Strength", Range(0, 10)) = 0
        _PanoBlend ("Alpha", Range(0, 1)) = 0
        [Vector3]_PanospherePan ("Pan Speed", Vector) = (0, 0, 0, 0)
        [ToggleUI]_PanoCubeMapToggle ("Use Cubemap", Float) = 0
        [TextureNoSO]_PanoCubeMap ("CubeMap", Cube) = "" { }
        [HideInInspector] m_end_panosphereOptions ("Panosphere / Cubemaps", Float) = 0
        
        // Glitter
        [HideInInspector] m_start_glitter ("Glitter / Sparkle", Float) = 0
        [Toggle(_SUNDISK_SIMPLE)]_GlitterEnable ("Enable Glitter?", Float) = 0
        //[Enum(Add, 0, Replace, 1)] _GlitterBlendType ("Blend Type", Int) = 0
        [HDR]_GlitterColor ("Color", Color) = (1, 1, 1)
        _GlitterUseSurfaceColor ("Use Surface Color", Range(0, 1)) = 0
        _GlitterColorMap ("Glitter Color Map", 2D) = "white" { }
        [HideInInspector][Vector2]_GlitterColorMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _GlitterColorMapUV ("UV", Int) = 0
        [HideInInspector][Vector2]_GlitterPan ("Panning", Vector) = (0, 0, 0, 0)
        _GlitterMask ("Glitter Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_GlitterMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _GlitterMaskUV ("UV", Int) = 0
        _GlitterFrequency ("Glitter Density", Float) = 300.0
        _GlitterJitter ("Glitter Jitter", Range(0, 1)) = 1.0
        _GlitterSpeed ("Glitter Wobble Speed", Float) = 10.0
        _GlitterSize ("Glitter Size", Range(0, 1)) = .3
        _GlitterContrast ("Glitter Contrast", Range(1, 1000)) = 300
        _GlitterAngleRange ("Glitter Angle Range", Range(0, 90)) = 90
        _GlitterMinBrightness ("Glitter Min Brightness", Range(0, 1)) = 0
        _GlitterBrightness ("Glitter Max Brightness", Range(0, 40)) = 3
        _GlitterBias ("Glitter Bias", Range(0, 1)) = .8
        
        // Glitter Random Colors
        [HideInInspector] m_start_glitterRandom ("Random Colors", Float) = 0
        [ToggleUI]_GlitterRandomColors ("Enable", Float) = 0
        [MultiSlider]_GlitterMinMaxSaturation ("Saturation Range", Vector) = (0.8, 1, 0, 1)
        [MultiSlider]_GlitterMinMaxBrightness ("Brightness Range", Vector) = (0.8, 1, 0, 1)
        [HideInInspector] m_end_glitterRandom ("Random Colors", Float) = 0
        [HideInInspector] m_end_glitter ("Glitter / Sparkle", Float) = 0
        
        // MSDF OVERLAY
        [HideInInspector] m_start_Text ("MSDF Text Overlay", Float) = 0
        _TextGlyphs ("Font Array", 2D) = "black" { }
        _TextPixelRange ("Pixel Range", Float) = 4.0
        [Toggle(EFFECT_BUMP)]_TextEnabled ("Text?", Float) = 0
        
        // FPS
        [HideInInspector] m_start_TextFPS ("FPS", Float) = 0
        [ToggleUI]_TextFPSEnabled ("FPS Text?", Float) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _TextFPSUV ("FPS UV", Int) = 0
        _TextFPSColor ("Color", Color) = (1, 1, 1, 1)
        _TextFPSEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [Vector2]_TextFPSOffset ("Offset", Vector) = (0, 0, 0, 0)
        _TextFPSRotation ("Rotation", Range(0, 360)) = 0
        [Vector2]_TextFPSScale ("Scale", Vector) = (1, 1, 1, 1)
        _TextFPSPadding ("Padding Reduction", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_TextFPS ("FPS", Float) = 0
        
        // POSITION
        [HideInInspector] m_start_TextPosition ("Position", Float) = 0
        [ToggleUI]_TextPositionEnabled ("Position Text?", Float) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _TextPositionUV ("Position UV", Int) = 0
        //[ToggleUI]_TextPositionVertical ("Vertical?", Float) = 0
        _TextPositionColor ("Color", Color) = (1, 0, 1, 1)
        _TextPositionEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [Vector2]_TextPositionOffset ("Offset", Vector) = (0, 0, 0, 0)
        _TextPositionRotation ("Rotation", Range(0, 360)) = 0
        [Vector2]_TextPositionScale ("Scale", Vector) = (1, 1, 1, 1)
        _TextPositionPadding ("Padding Reduction", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_TextPosition ("Position", Float) = 0
        
        // INSTANCE TIME
        [HideInInspector] m_start_TextInstanceTime ("Instance Time", Float) = 0
        [ToggleUI]_TextTimeEnabled ("Time Text?", Float) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _TextTimeUV ("Time UV", Int) = 0
        _TextTimeColor ("Color", Color) = (1, 0, 1, 1)
        _TextTimeEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [Vector2]_TextTimeOffset ("Offset", Vector) = (0, 0, 0, 0)
        _TextTimeRotation ("Rotation", Range(0, 360)) = 0
        [Vector2]_TextTimeScale ("Scale", Vector) = (1, 1, 1, 1)
        _TextTimePadding ("Padding Reduction", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_TextInstanceTime ("Instance Time", Float) = 0
        [HideInInspector] m_end_Text ("MSDF Text Overlay", Float) = 0
        
        // Mirror Rendering
        [HideInInspector] m_start_mirrorOptions ("Mirror", Float) = 0
        [Toggle(_REQUIRE_UV2)]_EnableMirrorOptions ("Enable Mirror Options", Float) = 0
        [Enum(ShowInBoth, 0, ShowOnlyInMirror, 1, DontShowInMirror, 2)] _Mirror ("Show in mirror", Int) = 0
        [ToggleUI]_EnableMirrorTexture ("Enable Mirror Texture", Float) = 0
        _MirrorTexture ("Mirror Tex", 2D) = "white" { }
        [HideInInspector][Vector2]_MirrorTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MirrorTextureUV ("UV", Int) = 0
        [HideInInspector] m_end_mirrorOptions ("Mirror", Float) = 0
        
        // Distance Fade
        [HideInInspector] m_start_distanceFade ("Distance Fade", Float) = 0
        _MainMinAlpha ("Minimum Alpha", Range(0, 1)) = 0
        _MainFadeTexture ("Fade Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_MainFadeTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _MainFadeTextureUV ("UV", Int) = 0
        [Vector2]_MainDistanceFade ("Distance Fade X to Y", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_distanceFade ("Distance Fade", Float) = 0
        
        // Angular Fade
        [HideInInspector] m_start_angularFade ("Angular Fade", Float) = 0
        [Toggle(_SUNDISK_NONE)]_EnableRandom ("Enable Angular Fade", Float) = 0
        [Enum(Camera Face Model, 0, Model Face Camera, 1, Face Each Other, 2)] _AngleType ("Angle Type", Int) = 0
        [Enum(Model, 0, Vertex, 1)] _AngleCompareTo ("Model or Vert Positon", Int) = 0
        [Vector3]_AngleForwardDirection ("Forward Direction", Vector) = (0, 0, 1, 0)
        _CameraAngleMin ("Camera Angle Min", Range(0, 180)) = 45
        _CameraAngleMax ("Camera Angle Max", Range(0, 180)) = 90
        _ModelAngleMin ("Model Angle Min", Range(0, 180)) = 45
        _ModelAngleMax ("Model Angle Max", Range(0, 180)) = 90
        _AngleMinAlpha ("Min Alpha", Range(0, 1)) = 0
        [HideInInspector] m_end_angularFade ("Angular Fade", Float) = 0
        
        // UV Distortion
        [HideInInspector] m_start_distortionFlow ("UV Distortion", Float) = 0
        [Toggle(USER_LUT)] _EnableDistortion ("Enabled?", Float) = 0
        _DistortionFlowTexture ("Distortion Texture 1", 2D) = "black" { }
        _DistortionFlowTexture1 ("Distortion Texture 2", 2D) = "black" { }
        _DistortionStrength ("Strength1", Float) = 0.5
        _DistortionStrength1 ("Strength2", Float) = 0.5
        [Vector2]_DistortionSpeed ("Speed1", Vector) = (0.5, 0.5, 0, 0)
        [Vector2]_DistortionSpeed1 ("Speed2", Vector) = (0.5, 0.5, 0, 0)
        [HideInInspector] m_end_distortionFlow ("UV Distortion", Float) = 0
        
        // Start Patreon
        [HideInInspector] m_Patreon ("Patreon", Float) = 0
        
        // Video Options
        [HideInInspector] m_start_Video ("Video", Float) = 0
        [Toggle(BLOOM)] _EnableVideo ("Enable Video", Float) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _VideoUVNumber ("Screen UV#", Int) = 0
        [Enum(LCD, 0, TN, 1, CRT, 2, OLED, 3, Gameboy, 4, Projector, 5)] _VideoType ("Screen Type", Int) = 3
        _VideoBacklight ("Brightness", Range(0, 100)) = 1
        _VideoPixelTexture ("Pixel Texture", 2D) = "white" { }
        [Vector2]_VideoResolution ("Resolution", Vector) = (1280, 720, 0)
        _VideoMaskTexture ("Mask", 2D) = "white" { }
        [Vector2]_VideoMaskPanning ("Mask Pan Speed", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_start_VideoSettings ("Video Texture Settings", Float) = 0
        [ToggleUI]_VideoEnableVideoPlayer ("Enable Video Player", Float) = 0
        [ToggleUI]_VideoPixelateToResolution ("Pixelate To Resolution", Float) = 0
        [ToggleUI]_VideoRepeatVideoTexture ("Clamp To UV", Float) = 0
        [Vector2]_VideoPanning ("Panning Speed", Vector) = (0, 0, 0, 0)
        [Vector2]_VideoTiling ("Tiling", Vector) = (1, 1, 0, 0)
        [Vector2]_VideoOffset ("Offset", Vector) = (0, 0, 0, 0)
        _VideoSaturation ("Saturation", Range(-1, 3)) = 0
        _VideoContrast ("Contrast boost", Range(0, 3)) = 0
        [HideInInspector] m_end_VideoSettings ("Video Texture Settings", Float) = 0
        [HideInInspector] m_start_VideoDebug ("Video Debug", Float) = 0
        [ToggleUI]_VideoEnableDebug ("Enable Debug", Float) = 0
        _VideoDebugTexture ("Video Debug Tex", 2D) = "white" { }
        [HideInInspector] m_end_VideoDebug ("Video Debug", Float) = 0
        [HideInInspector] m_start_CRT ("CRT Options", Float) = 0
        _VideoCRTRefreshRate ("Refresh Rate", Float) = 24
        _VideoCRTPixelEnergizedTime ("Pixel Fade Time", Float) = 1.9
        [HideInInspector] m_end_CRT ("CRT Options", Float) = 0
        [HideInInspector] m_start_Gameboy ("Gameboy Options", Float) = 0
        [Gradient]_VideoGameboyRamp ("Color Ramp", 2D) = "white" { }
        [HideInInspector] m_end_Gameboy ("Gameboy Options", Float) = 0
        [HideInInspector] m_end_Video ("Video", Float) = 0
        
        // TouchFX
        [HideInInspector] m_start_TouchOptions ("Touch FX", Float) = 0
        [HideInInspector] m_start_Bulge ("Bulge", Float) = 0
        [Toggle(BLOOM_LOW)] _EnableBulge ("Bulge", Float) = 0
        _BulgeMask ("Bulge Mask", 2D) = "white" { }
        _BuldgeFadeLength ("Touch Distance", Float) = 0.02
        _BuldgeHeight ("Bulge Height", Range(-0.2, 0.2)) = 0.02
        [HideInInspector] m_end_Bulge ("Bulge", Float) = 0
        
        [HideInInspector] m_start_TouchGlow ("Touch Color", Float) = 0
        [Toggle(GRAIN)]_EnableTouchGlow ("Enable Touch Glow", Float) = 0
        _DepthGlowColor ("Depth Glow Color", Color) = (1, 1, 1, 1)
        [Gradient]_DepthGradient ("Depth Gradient", 2D) = "white" { }
        _DepthMask ("Depth Mask", 2D) = "white" { }
        _DepthGlowEmission ("Depth Glow Emission", Float) = 3
        _FadeLength ("Fade Length", Float) = 0.02
        _DepthAlphaMin ("Alpha Min", Range(0, 1)) = 1
        _DepthAlphaMax ("Alpha Max", Range(0, 1)) = 1
        [HideInInspector] m_end_TouchGlow ("Touch Color", Float) = 0
        [HideInInspector] m_end_TouchOptions ("Touch FX", Float) = 0
        
        // Hologram
        [HideInInspector] m_start_Hologram ("Hologram Alpha", Float) = 0
        [Toggle(DEPTH_OF_FIELD)]_EnableHolo ("Enable Hologram Alpha", Float) = 0
        [Curve]_HoloAlphaMap ("Alpha Map", 2D) = "white" { }
        [Enum(World Space, 0, Local Space, 1, UV, 2)]_HoloCoordinateSpace ("Coordinate Space", Int) = 0
        _HoloDirection ("Scroll Direction", Vector) = (0, 1, 0)
        _HoloLineDensity ("Line Density", Float) = 10
        _HoloScrollSpeed ("Scroll Speed", Float) = 1
        [HideInInspector] m_start_FresnelAlpha ("Fresnel Alpha", Float) = 0
        _HoloFresnelAlpha ("Intensity", Range(0, 1)) = 0
        _HoloRimSharpness ("Sharpness", Range(0, 1)) = .5
        _HoloRimWidth ("Width", Range(0, 1)) = .5
        [HideInInspector] m_end_FresnelAlpha ("Fresnel Alpha", Float) = 0
        [HideInInspector] m_end_Hologram ("Hologram Alpha", Float) = 0
        
        // GrabPass
        [HideInInspector] m_start_GrabPass ("GrabPass Transparency", Float) = 0
        [ToggleUI] _commentIfZero_EnableGrabpass ("Enable GrabPass", Float) = 0
        [WideEnum(UnityEngine.Rendering.BlendMode)] _GrabSrcBlend ("Source Blend", Int) = 2
        [WideEnum(UnityEngine.Rendering.BlendMode)] _GrabDstBlend ("Destination Blend", Int) = 0
        [HideInInspector] m_start_Refraction ("Refraction", Float) = 0
        [ToggleUI] _RefractionEnabled ("Enable Refraction,", Float) = 0
        _RefractionIndex ("Refraction", Range(0, 3)) = 1.333333
        _RefractionChromaticAberattion ("Chromatic Aberration", Range(0, 1)) = 0
        [HideInInspector] m_end_Refraction ("Refraction", Float) = 0
        [HideInInspector] m_start_Blur ("Blur", Float) = 0
        [Toggle(CHROMATIC_ABERRATION_LOW)]_EnableBlur ("Enable Blur", Float) = 0
        _GrabBlurDistance ("Blur Distance", Range(0, 1)) = 0
        [HideInInspector] m_end_Blur ("Blur", Float) = 0
        [HideInInspector] m_end_GrabPass ("GrabPass Transparency", Float) = 0
        
        // Iridescence
        [HideInInspector] m_start_Iridescence ("Iridescence", Float) = 0
        [Toggle(BLOOM_LENS_DIRT)]_EnableIridescence ("Enable Iridescence", Float) = 0
        [Gradient]_IridescenceRamp ("Ramp", 2D) = "white" { }
        [ToggleUI]_IridescenceNormalToggle ("Custom Normals?", Float) = 0
        [Normal]_IridescenceNormalMap ("Normal Map", 2D) = "bump" { }
        _IridescenceMask ("Mask", 2D) = "white" { }
        _IridescenceNormalIntensity ("Normal Intensity", Range(0, 10)) = 1
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _IridescenceNormalUV ("Normal UV", Int) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _IridescenceMaskUV ("Mask UV", Int) = 0
        [Enum(vertex, 0, pixel, 1)] _IridescenceNormalSelection ("Normal Select", Int) = 1
        _IridescenceIntensity ("Intensity", Range(0, 10)) = 1
        _IridescenceAddBlend ("Blend Add", Range(0, 1)) = 0
        _IridescenceReplaceBlend ("Blend Replace", Range(0, 1)) = 0
        _IridescenceMultiplyBlend ("Blend Multiply", Range(0, 1)) = 0
        _IridescenceEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [Enum(Run Early, 0, Run Late, 1)] _IridescenceTime ("When To Run", Int) = 0
        [HideInInspector] m_end_Iridescence ("Iridescence", Float) = 0
        
        // Vertex Glitching
        [HideInInspector] m_start_VertexGlitch ("Vertex Glitching", Float) = 0
        [ToggleUI]_EnableVertexGlitch ("Enable Vertex Glitching", Float) = 0
        _VertexGlitchFrequency ("Glitch Interval", Float) = 0
        _VertexGlitchThreshold ("Glitch Threshold", Range(0, 1)) = 1
        _VertexGlitchStrength ("Glitch Strength", Range(0, 10)) = 1
        [HideInInspector] m_end_VertexGlitch ("Vertex Glitching", Float) = 0
        
        // Spawn In Effects
        [HideInInspector] m_start_Spawns ("Spawns", Float) = 0
        [HideInInspector] m_start_ScifiSpawnIn ("Sci Fi", Float) = 0
        [ToggleUI]_EnableScifiSpawnIn ("Enable Sci Fi Spawn", Float) = 0
        _SpawnInNoise ("Spawn Noise", 2D) = "black" { }
        _SpawnInNoiseIntensity ("Noise Intensity", Range(0, 1)) = .35
        _SpawnInAlpha ("Spawn Alpha", Range(0, 1)) = 0
        [Vector3]_SpawnInGradientStart ("Gradient Start", Vector) = (0, 2, 0)
        [Vector3]_SpawnInGradientFinish ("Gradient End", Vector) = (0, -2, 0)
        [HDR]_SpawnInEmissionColor ("Emission Color", Color) = (1, 1, 1)
        _SpawnInEmissionOffset ("Emission Width", Range(0, 1)) = .1
        _SpawnInVertOffset ("Vertex Offset Speed", Float) = 10
        _SpawnInVertOffsetOffset ("vert width", Range(0, 1)) = .1
        [HideInInspector] m_end_SciFiSpawnIn ("Sci Fi", Float) = 0
        [HideInInspector] m_end_Spawns ("Spawns", Float) = 0
        
        // Voronoi
        [HideInInspector] m_start_Voronoi ("Vertex Glitching", Float) = 0
        [Enum(2D(Fast), 0, 3D(Fast with color bugs), 1, 3D(slow but no bugs), 2)] _VoronoiType ("Space", Int) = 1
        [Enum(Local, 0, World, 1, UV, 2)] _VoronoiSpace ("Space", Int) = 0
        [Enum(Color and Emission, 0, Just Emission, 1)] _VoronoiBlend ("Blend", Int) = 0
        [Toggle(CHROMATIC_ABERRATION)]_EnableVoronoi ("Enable Voronoi", Float) = 0
        _VoronoiMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_VoronoiMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _VoronoiMaskUV ("UV", Int) = 0
        _VoronoiNoise ("Edge Noise", 2D) = "black" { }
        [HideInInspector][Vector2]_VoronoiNoisePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _VoronoiNoiseUV ("UV", Int) = 0
        _VoronoiNoiseIntensity ("Noise Intensity", Range(0, 1)) = .1
        _VoronoiColor0 ("Color 0", Color) = (0, 0, 0, 1)
        _VoronoiEmission0 ("Emission 0", Range(0, 20)) = 0
        _VoronoiColor1 ("Color 1", Color) = (1, 1, 1, 1)
        _VoronoiEmission1 ("Emission 1", Range(0, 20)) = 0
        [Vector2]_VoronoiGradient ("Gradient", Vector) = (.04, .05, 0, 0)
        _VoronoiScale ("Scale", Float) = 5
        [Vector3]_VoronoiSpeed ("Speed", Vector) = (3, 3, 3)
        [HideInInspector] m_start_voronoiRandom ("Voronoi Random Cell Color", Float) = 0
        [ToggleUI]_VoronoiEnableRandomCellColor ("Rando Cell Col", Float) = 0
        [MultiSlider]_VoronoiRandomMinMaxSaturation ("Saturation Range", Vector) = (0.8, 1, 0, 1)
        [MultiSlider]_VoronoiRandomMinMaxBrightness ("Brightness Range", Vector) = (0.8, 1, 0, 1)
        [HideInInspector] m_end_voronoiRandom ("Voronoi Random Cell Color", Float) = 0
        [HideInInspector] m_end_Voronoi ("Vertex Glitching", Float) = 0
        
        [HideInInspector] m_start_BlackLight ("Black Light Mask", Float) = 0
        [HideInInspector][Toggle(_SPECULARHIGHLIGHTS_OFF)]_BlackLightMaskEnabled ("Black Light Mask Enabled", Float) = 0
        _BlackLightMaskKeys ("Mask Keys", Vector) = (2, 3, 4, 5)
        _BlackLightMaskStart ("Gradient Start", Vector) = (0, 0, 0, 0)
        _BlackLightMaskEnd ("Gradient End", Vector) = (1, 1, 1, 1)
        [ToggleUI]_BlackLightMaskDebug ("Visualize", Float) = 0
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskMetallic ("Metallic", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskClearCoat ("Clear Coat", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskMatcap ("Matcap 1", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskMatcap2 ("Matcap 2", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskEmission ("Emission 1", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskEmission2 ("Emission 2", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskFlipbook ("Flipbook", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskDissolve ("Dissolve", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskPanosphere ("Panosphere", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskGlitter ("Glitter", Int) = 4
        [Enum(X, 0, Y, 1, Z, 2, W, 3, Off, 4)] _BlackLightMaskIridescence ("Iridescence", Int) = 4
        [HideInInspector] m_end_BlackLight ("Black Light", Float) = 0
        // End Patreon
        
        // Parallax Mapping
        [HideInInspector] m_ParallaxMap ("Parallax", Float) = 0
        [Toggle(_PARALLAXMAP)]_ParallaxMap ("Enable Parallax FX", Float) = 0
        [ToggleUI]_ParallaxHeightMapEnabled ("Enable Parallax Height", Float) = 0
        [ToggleUI]_ParallaxInternalMapEnabled ("Enable Parallax Internal", Float) = 0
        [HideInInspector] m_start_parallaxHeightmap ("Heightmap", Float) = 0
        [Vector2]_ParallaxHeightMapPan ("Pan", Vector) = (0, 0, 0, 0)
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _ParallaxUV ("Parallax UV", Int) = 0
        _ParallaxHeightMap ("Height Map", 2D) = "black" { }
        _ParallaxHeightMapMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_ParallaxHeightMapMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _ParallaxHeightMapMaskUV ("UV", Int) = 0
        _ParallaxStrength ("Parallax Strength", Range(0, 1)) = 0
        [HideInInspector] m_end_parallaxHeightmap ("Heightmap", Float) = 0
        [HideInInspector] m_start_parallaxInternal ("Internal", Float) = 0
        [Enum(Basic, 0, HeightMap, 1)] _ParallaxInternalHeightmapMode ("Parallax Mode", Int) = 0
        [ToggleUI]_ParallaxInternalHeightFromAlpha ("HeightFromAlpha", Float) = 0
        _ParallaxInternalMap ("Internal Map", 2D) = "black" { }
        _ParallaxInternalMapMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_ParallaxInternalMapMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, DistortedUV1, 4)] _ParallaxInternalMapMaskUV ("UV", Int) = 0
        _ParallaxInternalIterations ("Parallax Internal Iterations", Range(1, 50)) = 1
        _ParallaxInternalMinDepth ("Min Depth", Float) = 0
        _ParallaxInternalMaxDepth ("Max Depth", Float) = 1
        _ParallaxInternalMinFade ("Min Depth Brightness", Range(0, 5)) = 0
        _ParallaxInternalMaxFade ("Max Depth Brightness", Range(0, 5)) = 1
        _ParallaxInternalMinColor ("Min Depth Color", Color) = (1, 1, 1, 1)
        _ParallaxInternalMaxColor ("Max Depth Color", Color) = (1, 1, 1, 1)
        [Vector2]_ParallaxInternalPanSpeed ("Pan Speed", Vector) = (0, 0, 0, 0)
        [Vector2]_ParallaxInternalPanDepthSpeed ("Per Level Speed Multiplier", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_parallaxInternal ("Internal", Float) = 0
        [HideInInspector] m_start_parallaxAdvanced ("Advanced", Float) = 0
        _ParallaxBias ("Parallax Bias (0.42)", Float) = 0.42
        [HideInInspector] m_end_parallaxAdvanced ("Advanced", Float) = 0
        
        // Rendering Options
        [HideInInspector] m_renderingOptions ("Rendering Options", Float) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
        [Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Int) = 1
        [WideEnum(Kaj.ColorMask)] _ColorMask ("Color Mask", Int) = 15
        _OffsetFactor ("Offset Factor", Float) = 0.0
        _OffsetUnits ("Offset Units", Float) = 0.0
        [ToggleUI]_IgnoreFog ("Ignore Fog", Float) = 0
        [HideInInspector] Instancing ("Instancing", Float) = 0 //add this property for instancing variants settings to be shown
        
        // Blending Options
        [HideInInspector] m_start_blending ("Blending", Float) = 0
        [WideEnum(Kaj.BlendOp)]_BlendOp ("RGB Blend Op", Int) = 0
        [WideEnum(Kaj.BlendOp)]_BlendOpAlpha ("Alpha Blend Op", Int) = 0
        [WideEnum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("RGB Source Blend", Int) = 1
        [WideEnum(UnityEngine.Rendering.BlendMode)] _DstBlend ("RGB Destination Blend", Int) = 0
        [WideEnum(UnityEngine.Rendering.BlendMode)] _SrcBlendAlpha ("Alpha Source Blend", Int) = 1
        [WideEnum(UnityEngine.Rendering.BlendMode)] _DstBlendAlpha ("Alpha Destination Blend", Int) = 0
        [HideInInspector] m_end_blending ("Blending", Float) = 0
        
        // Stencils
        [HideInInspector] m_start_StencilPassOptions ("Stencil", Float) = 0
        [IntRange] _StencilRef ("Stencil Reference Value", Range(0, 255)) = 0
        [IntRange] _StencilReadMask ("Stencil ReadMask Value", Range(0, 255)) = 0
        [IntRange] _StencilWriteMask ("Stencil WriteMask Value", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilPassOp ("Stencil Pass Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilFailOp ("Stencil Fail Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilZFailOp ("Stencil ZFail Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompareFunction ("Stencil Compare Function", Float) = 8
        [HideInInspector] m_end_StencilPassOptions ("Stencil", Float) = 0
        
        // Outline Stencil
        [HideInInspector] m_start_OutlineStencil ("Outline Stencil", Float) = 0
        [IntRange] _OutlineStencilRef ("Stencil Reference Value", Range(0, 255)) = 0
        [IntRange] _OutlineStencilReadMask ("Stencil ReadMask Value", Range(0, 255)) = 0
        [IntRange] _OutlineStencilWriteMask ("Stencil WriteMask Value", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilPassOp ("Stencil Pass Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilFailOp ("Stencil Fail Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilZFailOp ("Stencil ZFail Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _OutlineStencilCompareFunction ("Stencil Compare Function", Float) = 8
        [HideInInspector] m_end_OutlineStencil ("Outline Stencil", Float) = 0
        
        // Debug Options
        [HideInInspector] m_start_debugOptions ("Debug", Float) = 0
        [HideInInspector][Toggle(_COLOROVERLAY_ON)]_DebugEnabled ("Display Debug Info", Float) = 0
        _VertexUnwrap ("Unwrap", Range(0, 1)) = 0
        [Enum(Off, 0, Vertex Normal, 1, Pixel Normal, 2, Tangent, 3, Binormal, 4)] _DebugMeshData ("Mesh Data", Int) = 0
        [Enum(Off, 0, Attenuation, 1, Direct Lighting, 2, Indirect Lighting, 3, light Map, 4, Ramped Light Map, 5, Final Lighting, 6)] _DebugLightingData ("Lighting Data", Int) = 0
        [Enum(Off, 0, View Dir, 1, Tangent View Dir, 2, Forward Dir, 3, WorldPos, 4, View Dot Normal, 5)] _DebugCameraData ("Camera Data", Int) = 0
        [HideInInspector] m_end_debugOptions ("Debug", Float) = 0
        
        [HideInInspector] m_animationToggles ("Animation Support Toggles", Float) = 0
        [HelpBox(1)] _AnimationToggleHelp ("You don't need to search through this list. You can enable animation support on any property by right clicking it", Int) = 0
        
        // Main
        [Header(Main)]
        [ToggleUILeft]_ColorAnimated ("Color & Alpha", Int) = 0
        [ToggleUILeft]_MainTexAnimated ("Texture", Int) = 0
        [ToggleUILeft]_MainTex_STAnimated ("Texture Offset/Scale", Int) = 0
        [ToggleUILeft]_MainTexPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_MainTextureUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SaturationAnimated ("Saturation", Int) = 0
        [ToggleUILeft]_MainVertexColoringAnimated ("Use Vertex Color", Int) = 0
        [ToggleUILeft]_MainEmissionStrengthAnimated ("Basic Emission", Int) = 0
        [ToggleUILeft]_BumpMapAnimated ("Normal Map", Int) = 0
        [ToggleUILeft]_BumpMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_BumpMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_BumpScaleAnimated ("Normal Intensity", Int) = 0
        [ToggleUILeft]_AlphaMaskAnimated ("Alpha Map", Int) = 0
        [ToggleUILeft]_AlphaMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_AlphaMaskUVAnimated ("UV", Int) = 0
        
        //Hue Shifting
        [Header(Main Hue Shift)]
        [ToggleUILeft]_MainHueShiftToggleAnimated ("Toggle Hueshift", Int) = 0
        [ToggleUILeft]_MainHueShiftReplaceAnimated ("Replace?", Int) = 0
        [ToggleUILeft]_MainHueShiftAnimated ("Hue Shift", Int) = 0
        [ToggleUILeft]_MainHueShiftSpeedAnimated ("Shift Speed", Int) = 0
        [ToggleUILeft]_MainHueShiftMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_MainHueShiftMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_MainHueShiftMaskUVAnimated ("UV", Int) = 0
        
        // RGB Masking
        [Header(Main RGB Masking)]
        [ToggleUILeft]_RGBMaskEnabledAnimated ("RGB Mask Enabled", Int) = 0
        [ToggleUILeft]_RGBBlendMultiplicativeAnimated ("Multiplicative?", Int) = 0
        [ToggleUILeft]_RGBMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_RGBMaskPanningAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RGBMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_RedColorAnimated ("R Color", Int) = 0
        [ToggleUILeft]_RedTexureAnimated ("R Texture", Int) = 0
        [ToggleUILeft]_RGBRedPanningAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RGBRed_UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_GreenColorAnimated ("G Color", Int) = 0
        [ToggleUILeft]_GreenTextureAnimated ("G Texture", Int) = 0
        [ToggleUILeft]_RGBGreenPanningAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RGBGreen_UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_BlueColorAnimated ("B Color", Int) = 0
        [ToggleUILeft]_BlueTextureAnimated ("B Texture", Int) = 0
        [ToggleUILeft]_RGBBluePanningAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RGBBlue_UVAnimated ("UV", Int) = 0
        
        // Detail Options
        [Header(Main Details)]
        [ToggleUILeft]_DetailMaskAnimated ("Detail Mask (R:Texture, G:Normal)", Int) = 0
        [ToggleUILeft]_DetailMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DetailMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DetailTintAnimated ("Detail Texture Tint", Int) = 0
        [ToggleUILeft]_DetailTexAnimated ("Detail Texture", Int) = 0
        [ToggleUILeft]_DetailTexPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DetailTexUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DetailTexIntensityAnimated ("Detail Tex Intensity", Int) = 0
        [ToggleUILeft]_DetailBrightnessAnimated ("Detail Brightness:", Int) = 0
        [ToggleUILeft]_DetailNormalMapAnimated ("Detail Normal", Int) = 0
        [ToggleUILeft]_DetailNormalMapScaleAnimated ("Detail Normal Intensity", Int) = 0
        [ToggleUILeft]_DetailNormalMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DetailNormalMapUVAnimated ("UV", Int) = 0
        
        //Vertex Manipulations
        [Header(Main Vertex Options)]
        [ToggleUILeft]_VertexManipulationLocalTranslationAnimated ("Local Translation", Int) = 0
        [ToggleUILeft]_VertexManipulationLocalRotationAnimated ("Local Rotation", Int) = 0
        [ToggleUILeft]_VertexManipulationLocalScaleAnimated ("Local Scale", Int) = 0
        [ToggleUILeft]_VertexManipulationWorldTranslationAnimated ("World Translation", Int) = 0
        [ToggleUILeft]_VertexManipulationHeightAnimated ("Vertex Height", Int) = 0
        [ToggleUILeft]_VertexManipulationHeightMaskAnimated ("Height Map", Int) = 0
        [ToggleUILeft]_VertexManipulationHeightPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_VertexManipulationHeightUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_VertexManipulationHeightBiasAnimated ("Mask Bias", Int) = 0
        [ToggleUILeft]_VertexRoundingEnabledAnimated ("Rounding Enabled", Int) = 0
        [ToggleUILeft]_VertexRoundingDivisionAnimated ("Division Amount", Int) = 0
        
        // Alpha Options
        [Header(Main Alpha Options)]
        [ToggleUILeft]_AlphaModAnimated ("Alpha Mod", Int) = 0
        [ToggleUILeft]_CutoffAnimated ("Alpha Cuttoff", Int) = 0
        [ToggleUILeft]_DitheringEnabledAnimated ("Enable Dithering", Int) = 0
        [ToggleUILeft]_DitherGradientAnimated ("Dither Gradient", Int) = 0
        [ToggleUILeft]_ForceOpaqueAnimated ("Force Opaque", Int) = 0
        [ToggleUILeft]_MainShadowClipModAnimated ("Shadow Clip Mod", Int) = 0
        [ToggleUILeft]_AlphaToMaskAnimated ("Alpha To Coverage", Int) = 0
        [ToggleUILeft]_MainAlphaToCoverageAnimated ("Sharpenned A2C", Int) = 0
        [ToggleUILeft]_AlphaPremultiplyAnimated ("Alpha Premultiply", Int) = 0
        [ToggleUILeft]_MainMipScaleAnimated ("Mip Level Alpha Scale", Int) = 0
        
        // Decal Texture
        [Header(Main Decal Textures)]
        [ToggleUILeft]_DecalEnabledAnimated ("Enable", Int) = 0
        [ToggleUILeft]_DecalColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_DecalEmissionStrengthAnimated ("Color", Int) = 0
        [ToggleUILeft]_DecalTextureAnimated ("Decal", Int) = 0
        [ToggleUILeft]_DecalTexturePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DecalTextureUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DecalMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_DecalMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DecalMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DecalTiledAnimated ("Tiled?", Int) = 0
        [ToggleUILeft]_DecalScaleAnimated ("Scale", Int) = 0
        [ToggleUILeft]_DecalPositionAnimated ("Position", Int) = 0
        [ToggleUILeft]_DecalRotationAnimated ("Rotation", Int) = 0
        [ToggleUILeft]_DecalRotationSpeedAnimated ("Rotation Speed", Int) = 0
        [ToggleUILeft]_DecalBlendAddAnimated ("Add", Int) = 0
        [ToggleUILeft]_DecalBlendMultiplyAnimated ("Multiply", Int) = 0
        [ToggleUILeft]_DecalBlendReplaceAnimated ("Replace", Int) = 0
        
        // Back Face Textures and Emission
        [Header(Main Back Face)]
        [ToggleUILeft]_BackFaceEnabledAnimated ("Enable Back Face Options", Int) = 0
        [ToggleUILeft]_BackFaceTextureAnimated ("Texture", Int) = 0
        [ToggleUILeft]_BackFacePanningAnimated ("Panning", Int) = 0
        [ToggleUILeft]_BackFaceTextureUVAnimated ("UV#", Int) = 0
        [ToggleUILeft]_BackFaceDetailIntensityAnimated ("Detail Intensity", Int) = 0
        [ToggleUILeft]_BackFaceHueShiftAnimated ("Hue Shift", Int) = 0
        [ToggleUILeft]_BackFaceEmissionStrengthAnimated ("Emission Strength", Int) = 0
        
        // Lighting
        [Header(Lighting)]
        [ToggleUILeft]_EnableLightingAnimated ("Enable Lighting", Int) = 0
        [ToggleUILeft]_LightingTypeAnimated ("Lighting Type", Int) = 0
        [ToggleUILeft]_LightingMonochromaticAnimated ("Monochromatic?", Int) = 0
        [ToggleUILeft]_LightingGradientStartAnimated ("Gradient Start", Int) = 0
        [ToggleUILeft]_LightingGradientEndAnimated ("Gradient End", Int) = 0
        [ToggleUILeft]_LightingStartColorAnimated ("Light Tint", Int) = 0
        [ToggleUILeft]_LightingEndColorAnimated ("Shadow Tint", Int) = 0
        [ToggleUILeft]_ToonRampAnimated ("Lighting Ramp", Int) = 0
        [ToggleUILeft]_LightingShadowMaskAnimated ("Shadow Mask (RGBA)", Int) = 0
        [ToggleUILeft]_LightingShadowMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_LightingShadowMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_ShadowStrengthAnimated ("Shadow Strength", Int) = 0
        [ToggleUILeft]_ShadowOffsetAnimated ("Shadow Offset", Int) = 0
        [ToggleUILeft]_LightingAOTexAnimated ("AO Map", Int) = 0
        [ToggleUILeft]_LightingAOTexPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_LightingAOTexUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_AOStrengthAnimated ("AO Strength", Int) = 0
        [ToggleUILeft]_LightingMinLightBrightnessAnimated ("Min Brightness", Int) = 0
        [ToggleUILeft]_LightingIndirectContributionAnimated ("Indirect Contribution", Int) = 0
        [ToggleUILeft]_AttenuationMultiplierAnimated ("Recieve Casted Shadows?", Int) = 0
        [ToggleUILeft]_LightingDetailShadowsAnimated ("Detail Shadows", Int) = 0
        [ToggleUILeft]_LightingDetailShadowsPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_LightingDetailShadowsUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_LightingDetailStrengthAnimated ("Detail Strength", Int) = 0
        [ToggleUILeft]_LightingStandardSmoothnessAnimated ("Smoothness", Int) = 0
        
        // Lighting Beta Options
        [Header(Lighting Beta)]
        [ToggleUILeft]_LightingNoIndirectThresholdAnimated ("Absent Indirect Threshold", Int) = 0
        [ToggleUILeft]_LightingNoIndirectMultiplierAnimated ("Absent Indirect Multiplier", Int) = 0
        [ToggleUILeft]_LightingStandardControlsToonAnimated ("Standard Lighting Controls Toon Ramp", Int) = 0
        [ToggleUILeft]_LightingNumRampsAnimated ("Num Ramps", Int) = 0
        [ToggleUILeft]_ToonRamp1Animated ("Lighting Ramp 2", Int) = 0
        [ToggleUILeft]_LightingShadowStrength1Animated ("Shadow Strength 2", Int) = 0
        [ToggleUILeft]_ShadowOffset1Animated ("Shadow Offset 2", Int) = 0
        [ToggleUILeft]_ToonRamp2Animated ("Lighting Ramp 3", Int) = 0
        [ToggleUILeft]_LightingShadowStrength2Animated ("Shadow Strength 3", Int) = 0
        [ToggleUILeft]_ShadowOffset2Animated ("Shadow Offset 3", Int) = 0
        
        // point/spot Light Settings
        [Header(Additive Lighting)]
        [ToggleUILeft]_LightingAdditiveTypeAnimated ("Lighting Type", Int) = 0
        [ToggleUILeft]_LightingAdditiveGradientStartAnimated ("Gradient Start", Int) = 0
        [ToggleUILeft]_LightingAdditiveGradientEndAnimated ("Gradient End", Int) = 0
        [ToggleUILeft]_LightingAdditivePassthroughAnimated ("Point Light Passthrough", Int) = 0
        [ToggleUILeft]_LightingAdditiveDetailStrengthAnimated ("Detail Shadow Strength", Int) = 0
        
        // Subsurface Scattering
        [Header(Subsurface Scattering)]
        [ToggleUILeft]_EnableSSSAnimated ("Enable Subsurface Scattering", Int) = 0
        [ToggleUILeft]_SSSColorAnimated ("Subsurface Color", Int) = 0
        [ToggleUILeft]_SSSThicknessMapAnimated ("Thickness Map", Int) = 0
        [ToggleUILeft]_SSSThicknessMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SSSThicknessMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SSSThicknessModAnimated ("Thickness mod", Int) = 0
        [ToggleUILeft]_SSSSCaleAnimated ("Light Strength", Int) = 0
        [ToggleUILeft]_SSSPowerAnimated ("Light Spread", Int) = 0
        [ToggleUILeft]_SSSDistortionAnimated ("Light Distortion", Int) = 0
        
        // Rim Lighting
        [Header(Rim Lighting)]
        [ToggleUILeft]_EnableRimLightingAnimated ("Enable Rim Lighting", Int) = 0
        [ToggleUILeft]_RimLightNormalAnimated ("Normal Select", Int) = 0
        [ToggleUILeft]_RimLightingInvertAnimated ("Invert Rim Lighting", Int) = 0
        [ToggleUILeft]_RimLightColorAnimated ("Rim Color", Int) = 0
        [ToggleUILeft]_RimWidthAnimated ("Rim Width", Int) = 0
        [ToggleUILeft]_RimSharpnessAnimated ("Rim Sharpness", Int) = 0
        [ToggleUILeft]_RimStrengthAnimated ("Rim Emission", Int) = 0
        [ToggleUILeft]_RimBrightenAnimated ("Rim Color Brighten", Int) = 0
        [ToggleUILeft]_RimLightColorBiasAnimated ("Rim Color Bias", Int) = 0
        [ToggleUILeft]_RimTexAnimated ("Rim Texture", Int) = 0
        [ToggleUILeft]_RimTexPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RimTexUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_RimMaskAnimated ("Rim Mask", Int) = 0
        [ToggleUILeft]_RimMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RimMaskUVAnimated ("UV", Int) = 0
        
        // Rim Noise
        [Header(Rim Noise)]
        [ToggleUILeft]_RimWidthNoiseTextureAnimated ("Rim Width Noise", Int) = 0
        [ToggleUILeft]_RimWidthNoiseTexturePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RimWidthNoiseTextureUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_RimWidthNoiseStrengthAnimated ("Intensity", Int) = 0
        
        // Rim Shadow Mix
        [Header(Rim Shadow Mix)]
        [ToggleUILeft]_ShadowMixAnimated ("Shadow Mix In", Int) = 0
        [ToggleUILeft]_ShadowMixThresholdAnimated ("Shadow Mix Threshold", Int) = 0
        [ToggleUILeft]_ShadowMixWidthModAnimated ("Shadow Mix Width Mod", Int) = 0
        
        // Environmental Rim Lighting
        [Header(Environmental Rim Lighting)]
        [ToggleUILeft]_EnableEnvironmentalRimAnimated ("Enable Environmental Rim", Int) = 0
        [ToggleUILeft]_RimEnviroMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_RimEnviroMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_RimEnviroMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_RimEnviroBlurAnimated ("Blur", Int) = 0
        [ToggleUILeft]_RimEnviroWidthAnimated ("Rim Width", Int) = 0
        [ToggleUILeft]_RimEnviroSharpnessAnimated ("Rim Sharpness", Int) = 0
        [ToggleUILeft]_RimEnviroMinBrightnessAnimated ("Min Brightness Threshold", Int) = 0
        [ToggleUILeft]_RimEnviroIntensityAnimated ("Intensity", Int) = 0
        
        // Metallics
        [Header(Metallics)]
        [ToggleUILeft]_EnableMetallicAnimated ("Enable Metallics", Int) = 0
        [ToggleUILeft]_CubeMapAnimated ("Baked CubeMap", Int) = 0
        [ToggleUILeft]_SampleWorldAnimated ("Force Baked Cubemap", Int) = 0
        [ToggleUILeft]_MetalReflectionTintAnimated ("Reflection Tint", Int) = 0
        [ToggleUILeft]_MetallicTintMapAnimated ("Tint Map", Int) = 0
        [ToggleUILeft]_MetallicTintMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_MetallicTintMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_MetallicMaskAnimated ("Metallic Mask", Int) = 0
        [ToggleUILeft]_MetallicMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_MetallicMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_MetallicAnimated ("Metallic", Int) = 0
        [ToggleUILeft]_SmoothnessMaskAnimated ("Smoothness Map", Int) = 0
        [ToggleUILeft]_SmoothnessMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SmoothnessMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_InvertSmoothnessAnimated ("Invert Smoothness Map", Int) = 0
        [ToggleUILeft]_SmoothnessAnimated ("Smoothness", Int) = 0
        
        // Clearcoat
        [Header(Clearcoat)]
        [ToggleUILeft]_EnableClearCoatAnimated ("Enable Clear Coat", Int) = 0
        [ToggleUILeft]_ClearCoatNormalToUseAnimated ("What Normal?", Int) = 0
        [ToggleUILeft]_ClearCoatCubeMapAnimated ("Baked CubeMap", Int) = 0
        [ToggleUILeft]_ClearCoatSampleWorldAnimated ("Force Baked Cubemap", Int) = 0
        [ToggleUILeft]_ClearCoatTintAnimated ("Reflection Tint", Int) = 0
        [ToggleUILeft]_ClearCoatMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_ClearCoatMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_ClearCoatMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_ClearCoatAnimated ("Clear Coat", Int) = 0
        [ToggleUILeft]_ClearCoatSmoothnessMapAnimated ("Smoothness Map", Int) = 0
        [ToggleUILeft]_ClearCoatSmoothnessMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_ClearCoatSmoothnessMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_ClearCoatInvertSmoothnessAnimated ("Invert Smoothness Map", Int) = 0
        [ToggleUILeft]_ClearCoatSmoothnessAnimated ("Smoothness", Int) = 0
        [ToggleUILeft]_ClearCoatForceLightingAnimated ("Force Lighting", Int) = 0
        
        // First Matcap
        [Header(Matcap)]
        [ToggleUILeft]_MatcapEnableAnimated ("Enable Matcap", Int) = 0
        [ToggleUILeft]_MatcapColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_MatcapAnimated ("Matcap", Int) = 0
        [ToggleUILeft]_MatcapBorderAnimated ("Border", Int) = 0
        [ToggleUILeft]_MatcapMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_MatcapMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_MatcapMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_MatcapEmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_MatcapIntensityAnimated ("Intensity", Int) = 0
        [ToggleUILeft]_MatcapLightMaskAnimated ("Hide in Shadow", Int) = 0
        [ToggleUILeft]_MatcapReplaceAnimated ("Replace With Matcap", Int) = 0
        [ToggleUILeft]_MatcapMultiplyAnimated ("Multiply Matcap", Int) = 0
        [ToggleUILeft]_MatcapAddAnimated ("Add Matcap", Int) = 0
        [ToggleUILeft]_MatcapNormalAnimated ("Normal to use", Int) = 0
        
        // Second Matcap
        [Header(Second Matcap)]
        [ToggleUILeft]_Matcap2EnableAnimated ("Enable Matcap 2", Int) = 0
        [ToggleUILeft]_Matcap2ColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_Matcap2Animated ("Matcap", Int) = 0
        [ToggleUILeft]_Matcap2BorderAnimated ("Border", Int) = 0
        [ToggleUILeft]_Matcap2MaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_Matcap2MaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_Matcap2MaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_Matcap2EmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_Matcap2IntensityAnimated ("Intensity", Int) = 0
        [ToggleUILeft]_Matcap2LightMaskAnimated ("Hide in Shadow", Int) = 0
        [ToggleUILeft]_Matcap2ReplaceAnimated ("Replace With Matcap", Int) = 0
        [ToggleUILeft]_Matcap2MultiplyAnimated ("Multiply Matcap", Int) = 0
        [ToggleUILeft]_Matcap2AddAnimated ("Add Matcap", Int) = 0
        [ToggleUILeft]_Matcap2NormalAnimated ("Normal to use", Int) = 0
        
        // Specular
        [Header(Specular)]
        [ToggleUILeft]_EnableSpecularAnimated ("Enable Specular", Int) = 0
        [ToggleUILeft]_SpecularTypeAnimated ("Specular Type", Int) = 0
        [ToggleUILeft]_SpecularNormalAnimated ("Normal Select", Int) = 0
        [ToggleUILeft]_SpecularAttenuationAnimated ("Attenuation Strength", Int) = 0
        [ToggleUILeft]_SpecularTintAnimated ("Specular Tint", Int) = 0
        [ToggleUILeft]_SpecularMetallicAnimated ("Metallic", Int) = 0
        [ToggleUILeft]_SpecularSmoothnessAnimated ("Smoothness", Int) = 0
        [ToggleUILeft]_SpecularMapAnimated ("Specular Map", Int) = 0
        [ToggleUILeft]_SpecularMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularInvertSmoothnessAnimated ("Invert Smoothness", Int) = 0
        [ToggleUILeft]_SpecularMaskAnimated ("Specular Mask", Int) = 0
        [ToggleUILeft]_SpecularMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SmoothnessFromAnimated ("Smoothness From", Int) = 0
        [ToggleUILeft]_SpecWhatTangentAnimated ("(Bi)Tangent?", Int) = 0
        [ToggleUILeft]_AnisoSpec1AlphaAnimated ("Spec1 Alpha", Int) = 0
        [ToggleUILeft]_AnisoSpec2AlphaAnimated ("Spec2 Alpha", Int) = 0
        [ToggleUILeft]_Spec1OffsetAnimated ("Spec1 Offset", Int) = 0
        [ToggleUILeft]_Spec2SmoothnessAnimated ("Spec2 Smoothness", Int) = 0
        [ToggleUILeft]_AnisoUseTangentMapAnimated ("Use Directional Map?", Int) = 0
        [ToggleUILeft]_AnisoTangentMapAnimated ("Anisotropic Directional Map", Int) = 0
        [ToggleUILeft]_AnisoTangentMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_AnisoTangentMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularToonStartAnimated ("Spec Toon Start", Int) = 0
        [ToggleUILeft]_SpecularToonEndAnimated ("Spec Toon End", Int) = 0
        //[ToggleUI]_CenterOutSpecColorAnimated ("Center Out SpecMap", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMirroredAnimated ("Mirrored?", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicroAnimated ("Micro Shift", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicroMultiplierAnimated ("Micro Multiplier", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicroPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicroUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacroAnimated ("Macro Shift", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacroMultiplierAnimated ("Macro Multiplier", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacroPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacroUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularToonInnerOuterAnimated ("Inner/Outer Edge", Int) = 0
        
        // Second Specular
        [Header(Second Specular)]
        [ToggleUILeft]_EnableSpecular1Animated ("Enable Specular", Int) = 0
        [ToggleUILeft]_SpecularType1Animated ("Specular Type", Int) = 0
        [ToggleUILeft]_SpecularNormal1Animated ("Normal Select", Int) = 0
        [ToggleUILeft]_SpecularAttenuation1Animated ("Attenuation Strength", Int) = 0
        [ToggleUILeft]_SpecularTint1Animated ("Specular Tint", Int) = 0
        [ToggleUILeft]_SpecularMetallic1Animated ("Metallic", Int) = 0
        [ToggleUILeft]_SpecularSmoothness1Animated ("Smoothness", Int) = 0
        [ToggleUILeft]_SpecularMap1Animated ("Specular Map", Int) = 0
        [ToggleUILeft]_SpecularMap1PanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularMap1UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularInvertSmoothness1Animated ("Invert Smoothness", Int) = 0
        [ToggleUILeft]_SpecularMask1Animated ("Specular Mask", Int) = 0
        [ToggleUILeft]_SpecularMask1PanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularMask1UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SmoothnessFrom1Animated ("Smoothness From", Int) = 0
        [ToggleUILeft]_SpecWhatTangent1Animated ("(Bi)Tangent?", Int) = 0
        [ToggleUILeft]_AnisoSpec1Alpha1Animated ("Spec1 Alpha", Int) = 0
        [ToggleUILeft]_AnisoSpec2Alpha1Animated ("Spec2 Alpha", Int) = 0
        [ToggleUILeft]_Spec1Offset1Animated ("Spec1 Offset", Int) = 0
        [ToggleUILeft]_Spec2Smoothness1Animated ("Spec2 Smoothness", Int) = 0
        [ToggleUILeft]_AnisoUseTangentMap1Animated ("Use Directional Map?", Int) = 0
        [ToggleUILeft]_AnisoTangentMap1Animated ("Anisotropic Directional Map", Int) = 0
        [ToggleUILeft]_AnisoTangentMap1PanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_AnisoTangentMap1UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularToonStart1Animated ("Spec Toon Start", Int) = 0
        [ToggleUILeft]_SpecularToonEnd1Animated ("Spec Toon End", Int) = 0
        //[ToggleUI]_CenterOutSpecColor1Animated ("Center Out SpecMap", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMirrored1Animated ("Mirrored?", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicro1Animated ("Micro Shift", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicroMultiplier1Animated ("Micro Multiplier", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicro1PanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMicro1UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacro1Animated ("Macro Shift", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacroMultiplier1Animated ("Macro Multiplier", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacro1PanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_SpecularAnisoJitterMacro1UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_SpecularToonInnerOuter1Animated ("Inner/Outer Edge", Int) = 0
        
        // Outline Options
        [Header(Outline)]
        [ToggleUILeft]_OutlineModeAnimated ("Mode", Int) = 0
        [ToggleUILeft]_OutlineFixedSizeAnimated ("Fixed Size?", Int) = 0
        [ToggleUILeft]_OutlineUseVertexColorsAnimated ("V Color as Normal", Int) = 0
        [ToggleUILeft]_OutlineLitAnimated ("Enable Lighting", Int) = 0
        [ToggleUILeft]_LineWidthAnimated ("Width", Int) = 0
        [ToggleUILeft]_LineColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_OutlineTintMixAnimated ("Tint Mix", Int) = 0
        [ToggleUILeft]_OutlineEmissionAnimated ("Outline Emission", Int) = 0
        [ToggleUILeft]_OutlineTextureAnimated ("Outline Texture", Int) = 0
        [ToggleUILeft]_OutlineMaskAnimated ("Outline Mask", Int) = 0
        [ToggleUILeft]_OutlineTexturePanAnimated ("Outline Texture Pan", Int) = 0
        [ToggleUILeft]_OutlineShadowStrengthAnimated ("Shadow Strength", Int) = 0
        [ToggleUILeft]_OutlineRimLightBlendAnimated ("Rim Light Blend", Int) = 0
        [ToggleUILeft]_OutlinePersonaDirectionAnimated ("directional Offset XY", Int) = 0
        [ToggleUILeft]_OutlineDropShadowOffsetAnimated ("Drop Direction XY", Int) = 0
        [ToggleUILeft]_OutlineFadeDistanceAnimated ("Outline distance Fade", Int) = 0
        [ToggleUILeft]_OutlineCullAnimated ("Cull", Int) = 0
        
        // First Emission
        [Header(Emission)]
        [ToggleUILeft]_EnableEmissionAnimated ("Enable Emission", Int) = 0
        [ToggleUILeft]_EmissionReplaceAnimated ("Replace Base Color", Int) = 0
        [ToggleUILeft]_EmissionColorAnimated ("Emission Color", Int) = 0
        [ToggleUILeft]_EmissionMapAnimated ("Emission Map", Int) = 0
        [ToggleUILeft]_EmissionBaseColorAsMapAnimated ("Base Color as Map?", Int) = 0
        [ToggleUILeft]_EmissionMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_EmissionMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_EmissionMaskAnimated ("Emission Mask", Int) = 0
        [ToggleUILeft]_EmissionMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_EmissionMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_EmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_EmissionHueShiftEnabledAnimated ("Enable Hue Shift", Int) = 0
        [ToggleUILeft]_EmissionHueShiftAnimated ("Hue Shift", Int) = 0
        
        // Center out emission
        [Header(Center Out Emission)]
        [ToggleUILeft]_EmissionCenterOutEnabledAnimated ("Enable Center Out", Int) = 0
        [ToggleUILeft]_EmissionCenterOutSpeedAnimated ("Flow Speed", Int) = 0
        
        // Glow in the dark Emission
        [Header(Glow In The Dark Emission)]
        [ToggleUILeft]_EnableGITDEmissionAnimated ("Enable Glow In The Dark", Int) = 0
        [ToggleUILeft]_GITDEWorldOrMeshAnimated ("Lighting Type", Int) = 0
        [ToggleUILeft]_GITDEMinEmissionMultiplierAnimated ("Min Emission Multiplier", Int) = 0
        [ToggleUILeft]_GITDEMaxEmissionMultiplierAnimated ("Max Emission Multiplier", Int) = 0
        [ToggleUILeft]_GITDEMinLightAnimated ("Min Lighting", Int) = 0
        [ToggleUILeft]_GITDEMaxLightAnimated ("Max Lighting", Int) = 0
        
        // Blinking Emission
        [Header(Blinking Emission)]
        [ToggleUILeft]_EmissionBlinkingEnabledAnimated ("Blinking Enabled", Int) = 0
        [ToggleUILeft]_EmissiveBlink_MinAnimated ("Emissive Blink Min", Int) = 0
        [ToggleUILeft]_EmissiveBlink_MaxAnimated ("Emissive Blink Max", Int) = 0
        [ToggleUILeft]_EmissiveBlink_VelocityAnimated ("Emissive Blink Velocity", Int) = 0
        [ToggleUILeft]_EmissionBlinkingOffsetAnimated ("Offset", Int) = 0
        
        // Scrolling Emission
        [Header(Scrolling Emission)]
        [ToggleUILeft]_ScrollingEmissionAnimated ("Enable Scrolling Emission", Int) = 0
        [ToggleUILeft]_EmissionScrollingUseCurveAnimated ("Use Curve", Int) = 0
        [ToggleUILeft]_EmissionScrollingCurveAnimated ("Curve", Int) = 0
        [ToggleUILeft]_EmissiveScroll_DirectionAnimated ("Direction", Int) = 0
        [ToggleUILeft]_EmissiveScroll_WidthAnimated ("Width", Int) = 0
        [ToggleUILeft]_EmissiveScroll_VelocityAnimated ("Velocity", Int) = 0
        [ToggleUILeft]_EmissiveScroll_IntervalAnimated ("Interval", Int) = 0
        [ToggleUILeft]_EmissionScrollingOffsetAnimated ("Offset", Int) = 0
        
        // Second Enission
        [Header(Second Emission)]
        [ToggleUILeft]_EnableEmission1Animated ("Enable Emission 2", Int) = 0
        [ToggleUILeft]_EmissionColor1Animated ("Emission Color", Int) = 0
        [ToggleUILeft]_EmissionMap1Animated ("Emission Map", Int) = 0
        [ToggleUILeft]_EmissionBaseColorAsMap1Animated ("Base Color as Map?", Int) = 0
        [ToggleUILeft]_EmissionMap1PanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_EmissionMap1UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_EmissionMask1Animated ("Emission Mask", Int) = 0
        [ToggleUILeft]_EmissionMask1PanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_EmissionMask1UVAnimated ("UV", Int) = 0
        [ToggleUILeft]_EmissionStrength1Animated ("Emission Strength", Int) = 0
        [ToggleUILeft]_EmissionHueShiftEnabled1Animated ("Enable Hue Shift", Int) = 0
        [ToggleUILeft]_EmissionHueShift1Animated ("Hue Shift", Int) = 0
        
        // Second Center Out Enission
        [Header(Second Center Out Emission)]
        [ToggleUILeft]_EmissionCenterOutEnabled1Animated ("Enable Center Out", Int) = 0
        [ToggleUILeft]_EmissionCenterOutSpeed1Animated ("Flow Speed", Int) = 0
        
        // Second Glow In The Dark Emission
        [Header(Second Glow In The Dark Emission)]
        [ToggleUILeft]_EnableGITDEmission1Animated ("Enable Glow In The Dark", Int) = 0
        [ToggleUILeft]_GITDEWorldOrMesh1Animated ("Lighting Type", Int) = 0
        [ToggleUILeft]_GITDEMinEmissionMultiplier1Animated ("Min Emission Multiplier", Int) = 0
        [ToggleUILeft]_GITDEMaxEmissionMultiplier1Animated ("Max Emission Multiplier", Int) = 0
        [ToggleUILeft]_GITDEMinLight1Animated ("Min Lighting", Int) = 0
        [ToggleUILeft]_GITDEMaxLight1Animated ("Max Lighting", Int) = 0
        
        // Second Blinking Emission
        [Header(Second Blinking Emission)]
        [ToggleUILeft]_EmissionBlinkingEnabledAnimated ("Blinking Enabled", Int) = 0
        [ToggleUILeft]_EmissiveBlink_Min1Animated ("Emissive Blink Min", Int) = 0
        [ToggleUILeft]_EmissiveBlink_Max1Animated ("Emissive Blink Max", Int) = 0
        [ToggleUILeft]_EmissiveBlink_Velocity1Animated ("Emissive Blink Velocity", Int) = 0
        [ToggleUILeft]_EmissionBlinkingOffset1Animated ("Offset", Int) = 0
        
        // Scrolling Scrolling Emission
        [Header(Second Scrolling Emission)]
        [ToggleUILeft]_ScrollingEmission1Animated ("Enable Scrolling Emission", Int) = 0
        [ToggleUILeft]_EmissionScrollingUseCurve1Animated ("Use Curve", Int) = 0
        [ToggleUILeft]_EmissionScrollingCurve1Animated ("Curve", Int) = 0
        [ToggleUILeft]_EmissiveScroll_Direction1Animated ("Direction", Int) = 0
        [ToggleUILeft]_EmissiveScroll_Width1Animated ("Width", Int) = 0
        [ToggleUILeft]_EmissiveScroll_Velocity1Animated ("Velocity", Int) = 0
        [ToggleUILeft]_EmissiveScroll_Interval1Animated ("Interval", Int) = 0
        [ToggleUILeft]_EmissionScrollingOffset1Animated ("Offset", Int) = 0
        
        // Flipbook
        [Header(Flipbook)]
        [ToggleUILeft]_EnableFlipbookAnimated ("Enable Flipbook", Int) = 0
        [ToggleUILeft]_FlipbookAlphaControlsFinalAlphaAnimated ("Flipbook Controls Alpha?", Int) = 0
        [ToggleUILeft]_FlipbookIntensityControlsAlphaAnimated ("Intensity Controls Alpha?", Int) = 0
        [ToggleUILeft]_FlipbookColorReplacesAnimated ("Color Replaces Flipbook", Int) = 0
        [ToggleUILeft]_FlipbookTexArrayAnimated ("Texture Array", Int) = 0
        [ToggleUILeft]_FlipbookTexArrayUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_FlipbookTexArrayPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_FlipbookMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_FlipbookMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_FlipbookMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_FlipbookColorAnimated ("Color & alpha", Int) = 0
        [ToggleUILeft]_FlipbookTotalFramesAnimated ("Total Frames", Int) = 0
        [ToggleUILeft]_FlipbookFPSAnimated ("FPS", Int) = 0
        [ToggleUILeft]_FlipbookScaleOffsetAnimated ("Scale | Offset", Int) = 0
        [ToggleUILeft]_FlipbookTiledAnimated ("Tiled?", Int) = 0
        [ToggleUILeft]_FlipbookEmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_FlipbookRotationAnimated ("Rotation", Int) = 0
        [ToggleUILeft]_FlipbookRotationSpeedAnimated ("Rotation Speed", Int) = 0
        [ToggleUILeft]_FlipbookReplaceAnimated ("Replace", Int) = 0
        [ToggleUILeft]_FlipbookMultiplyAnimated ("Multiply", Int) = 0
        [ToggleUILeft]_FlipbookAddAnimated ("Add", Int) = 0
        [ToggleUILeft]_FlipbookCurrentFrameAnimated ("Current Frame", Int) = 0
        
        // Dissolve
        [Header(Dissolve)]
        [ToggleUILeft]_EnableDissolveAnimated ("Enable Dissolve", Int) = 0
        [ToggleUILeft]_DissolveTypeAnimated ("Dissolve Type", Int) = 0
        [ToggleUILeft]_DissolveEdgeWidthAnimated ("Edge Width", Int) = 0
        [ToggleUILeft]_DissolveEdgeHardnessAnimated ("Edge Hardness", Int) = 0
        [ToggleUILeft]_DissolveEdgeColorAnimated ("Edge Color", Int) = 0
        [ToggleUILeft]_DissolveEdgeGradientAnimated ("Edge Gradient", Int) = 0
        [ToggleUILeft]_DissolveEdgeEmissionAnimated ("Edge Emission", Int) = 0
        [ToggleUILeft]_DissolveTextureColorAnimated ("Dissolved Color", Int) = 0
        [ToggleUILeft]_DissolveToTextureAnimated ("Dissolved Texture", Int) = 0
        [ToggleUILeft]_DissolveToTexturePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DissolveToTextureUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DissolveToEmissionStrengthAnimated ("Dissolved Emission Strength", Int) = 0
        [ToggleUILeft]_DissolveNoiseTextureAnimated ("Dissolve Noise", Int) = 0
        [ToggleUILeft]_DissolveNoiseTexturePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DissolveNoiseTextureUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DissolveInvertNoiseAnimated ("Invert?", Int) = 0
        [ToggleUILeft]_DissolveDetailNoiseAnimated ("Dissolve Detail Noise", Int) = 0
        [ToggleUILeft]_DissolveDetailNoisePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DissolveDetailNoiseUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DissolveInvertDetailNoiseAnimated ("Invert?", Int) = 0
        [ToggleUILeft]_DissolveDetailStrengthAnimated ("Dissolve Detail Strength", Int) = 0
        [ToggleUILeft]_DissolveAlphaAnimated ("Dissolve Alpha", Int) = 0
        [ToggleUILeft]_DissolveMaskAnimated ("Dissolve Mask", Int) = 0
        [ToggleUILeft]_DissolveMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_DissolveMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_DissolveMaskInvertAnimated ("Invert?", Int) = 0
        [ToggleUILeft]_ContinuousDissolveAnimated ("Continuous Dissolve Speed", Int) = 0
        [ToggleUILeft]_DissolveEmissionSideAnimated ("Emission 1", Int) = 0
        [ToggleUILeft]_DissolveEmission1SideAnimated ("Emission 2", Int) = 0
        
        // Point to Point Dissolve
        [Header(Point to Point Dissolve)]
        [ToggleUILeft]_DissolveP2PWorldLocalAnimated ("World/Local", Int) = 0
        [ToggleUILeft]_DissolveP2PEdgeLengthAnimated ("Edge Length", Int) = 0
        [ToggleUILeft]_DissolveStartPointAnimated ("Start Point", Int) = 0
        [ToggleUILeft]_DissolveEndPointAnimated ("End Point", Int) = 0
        
        // Panosphere
        [Header(Panosphere)]
        [ToggleUILeft]_PanoToggleAnimated ("Enable Panosphere", Int) = 0
        [ToggleUILeft]_PanoInfiniteStereoToggleAnimated ("Infinite Stereo", Int) = 0
        [ToggleUILeft]_PanosphereColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_PanosphereTextureAnimated ("Texture", Int) = 0
        [ToggleUILeft]_PanoMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_PanoMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_PanoMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_PanoEmissionAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_PanoBlendAnimated ("Alpha", Int) = 0
        [ToggleUILeft]_PanospherePanAnimated ("Pan Speed", Int) = 0
        [ToggleUILeft]_PanoCubeMapToggleAnimated ("Use Cubemap", Int) = 0
        [ToggleUILeft]_PanoCubeMapAnimated ("CubeMap", Int) = 0
        
        // Glitter
        [Header(Glitter)]
        [ToggleUILeft]_GlitterEnableAnimated ("Enable Glitter?", Int) = 0
        //[Enum(Add, 0, Replace, 1)] [ToggleUILeft]_GlitterBlendTypeAnimated ("Blend Type", Int) = 0
        [ToggleUILeft]_GlitterColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_GlitterUseSurfaceColorAnimated ("Use Surface Color", Int) = 0
        [ToggleUILeft]_GlitterColorMapAnimated ("Glitter Color Map", Int) = 0
        [ToggleUILeft]_GlitterColorMapPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_GlitterColorMapUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_GlitterPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_GlitterMaskAnimated ("Glitter Mask", Int) = 0
        [ToggleUILeft]_GlitterMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_GlitterMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_GlitterFrequencyAnimated ("Glitter Density", Int) = 0
        [ToggleUILeft]_GlitterJitterAnimated ("Glitter Jitter", Int) = 0
        [ToggleUILeft]_GlitterSpeedAnimated ("Glitter Wobble Speed", Int) = 0
        [ToggleUILeft]_GlitterSizeAnimated ("Glitter Size", Int) = 0
        [ToggleUILeft]_GlitterContrastAnimated ("Glitter Contrast", Int) = 0
        [ToggleUILeft]_GlitterAngleRangeAnimated ("Glitter Angle Range", Int) = 0
        [ToggleUILeft]_GlitterMinBrightnessAnimated ("Glitter Min Brightness", Int) = 0
        [ToggleUILeft]_GlitterBrightnessAnimated ("Glitter Max Brightness", Int) = 0
        [ToggleUILeft]_GlitterBiasAnimated ("Glitter Bias", Int) = 0
        
        // Glitter Random Colors
        [Header(Glitter Random Colors)]
        [ToggleUILeft]_GlitterRandomColorsAnimated ("Enable", Int) = 0
        [ToggleUILeft]_GlitterMinMaxSaturationAnimated ("Saturation Range", Int) = 0
        [ToggleUILeft]_GlitterMinMaxBrightnessAnimated ("Brightness Range", Int) = 0
        
        // MSDF OVERLAY
        [Header(MSDF Overlay)]
        [ToggleUILeft]_TextGlyphsAnimated ("Font Array", Int) = 0
        [ToggleUILeft]_TextPixelRangeAnimated ("Pixel Range", Int) = 0
        [ToggleUILeft]_TextEnabledAnimated ("Text?", Int) = 0
        
        // FPS
        [Header(FPS Text)]
        [ToggleUILeft]_TextFPSEnabledAnimated ("FPS Text?", Int) = 0
        [ToggleUILeft]_TextFPSUVAnimated ("FPS UV", Int) = 0
        [ToggleUILeft]_TextFPSColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_TextFPSEmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_TextFPSOffsetAnimated ("Offset", Int) = 0
        [ToggleUILeft]_TextFPSRotationAnimated ("Rotation", Int) = 0
        [ToggleUILeft]_TextFPSScaleAnimated ("Scale", Int) = 0
        [ToggleUILeft]_TextFPSPaddingAnimated ("Padding Reduction", Int) = 0
        
        // POSITION
        [Header(Position Text)]
        [ToggleUILeft]_TextPositionEnabledAnimated ("Position Text?", Int) = 0
        [ToggleUILeft]_TextPositionUVAnimated ("Position UV", Int) = 0
        //[ToggleUI]_TextPositionVerticalAnimated ("Vertical?", Int) = 0
        [ToggleUILeft]_TextPositionColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_TextPositionEmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_TextPositionOffsetAnimated ("Offset", Int) = 0
        [ToggleUILeft]_TextPositionRotationAnimated ("Rotation", Int) = 0
        [ToggleUILeft]_TextPositionScaleAnimated ("Scale", Int) = 0
        [ToggleUILeft]_TextPositionPaddingAnimated ("Padding Reduction", Int) = 0
        
        // INSTANCE TIME
        [Header(Instance Time Text)]
        [ToggleUILeft]_TextTimeEnabledAnimated ("Time Text?", Int) = 0
        [ToggleUILeft]_TextTimeUVAnimated ("Time UV", Int) = 0
        [ToggleUILeft]_TextTimeColorAnimated ("Color", Int) = 0
        [ToggleUILeft]_TextTimeEmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_TextTimeOffsetAnimated ("Offset", Int) = 0
        [ToggleUILeft]_TextTimeRotationAnimated ("Rotation", Int) = 0
        [ToggleUILeft]_TextTimeScaleAnimated ("Scale", Int) = 0
        [ToggleUILeft]_TextTimePaddingAnimated ("Padding Reduction", Int) = 0
        
        // Mirror Rendering
        [Header(Mirror Rendering)]
        [ToggleUILeft]_EnableMirrorOptionsAnimated ("Enable Mirror Options", Int) = 0
        [ToggleUILeft]_MirrorAnimated ("Show in mirror", Int) = 0
        [ToggleUILeft]_EnableMirrorTextureAnimated ("Enable Mirror Texture", Int) = 0
        [ToggleUILeft]_MirrorTextureAnimated ("Mirror Tex", Int) = 0
        [ToggleUILeft]_MirrorTexturePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_MirrorTextureUVAnimated ("UV", Int) = 0
        
        // Distance Fade
        [Header(Distance Fade)]
        [ToggleUILeft]_MainMinAlphaAnimated ("Minimum Alpha", Int) = 0
        [ToggleUILeft]_MainFadeTextureAnimated ("Fade Mask", Int) = 0
        [ToggleUILeft]_MainFadeTexturePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_MainFadeTextureUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_MainDistanceFadeAnimated ("Distance Fade X to Y", Int) = 0
        
        // Angular Fade
        [Header(Angular Fade)]
        [ToggleUILeft]_EnableRandomAnimated ("Enable Angular Fade", Int) = 0
        [ToggleUILeft]_AngleTypeAnimated ("Angle Type", Int) = 0
        [ToggleUILeft]_AngleCompareToAnimated ("Model or Vert Positon", Int) = 0
        [ToggleUILeft]_AngleForwardDirectionAnimated ("Forward Direction", Int) = 0
        [ToggleUILeft]_CameraAngleMinAnimated ("Camera Angle Min", Int) = 0
        [ToggleUILeft]_CameraAngleMaxAnimated ("Camera Angle Max", Int) = 0
        [ToggleUILeft]_ModelAngleMinAnimated ("Model Angle Min", Int) = 0
        [ToggleUILeft]_ModelAngleMaxAnimated ("Model Angle Max", Int) = 0
        [ToggleUILeft]_AngleMinAlphaAnimated ("Min Alpha", Int) = 0
        
        // UV Distortion
        [Header(UV Distortion)]
        [ToggleUILeft]_EnableDistortionAnimated ("Enabled?", Int) = 0
        [ToggleUILeft]_DistortionFlowTextureAnimated ("Distortion Texture 1", Int) = 0
        [ToggleUILeft]_DistortionFlowTexture1Animated ("Distortion Texture 2", Int) = 0
        [ToggleUILeft]_DistortionStrengthAnimated ("Strength1", Int) = 0
        [ToggleUILeft]_DistortionStrength1Animated ("Strength2", Int) = 0
        [ToggleUILeft]_DistortionSpeedAnimated ("Speed1", Int) = 0
        [ToggleUILeft]_DistortionSpeed1Animated ("Speed2", Int) = 0
        
        // Video Options
        [Header(Video Options)]
        [ToggleUILeft]_EnableVideoAnimated ("Enable Video", Int) = 0
        [ToggleUILeft]_VideoUVNumberAnimated ("Screen UV#", Int) = 0
        [ToggleUILeft]_VideoTypeAnimated ("Screen Type", Int) = 0
        [ToggleUILeft]_VideoBacklightAnimated ("Brightness", Int) = 0
        [ToggleUILeft]_VideoPixelTextureAnimated ("Pixel Texture", Int) = 0
        [ToggleUILeft]_VideoResolutionAnimated ("Resolution", Int) = 0
        [ToggleUILeft]_VideoMaskTextureAnimated ("Mask", Int) = 0
        [ToggleUILeft]_VideoMaskPanningAnimated ("Mask Pan Speed", Int) = 0
        [ToggleUILeft]_VideoEnableVideoPlayerAnimated ("Enable Video Player", Int) = 0
        [ToggleUILeft]_VideoPixelateToResolutionAnimated ("Pixelate To Resolution", Int) = 0
        [ToggleUILeft]_VideoRepeatVideoTextureAnimated ("Clamp To UV", Int) = 0
        [ToggleUILeft]_VideoPanningAnimated ("Panning Speed", Int) = 0
        [ToggleUILeft]_VideoTilingAnimated ("Tiling", Int) = 0
        [ToggleUILeft]_VideoOffsetAnimated ("Offset", Int) = 0
        [ToggleUILeft]_VideoSaturationAnimated ("Saturation", Int) = 0
        [ToggleUILeft]_VideoContrastAnimated ("Contrast boost", Int) = 0
        [ToggleUILeft]_VideoEnableDebugAnimated ("Enable Debug", Int) = 0
        [ToggleUILeft]_VideoDebugTextureAnimated ("Video Debug Tex", Int) = 0
        [ToggleUILeft]_VideoCRTRefreshRateAnimated ("Refresh Rate", Int) = 0
        [ToggleUILeft]_VideoCRTPixelEnergizedTimeAnimated ("Pixel Fade Time", Int) = 0
        [ToggleUILeft]_VideoGameboyRampAnimated ("Color Ramp", Int) = 0
        
        // TouchFX
        [Header(Touch FX)]
        [ToggleUILeft]_EnableBulgeAnimated ("Bulge", Int) = 0
        [ToggleUILeft]_BulgeMaskAnimated ("Bulge Mask", Int) = 0
        [ToggleUILeft]_BuldgeFadeLengthAnimated ("Touch Distance", Int) = 0
        [ToggleUILeft]_BuldgeHeightAnimated ("Bulge Height", Int) = 0
        [ToggleUILeft]_EnableTouchGlowAnimated ("Enable Touch Glow", Int) = 0
        [ToggleUILeft]_DepthGlowColorAnimated ("Depth Glow Color", Int) = 0
        [ToggleUILeft]_DepthGradientAnimated ("Depth Gradient", Int) = 0
        [ToggleUILeft]_DepthMaskAnimated ("Depth Mask", Int) = 0
        [ToggleUILeft]_DepthGlowEmissionAnimated ("Depth Glow Emission", Int) = 0
        [ToggleUILeft]_FadeLengthAnimated ("Fade Length", Int) = 0
        [ToggleUILeft]_DepthAlphaMinAnimated ("Alpha Min", Int) = 0
        [ToggleUILeft]_DepthAlphaMaxAnimated ("Alpha Max", Int) = 0
        
        // Hologram
        [Header(Hologram)]
        [ToggleUILeft]_EnableHoloAnimated ("Enable Hologram Alpha", Int) = 0
        [ToggleUILeft]_HoloAlphaMapAnimated ("Alpha Map", Int) = 0
        [ToggleUILeft]_HoloCoordinateSpaceAnimated ("Coordinate Space", Int) = 0
        [ToggleUILeft]_HoloDirectionAnimated ("Scroll Direction", Int) = 0
        [ToggleUILeft]_HoloLineDensityAnimated ("Line Density", Int) = 0
        [ToggleUILeft]_HoloScrollSpeedAnimated ("Scroll Speed", Int) = 0
        [ToggleUILeft]_HoloFresnelAlphaAnimated ("Intensity", Int) = 0
        [ToggleUILeft]_HoloRimSharpnessAnimated ("Sharpness", Int) = 0
        [ToggleUILeft]_HoloRimWidthAnimated ("Width", Int) = 0

        // GrabPass
        [Header(Grab Pass)]
        [ToggleUILeft]_GrabSrcBlendAnimated ("Source Blend", Int) = 0
        [ToggleUILeft]_GrabDstBlendAnimated ("Destination Blend", Int) = 0
        [ToggleUILeft]_RefractionEnabledAnimated ("Enable Refraction,", Int) = 0
        [ToggleUILeft]_RefractionIndexAnimated ("Refraction", Int) = 0
        [ToggleUILeft]_RefractionChromaticAberattionAnimated ("Chromatic Aberration", Int) = 0
        [ToggleUILeft]_EnableBlurAnimated ("Enable Blur", Int) = 0
        [ToggleUILeft]_GrabBlurDistanceAnimated ("Blur Distance", Int) = 0
        
        // Iridescence
        [Header(Iridescence)]
        [ToggleUILeft]_EnableIridescenceAnimated ("Enable Iridescence", Int) = 0
        [ToggleUILeft]_IridescenceRampAnimated ("Ramp", Int) = 0
        [ToggleUILeft]_IridescenceNormalToggleAnimated ("Custom Normals?", Int) = 0
        [ToggleUILeft]_IridescenceNormalMapAnimated ("Normal Map", Int) = 0
        [ToggleUILeft]_IridescenceMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_IridescenceNormalIntensityAnimated ("Normal Intensity", Int) = 0
        [ToggleUILeft]_IridescenceNormalUVAnimated ("Normal UV", Int) = 0
        [ToggleUILeft]_IridescenceMaskUVAnimated ("Mask UV", Int) = 0
        [ToggleUILeft]_IridescenceNormalSelectionAnimated ("Normal Select", Int) = 0
        [ToggleUILeft]_IridescenceIntensityAnimated ("Intensity", Int) = 0
        [ToggleUILeft]_IridescenceAddBlendAnimated ("Blend Add", Int) = 0
        [ToggleUILeft]_IridescenceReplaceBlendAnimated ("Blend Replace", Int) = 0
        [ToggleUILeft]_IridescenceMultiplyBlendAnimated ("Blend Multiply", Int) = 0
        [ToggleUILeft]_IridescenceEmissionStrengthAnimated ("Emission Strength", Int) = 0
        [ToggleUILeft]_IridescenceTimeAnimated ("When To Run", Int) = 0
        
        // Vertex Glitching
        [Header(Vertex Glitching)]
        [ToggleUILeft]_EnableVertexGlitchAnimated ("Enable Vertex Glitching", Int) = 0
        [ToggleUILeft]_VertexGlitchFrequencyAnimated ("Glitch Interval", Int) = 0
        [ToggleUILeft]_VertexGlitchThresholdAnimated ("Glitch Threshold", Int) = 0
        [ToggleUILeft]_VertexGlitchStrengthAnimated ("Glitch Strength", Int) = 0
        
        // Spawn In Effects
        [Header(Spawn In Effects)]
        [ToggleUILeft]_EnableScifiSpawnInAnimated ("Enable Sci Fi Spawn", Int) = 0
        [ToggleUILeft]_SpawnInNoiseAnimated ("Spawn Noise", Int) = 0
        [ToggleUILeft]_SpawnInNoiseIntensityAnimated ("Noise Intensity", Int) = 0
        [ToggleUILeft]_SpawnInAlphaAnimated ("Spawn Alpha", Int) = 0
        [ToggleUILeft]_SpawnInGradientStartAnimated ("Gradient Start", Int) = 0
        [ToggleUILeft]_SpawnInGradientFinishAnimated ("Gradient End", Int) = 0
        [ToggleUILeft]_SpawnInEmissionColorAnimated ("Emission Color", Int) = 0
        [ToggleUILeft]_SpawnInEmissionOffsetAnimated ("Emission Width", Int) = 0
        [ToggleUILeft]_SpawnInVertOffsetAnimated ("Vertex Offset Speed", Int) = 0
        [ToggleUILeft]_SpawnInVertOffsetOffsetAnimated ("vert width", Int) = 0
        
        // Voronoi
        [Header(Voronoi)]
        [ToggleUILeft]_VoronoiTypeAnimated ("Space", Int) = 0
        [ToggleUILeft]_VoronoiSpaceAnimated ("Space", Int) = 0
        [ToggleUILeft]_VoronoiBlendAnimated ("Blend", Int) = 0
        [ToggleUILeft]_EnableVoronoiAnimated ("Enable Voronoi", Int) = 0
        [ToggleUILeft]_VoronoiMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_VoronoiMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_VoronoiMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_VoronoiNoiseAnimated ("Edge Noise", Int) = 0
        [ToggleUILeft]_VoronoiNoisePanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_VoronoiNoiseUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_VoronoiNoiseIntensityAnimated ("Noise Intensity", Int) = 0
        [ToggleUILeft]_VoronoiColor0Animated ("Color 0", Int) = 0
        [ToggleUILeft]_VoronoiEmission0Animated ("Emission 0", Int) = 0
        [ToggleUILeft]_VoronoiColor1Animated ("Color 1", Int) = 0
        [ToggleUILeft]_VoronoiEmission1Animated ("Emission 1", Int) = 0
        [ToggleUILeft]_VoronoiGradientAnimated ("Gradient", Int) = 0
        [ToggleUILeft]_VoronoiScaleAnimated ("Scale", Int) = 0
        [ToggleUILeft]_VoronoiSpeedAnimated ("Speed", Int) = 0
        [ToggleUILeft]_VoronoiEnableRandomCellColorAnimated ("Rando Cell Col", Int) = 0
        [ToggleUILeft]_VoronoiRandomMinMaxSaturationAnimated ("Saturation Range", Int) = 0
        [ToggleUILeft]_VoronoiRandomMinMaxBrightnessAnimated ("Brightness Range", Int) = 0
        
        // Blacklight mask
        [Header(Blacklight Mask)]
        [ToggleUILeft]_BlackLightMaskEnabledAnimated ("Black Light Mask Enabled", Int) = 0
        [ToggleUILeft]_BlackLightMaskKeysAnimated ("Mask Keys", Int) = 0
        [ToggleUILeft]_BlackLightMaskStartAnimated ("Gradient Start", Int) = 0
        [ToggleUILeft]_BlackLightMaskEndAnimated ("Gradient End", Int) = 0
        [ToggleUILeft]_BlackLightMaskDebugAnimated ("Visualize", Int) = 0
        [ToggleUILeft]_BlackLightMaskMetallicAnimated ("Metallic", Int) = 0
        [ToggleUILeft]_BlackLightMaskClearCoatAnimated ("Clear Coat", Int) = 0
        [ToggleUILeft]_BlackLightMaskMatcapAnimated ("Matcap 1", Int) = 0
        [ToggleUILeft]_BlackLightMaskMatcap2Animated ("Matcap 2", Int) = 0
        [ToggleUILeft]_BlackLightMaskEmissionAnimated ("Emission 1", Int) = 0
        [ToggleUILeft]_BlackLightMaskEmission2Animated ("Emission 2", Int) = 0
        [ToggleUILeft]_BlackLightMaskFlipbookAnimated ("Flipbook", Int) = 0
        [ToggleUILeft]_BlackLightMaskDissolveAnimated ("Dissolve", Int) = 0
        [ToggleUILeft]_BlackLightMaskPanosphereAnimated ("Panosphere", Int) = 0
        [ToggleUILeft]_BlackLightMaskGlitterAnimated ("Glitter", Int) = 0
        [ToggleUILeft]_BlackLightMaskIridescenceAnimated ("Iridescence", Int) = 0
        
        // Parallax Mapping
        [Header(Parallax)]
        [ToggleUILeft]_ParallaxMapAnimated ("Enable Parallax FX", Int) = 0
        [ToggleUILeft]_ParallaxHeightMapEnabledAnimated ("Enable Parallax Height", Int) = 0
        [ToggleUILeft]_ParallaxInternalMapEnabledAnimated ("Enable Parallax Internal", Int) = 0
        [ToggleUILeft]_ParallaxHeightMapPanAnimated ("Pan", Int) = 0
        [ToggleUILeft]_ParallaxUVAnimated ("Parallax UV", Int) = 0
        [ToggleUILeft]_ParallaxHeightMapAnimated ("Height Map", Int) = 0
        [ToggleUILeft]_ParallaxHeightMapMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_ParallaxHeightMapMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_ParallaxHeightMapMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_ParallaxStrengthAnimated ("Parallax Strength", Int) = 0
        [ToggleUILeft]_ParallaxInternalHeightmapModeAnimated ("Parallax Mode", Int) = 0
        [ToggleUILeft]_ParallaxInternalHeightFromAlphaAnimated ("HeightFromAlpha", Int) = 0
        [ToggleUILeft]_ParallaxInternalMapAnimated ("Internal Map", Int) = 0
        [ToggleUILeft]_ParallaxInternalMapMaskAnimated ("Mask", Int) = 0
        [ToggleUILeft]_ParallaxInternalMapMaskPanAnimated ("Panning", Int) = 0
        [ToggleUILeft]_ParallaxInternalMapMaskUVAnimated ("UV", Int) = 0
        [ToggleUILeft]_ParallaxInternalIterationsAnimated ("Parallax Internal Iterations", Int) = 0
        [ToggleUILeft]_ParallaxInternalMinDepthAnimated ("Min Depth", Int) = 0
        [ToggleUILeft]_ParallaxInternalMaxDepthAnimated ("Max Depth", Int) = 0
        [ToggleUILeft]_ParallaxInternalMinFadeAnimated ("Min Depth Brightness", Int) = 0
        [ToggleUILeft]_ParallaxInternalMaxFadeAnimated ("Max Depth Brightness", Int) = 0
        [ToggleUILeft]_ParallaxInternalMinColorAnimated ("Min Depth Color", Int) = 0
        [ToggleUILeft]_ParallaxInternalMaxColorAnimated ("Max Depth Color", Int) = 0
        [ToggleUILeft]_ParallaxInternalPanSpeedAnimated ("Pan Speed", Int) = 0
        [ToggleUILeft]_ParallaxInternalPanDepthSpeedAnimated ("Per Level Speed Multiplier", Int) = 0
        [ToggleUILeft]_ParallaxBiasAnimated ("Parallax Bias (0.42)", Int) = 0
        
        // Rendering Options
        [Header(Rendering Options)]
        [ToggleUILeft]_CullAnimated ("Cull", Int) = 0
        [ToggleUILeft]_ZTestAnimated ("ZTest", Int) = 0
        [ToggleUILeft]_ZWriteAnimated ("ZWrite", Int) = 0
        [ToggleUILeft]_ColorMaskAnimated ("Color Mask", Int) = 0
        [ToggleUILeft]_OffsetFactorAnimated ("Offset Factor", Int) = 0
        [ToggleUILeft]_OffsetUnitsAnimated ("Offset Units", Int) = 0
        [ToggleUILeft]_IgnoreFogAnimated ("Ignore Fog", Int) = 0
        
        // Blending Options
        [Header(Blending Options)]
        [ToggleUILeft]_BlendOpAnimated ("RGB Blend Op", Int) = 0
        [ToggleUILeft]_BlendOpAlphaAnimated ("Alpha Blend Op", Int) = 0
        [ToggleUILeft]_SrcBlendAnimated ("RGB Source Blend", Int) = 0
        [ToggleUILeft]_DstBlendAnimated ("RGB Destination Blend", Int) = 0
        [ToggleUILeft]_SrcBlendAlphaAnimated ("Alpha Source Blend", Int) = 0
        [ToggleUILeft]_DstBlendAlphaAnimated ("Alpha Destination Blend", Int) = 0
        
        // Stencils
        [Header(Stencils)]
        [ToggleUILeft]_StencilRefAnimated ("Stencil Reference Value", Int) = 0
        [ToggleUILeft]_StencilReadMaskAnimated ("Stencil ReadMask Value", Int) = 0
        [ToggleUILeft]_StencilWriteMaskAnimated ("Stencil WriteMask Value", Int) = 0
        [ToggleUILeft]_StencilPassOpAnimated ("Stencil Pass Op", Int) = 0
        [ToggleUILeft]_StencilFailOpAnimated ("Stencil Fail Op", Int) = 0
        [ToggleUILeft]_StencilZFailOpAnimated ("Stencil ZFail Op", Int) = 0
        [ToggleUILeft]_StencilCompareFunctionAnimated ("Stencil Compare Function", Int) = 0
        
        // Outline Stencil
        [Header(Outline Stencils)]
        [ToggleUILeft]_OutlineStencilRefAnimated ("Stencil Reference Value", Int) = 0
        [ToggleUILeft]_OutlineStencilReadMaskAnimated ("Stencil ReadMask Value", Int) = 0
        [ToggleUILeft]_OutlineStencilWriteMaskAnimated ("Stencil WriteMask Value", Int) = 0
        [ToggleUILeft]_OutlineStencilPassOpAnimated ("Stencil Pass Op", Int) = 0
        [ToggleUILeft]_OutlineStencilFailOpAnimated ("Stencil Fail Op", Int) = 0
        [ToggleUILeft]_OutlineStencilZFailOpAnimated ("Stencil ZFail Op", Int) = 0
        [ToggleUILeft]_OutlineStencilCompareFunctionAnimated ("Stencil Compare Function", Int) = 0
        
        // Debug Options
        [Header(Debug Options)]
        [ToggleUILeft]_VertexUnwrapAnimated ("Unwrap", Range(0, 1)) = 0
        [ToggleUILeft]_DebugMeshDataAnimated ("Mesh Data", Int) = 0
        [ToggleUILeft]_DebugLightingDataAnimated ("Lighting Data", Int) = 0
        [ToggleUILeft]_DebugCameraDataAnimated ("Camera Data", Int) = 0
    }
    
    
    //originalEditorCustomEditor "PoiToon"
    CustomEditor "Thry.ShaderEditor"
    SubShader
    {
        Tags { "RenderType" = "Opaque" "Queue" = "Geometry+10" }
        //EnableGrabpass
        GrabPass
        {
            "_PoiGrab"
        }
        
        //EnableGrabpass
        Pass
        {
            Name "MainPass"
            Tags { "LightMode" = "ForwardBase" }
            
            Stencil
            {
                Ref [_StencilRef]
                ReadMask [_StencilReadMask]
                WriteMask [_StencilWriteMask]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            
            ZWrite [_ZWrite]
            Cull [_Cull]
            ZTest [_ZTest]
            ColorMask [_ColorMask]
            Offset [_OffsetFactor], [_OffsetUnits]
            
            BlendOp [_BlendOp], [_BlendOpAlpha]
            Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
            
            CGPROGRAM
            
            #pragma target 5.0
            #define FORWARD_BASE_PASS
            float _Mode;
            // Base Pass Features
            // Decal
            #pragma shader_feature GEOM_TYPE_BRANCH
            #pragma multi_compile _ VERTEXLIGHT_ON
            // patreon Base
            // Black Light Mask
            #pragma shader_feature _SPECULARHIGHLIGHTS_OFF
            // voronoi
            #pragma shader_feature CHROMATIC_ABERRATION
            // UV Distortion
            #pragma shader_feature USER_LUT
            // Bulge
            #pragma shader_feature BLOOM_LOW
            // Hologram Alpha
            #pragma shader_feature DEPTH_OF_FIELD
            //Video
            #pragma shader_feature BLOOM
            #pragma shader_feature _PARALLAXMAP
            // Mirror
            #pragma shader_feature _REQUIRE_UV2
            // Random
            #pragma shader_feature _SUNDISK_NONE
            // Dissolve
            #pragma shader_feature DISTORT
            // Panosphere
            #pragma shader_feature _DETAIL_MULX2
            // Touch Color
            #pragma shader_feature GRAIN
            // Lighting
            #pragma shader_feature LOD_FADE_CROSSFADE
            // Flipbook
            #pragma shader_feature _SUNDISK_HIGH_QUALITY
            // Rim Lighting
            #pragma shader_feature _GLOSSYREFLECTIONS_OFF
            // Enviro Rim
            #pragma shader_feature _MAPPING_6_FRAMES_LAYOUT
            // Metal
            #pragma shader_feature _METALLICGLOSSMAP
            // Iridescence
            #pragma shader_feature BLOOM_LENS_DIRT
            // Matcap
            #pragma shader_feature _COLORADDSUBDIFF_ON
            // Specular
            #pragma shader_feature _SPECGLOSSMAP
            // SubSurface
            #pragma shader_feature _TERRAIN_NORMAL_MAP
            // Debug
            #pragma shader_feature _COLOROVERLAY_ON
            // Glitter
            #pragma shader_feature _SUNDISK_SIMPLE
            // RGBMask
            #pragma shader_feature FXAA
            // Text
            #pragma shader_feature EFFECT_BUMP
            #pragma shader_feature _EMISSION
            // Clear Coat
            #pragma shader_feature _COLORCOLOR_ON
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdbase
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_fog
            #pragma vertex vert
            #pragma fragment frag
            #include "../Includes/CGI_PoiPass.cginc"
            ENDCG
            
        }
        
        Pass
        {
            Name "ForwardAddPass"
            Tags { "LightMode" = "ForwardAdd" }
            
            Stencil
            {
                Ref [_StencilRef]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            ZWrite Off
            BlendOp [_BlendOp], [_BlendOpAlpha]
            Blend [_SrcBlend] One, [_SrcBlend] One
            Cull [_Cull]
            ZTest [_ZTest]
            ColorMask [_ColorMask]
            Offset [_OffsetFactor], [_OffsetUnits]
            CGPROGRAM
            
            #pragma target 5.0
            #define FORWARD_ADD_PASS
            float _Mode;
            // Add Pass Features
            // Decal
            #pragma shader_feature GEOM_TYPE_BRANCH
            // patreon Additive
            // Black Light Mask
            #pragma shader_feature _SPECULARHIGHLIGHTS_OFF
            // voronoi
            #pragma shader_feature CHROMATIC_ABERRATION
            // UV Distortion
            #pragma shader_feature USER_LUT
            // Bulge
            #pragma shader_feature BLOOM_LOW
            #pragma shader_feature _PARALLAX_MAP
            // Mirror
            #pragma shader_feature _REQUIRE_UV2
            // Random
            #pragma shader_feature _SUNDISK_NONE
            // Dissolve
            #pragma shader_feature DISTORT
            // Panosphere
            #pragma shader_feature _DETAIL_MULX2
            // Lighting
            #pragma shader_feature LOD_FADE_CROSSFADE
            // Flipbook
            #pragma shader_feature _SUNDISK_HIGH_QUALITY
            // Rim Lighting
            #pragma shader_feature _GLOSSYREFLECTIONS_OFF
            // Metal
            #pragma shader_feature _METALLICGLOSSMAP
            // Iridescence
            #pragma shader_feature BLOOM_LENS_DIRT
            // Matcap
            #pragma shader_feature _COLORADDSUBDIFF_ON
            // Specular
            #pragma shader_feature _SPECGLOSSMAP
            // SubSurface
            #pragma shader_feature _TERRAIN_NORMAL_MAP
            // RGBMask
            #pragma shader_feature FXAA
            // Text
            #pragma shader_feature EFFECT_BUMP
            // Debug
            #pragma shader_feature _COLOROVERLAY_ON
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdadd_fullshadows
            #pragma vertex vert
            #pragma fragment frag
            #include "../Includes/CGI_PoiPass.cginc"
            ENDCG
            
        }
        //EnableOutlinePass
        Pass
        {
            Name "Outline"
            Tags { "LightMode" = "ForwardBase" }
            Stencil
            {
                Ref [_OutlineStencilRef]
                ReadMask [_OutlineStencilReadMask]
                WriteMask [_OutlineStencilWriteMask]
                Comp [_OutlineStencilCompareFunction]
                Pass [_OutlineStencilPassOp]
                Fail [_OutlineStencilFailOp]
                ZFail [_OutlineStencilZFailOp]
            }
            ZTest [_ZTest]
            ColorMask [_ColorMask]
            Offset [_OffsetFactor], [_OffsetUnits]
            BlendOp [_BlendOp], [_BlendOpAlpha]
            Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]
            ZWrite [_ZWrite]
            Cull [_OutlineCull]
            CGPROGRAM
            
            #pragma target 4.0
            #define FORWARD_BASE_PASS
            #define OUTLINE
            float _Mode;
            // patreon Additive
            // Black Light Mask
            #pragma shader_feature _SPECULARHIGHLIGHTS_OFF
            // voronoi
            #pragma shader_feature CHROMATIC_ABERRATION
            // UV Distortion
            #pragma shader_feature USER_LUT
            // Mirror
            #pragma shader_feature _REQUIRE_UV2
            // Random
            #pragma shader_feature _SUNDISK_NONE
            // Dissolve
            #pragma shader_feature DISTORT
            // Lighting
            #pragma shader_feature LOD_FADE_CROSSFADE
            #pragma multi_compile_fwdbase
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_fog
            #pragma multi_compile_instancing
            #pragma vertex vert
            #pragma fragment frag
            #include "../Includes/CGI_PoiPassOutline.cginc"
            ENDCG
            
        }
        //EnableOutlinePass
        
        Pass
        {
            Name "ShadowCasterPass"
            Tags { "LightMode" = "ShadowCaster" }
            Stencil
            {
                Ref [_StencilRef]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            AlphaToMask Off
            ZWrite [_ZWrite]
            Cull [_Cull]
            ZTest [_ZTest]
            ColorMask [_ColorMask]
            Offset [_OffsetFactor], [_OffsetUnits]
            CGPROGRAM
            
            #pragma target 5.0
            #define POI_SHADOW
            float _Mode;
            // UV Distortion
            #pragma shader_feature USER_LUT
            // Flipbook
            #pragma shader_feature _SUNDISK_HIGH_QUALITY
            // Mirror
            #pragma shader_feature _REQUIRE_UV2
            // Random
            #pragma shader_feature _SUNDISK_NONE
            // Dissolve
            #pragma shader_feature DISTORT
            #pragma multi_compile_instancing
            #pragma vertex vertShadowCaster
            #pragma fragment fragShadowCaster
            #include "../Includes/CGI_PoiPassShadow.cginc"
            ENDCG
            
        }
        
        Pass
        {
            Tags { "LightMode" = "Meta" }
            Cull Off
            CGPROGRAM
            
            #pragma target 5.0
            #define POI_META_PASS
            float _Mode;
            // UV Distortion
            #pragma shader_feature USER_LUT
            // Hologram Alpha
            #pragma shader_feature DEPTH_OF_FIELD
            //Video
            #pragma shader_feature BLOOM
            #pragma shader_feature _PARALLAXMAP
            // Mirror
            #pragma shader_feature _REQUIRE_UV2
            // Random
            #pragma shader_feature _SUNDISK_NONE
            // Dissolve
            #pragma shader_feature DISTORT
            // Panosphere
            #pragma shader_feature _DETAIL_MULX2
            // Lighting
            #pragma shader_feature LOD_FADE_CROSSFADE
            // Flipbook
            #pragma shader_feature _SUNDISK_HIGH_QUALITY
            // Rim Lighting
            #pragma shader_feature _GLOSSYREFLECTIONS_OFF
            // Enviro Rim
            #pragma shader_feature _MAPPING_6_FRAMES_LAYOUT
            // Metal
            #pragma shader_feature _METALLICGLOSSMAP
            // Iridescence
            #pragma shader_feature BLOOM_LENS_DIRT
            // Matcap
            #pragma shader_feature _COLORADDSUBDIFF_ON
            // Specular
            #pragma shader_feature _SPECGLOSSMAP
            // SubSurface
            #pragma shader_feature _TERRAIN_NORMAL_MAP
            // Debug
            #pragma shader_feature _COLOROVERLAY_ON
            // Glitter
            #pragma shader_feature _SUNDISK_SIMPLE
            // RGBMask
            #pragma shader_feature FXAA
            // Text
            #pragma shader_feature EFFECT_BUMP
            #pragma shader_feature _EMISSION
            // Clear Coat
            #pragma shader_feature _COLORCOLOR_ON
            #pragma vertex vert
            #pragma fragment frag
            #include "../Includes/CGI_PoiPass.cginc"
            ENDCG
            
        }
        
    }
    Fallback "Toon/Lit Cutout (Double)"
}