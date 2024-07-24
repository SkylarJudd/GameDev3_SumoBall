using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FluidRayMarching : MonoBehaviour
{
    public ComputeShader raymarching;
    public Camera cam;

    List<ComputeBuffer> buffersToDispose = new List<ComputeBuffer>();

    public SPH_Compute sph;

    RenderTexture target;
    RenderTexture depthTexture;

    [Header("Params")]
    public float viewRadius;
    public float blendStrength;
    public Color waterColor;

    public Color ambientLight;

    public Light lightSource;

    void InitRenderTextures()
    {
        if (target == null || target.width != cam.pixelWidth || target.height != cam.pixelHeight)
        {
            if (target != null)
            {
                target.Release();
            }

            target = new RenderTexture(cam.pixelWidth, cam.pixelHeight, 0, RenderTextureFormat.ARGBFloat, RenderTextureReadWrite.Linear);
            target.enableRandomWrite = true;
            target.Create();
        }

        if (depthTexture == null || depthTexture.width != cam.pixelWidth || depthTexture.height != cam.pixelHeight)
        {
            if (depthTexture != null)
            {
                depthTexture.Release();
            }

            depthTexture = new RenderTexture(cam.pixelWidth, cam.pixelHeight, 24, RenderTextureFormat.Depth, RenderTextureReadWrite.Linear);
            cam.depthTextureMode = DepthTextureMode.Depth;
            depthTexture.enableRandomWrite = false; // Depth texture does not support random write
            depthTexture.Create();
        }
    }

    private bool render = false;

    public ComputeBuffer _particlesBuffer;

    private void SpawnParticlesInBox()
    {
        _particlesBuffer = new ComputeBuffer(1, 44);
        _particlesBuffer.SetData(new Particle[]
        {
            new Particle {
                position = new Vector3(0,0,0)
            }
        });
    }

    public void Begin()
    {
        // SpawnParticlesInBox();
        InitRenderTextures();
        raymarching.SetBuffer(0, "particles", sph._particlesBuffer);
        raymarching.SetInt("numParticles", sph.particles.Length);
        raymarching.SetFloat("particleRadius", viewRadius);
        raymarching.SetFloat("blendStrength", blendStrength);
        raymarching.SetVector("waterColor", waterColor);
        raymarching.SetVector("_AmbientLight", ambientLight);

        // Set the depth texture from the camera
        raymarching.SetTexture(0, "_DepthTexture", depthTexture);

        render = true;
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        // InitRenderTextures();

        if (!render)
        {
            Begin();
        }

        if (render)
        {
            raymarching.SetVector("_Light", lightSource.transform.forward);

            raymarching.SetTexture(0, "Source", source);
            raymarching.SetTexture(0, "Destination", target);
            raymarching.SetVector("_CameraPos", cam.transform.position);
            raymarching.SetMatrix("_CameraToWorld", cam.cameraToWorldMatrix);
            raymarching.SetMatrix("_CameraInverseProjection", cam.projectionMatrix.inverse);

            int threadGroupsX = Mathf.CeilToInt(cam.pixelWidth / 8.0f);
            int threadGroupsY = Mathf.CeilToInt(cam.pixelHeight / 8.0f);
            raymarching.Dispatch(0, threadGroupsX, threadGroupsY, 1);

            Graphics.Blit(target, destination);
        }
    }
}