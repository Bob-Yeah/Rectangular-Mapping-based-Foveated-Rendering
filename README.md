# Rectangular-Mapping-based-Foveated-Rendering
Source Code of Rectangular Mapping-based Foveated Rendering(IEEE VR 2022)

Unity demo. Tested on Unity 2020.3.8f1

* [Slides]

## Comparison with KFR (Fireroom Example)

The comparison between 
Kernel Foveated Rendering (KFR), 
rectangular-mapping foveated rendering (RFR),
and the full-resolution is shown in the figure below. 

RFR (Our proposed rectangular-mapping foveated rendering, with sigma = 1.6)

<img src="https://github.com/xmeng525/RecMapFoveatedRendering/blob/main/Figures/fireroom/RFR_sigma_1.6alpha_17.png" alt="" width="640" height="360" />

KFR (with sigma = 1.6)

<img src="https://github.com/xmeng525/RecMapFoveatedRendering/blob/main/Figures/fireroom/KFR_sigma_1.6alpha_4.png" alt="" width="640" height="360" />

Full-resolution Rendering

<img src="https://github.com/xmeng525/RecMapFoveatedRendering/blob/main/Figures/fireroom/Original.png" alt="" width="640" height="360" />

## Comparison with KFR (Checkboard Example)

The comparison between 
Kernel Foveated Rendering (KFR), 
rectangular-mapping foveated rendering (RFR),
and the full-resolution is shown in the figure below. 

RFR (Our proposed rectangular-mapping foveated rendering, with sigma = 1.6)

<img src="https://github.com/xmeng525/RecMapFoveatedRendering/blob/main/Figures/checkboard/RFR_sigma_1.6alpha_17.png" alt="" width="640" height="360" />

KFR (with sigma = 1.6)

<img src="https://github.com/xmeng525/RecMapFoveatedRendering/blob/main/Figures/checkboard/KFR_sigma_1.6alpha_4.png" alt="" width="640" height="360" />

Full-resolution Rendering

<img src="https://github.com/xmeng525/RecMapFoveatedRendering/blob/main/Figures/checkboard/Original.png" alt="" width="640" height="360" />

## Install
Clone this repo and open the RMFR folder using Unity 2020.3.8f1.

Or Download the "RMFR.unitypackage" and import the package to Unity 2020.3.8f1.


## Parameter Control
You may control the parameters within the unity inspector:

<img src="https://github.com/Bob-Yeah/Rectangular-Mapping-based-Foveated-Rendering/tree/main/Sources/Control.PNG" alt="" width="383" height="321" />

"Sigma": control the sigma before you clicking "Play" Button of Unity Editor to modify the scale factor;

"Fx": control the parameter along x-axis (you can modify it realtime);

"Fy": control the parameter along y-axis (you can modify it realtime);

"Eye X": control the x-component of eye gaze position (you can modify it realtime);

"Eye Y": control the y-component of eye gaze position (you can modify it realtime);

If you want to change the display resolution, the Width, Height in the inspector, the corresponding settings of the "Game Window", and the size of the rendertextures TexturePass0, TexturePass1, TextureDenoise should ALL be modified.

Please note that this project only shows the effect of rectangular-mapping foveated rendering. 
The speedup cannot be shown in this project because the rendering task here is not complex.
