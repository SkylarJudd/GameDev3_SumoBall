using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class PostProssessingController : Singleton<PostProssessingController>
{
    public Volume volume;

    private ChromaticAberration aberration;
    private Bloom bloom;
    private Vignette vignette;

    /// <summary>
    /// Sets the chromatic value to the inputted value
    /// </summary>
    /// <param name="_value"></param>
    public void SetChromatic(float _value)
    {
        volume.profile.TryGet(out aberration);
        aberration.intensity.value = _value;
    }
    /// <summary>
    /// Sets the Blooms Value To the Inputted Value
    /// </summary>
    /// <param name="_value"></param>
    public void SetBloom(float _value)
    {
        volume.profile.TryGet(out bloom);
        bloom.intensity.value = _value;
    }
    /// <summary>
    /// sets Vignettes value to the inputted Value
    /// </summary>
    /// <param name="_value"></param>
    public void Setvignette(float _value)
    {
        volume.profile.TryGet(out vignette);
        vignette.intensity.value = _value;
    }

    public void TweenVignetteIn(float _intensity, float _duration)
    {
        volume.profile.TryGet(out vignette);
        DOTween.To(() => vignette.intensity.value, (x) => vignette.intensity.value = x, _intensity, _duration).OnComplete(() => TweenVignetteOut(0, _duration));
    }

    public void TweenVignetteOut(float _intensity, float _duration)
    {
        volume.profile.TryGet(out vignette);
        DOTween.To(() => vignette.intensity.value, (x) => vignette.intensity.value = x, _intensity, _duration);
    }
}
