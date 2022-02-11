using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RFR_SingleEye : MonoBehaviour
{
    public RenderTexture TexturePass0;
    //public RenderTexture TexturePass1 = null;
    RenderTexture TexturePass1 = null;

    public RenderTexture TexturePass2;
    public RenderTexture TextureDenoise;
    public Material Pass1Material;
    public Material Pass2Material;
    public Material DenoiseMaterial;

    public int width = 1440;
    public int height = 1600;
    public float sigma;
    [Range(0.01f, 0.99f)]
    public float fx;
    [Range(0.01f, 0.99f)]
    public float fy;
    [Range(0.01f, 0.99f)]
    public float eyeX;
    [Range(0.01f, 0.99f)]
    public float eyeY;
    int iApplyRFRMap1;
    int iApplyRFRMap2;

    // Start is called before the first frame update
    void Start()
    {
        width = 1440;
        height = 1600;
        iApplyRFRMap1 = 1;
        iApplyRFRMap2 = 1;
        TexturePass1 = new RenderTexture(Mathf.RoundToInt(width / sigma), Mathf.RoundToInt(height / sigma), 24, RenderTextureFormat.Default);
        TexturePass1.Create();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnRenderImage(RenderTexture src, RenderTexture dst)
    {
        Pass1MainL();
        Pass2MainL();
        Pass3DenoiseL();
        Graphics.Blit(TextureDenoise, dst);
    }

    void Pass1MainL()
    {
        Pass1Material.SetFloat("_eyeX", eyeX);
        Pass1Material.SetFloat("_eyeY", eyeY);
        Pass1Material.SetFloat("_scaleRatio", sigma);
        Pass1Material.SetFloat("_fx", fx);
        Pass1Material.SetFloat("_fy", fy);
        Pass1Material.SetInt("_iApplyRFRMap1", iApplyRFRMap1);
        Graphics.Blit(TexturePass0, TexturePass1, Pass1Material);
    }
    void Pass2MainL()
    {
        Pass2Material.SetFloat("_eyeX", eyeX);
        Pass2Material.SetFloat("_eyeY", eyeY);
        Pass2Material.SetFloat("_scaleRatio", sigma);
        Pass2Material.SetFloat("_fx", fx);
        Pass2Material.SetFloat("_fy", fy);
        Pass2Material.SetInt("_iApplyRFRMap2", iApplyRFRMap2);
        Pass2Material.SetTexture("_MidTex", TexturePass1);
        Graphics.Blit(null, TexturePass2, Pass2Material);
    }

    void Pass3DenoiseL()
    {
        DenoiseMaterial.SetFloat("_iResolutionX", width);
        DenoiseMaterial.SetFloat("_iResolutionY", height);
        DenoiseMaterial.SetFloat("_eyeX", eyeX);
        DenoiseMaterial.SetFloat("_eyeY", eyeY);
        DenoiseMaterial.SetTexture("_Pass2Tex", TexturePass2);
        Graphics.Blit(null, TextureDenoise, DenoiseMaterial);
    }


}
