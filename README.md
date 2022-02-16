# Rectangular-Mapping-based-Foveated-Rendering
Source Code of Rectangular Mapping-based Foveated Rendering(IEEE VR 2022)

Unity demo. Tested on Unity 2020.3.8f1

* [Slides]

## Comparison with KFR (Fireroom Example)

The comparison between 
Kernel Foveated Rendering (KFR), 
rectangular-mapping foveated rendering (RFR),
and the full-resolution is shown in the figure below. (No denosing blur applied.)

RFR (Our proposed rectangular-mapping foveated rendering, with sigma = 2.6)

<img src="https://github.com/Bob-Yeah/Rectangular-Mapping-based-Foveated-Rendering/blob/main/Sources/fireroom/RFR_sigma_2.6.png" alt="" width="360" height="400" />

KFR (with sigma = 2.6)

<img src="https://github.com/Bob-Yeah/Rectangular-Mapping-based-Foveated-Rendering/blob/main/Sources/fireroom/KFR_sigma_2.6_alpha_4.png" alt="" width="360" height="400" />

Full-resolution Rendering

<img src="https://github.com/Bob-Yeah/Rectangular-Mapping-based-Foveated-Rendering/blob/main/Sources/fireroom/Original.png" alt="" width="360" height="400" />

## Comparison with KFR (Artificial Pattern Example)

The comparison between 
Kernel Foveated Rendering (KFR), 
rectangular-mapping foveated rendering (RFR),
and the full-resolution is shown in the figure below. 

RFR (Our proposed rectangular-mapping foveated rendering, with sigma = 2.6)

<img src="https://github.com/Bob-Yeah/Rectangular-Mapping-based-Foveated-Rendering/blob/main/Sources/Patterns/RFR_sigma_2.6.png" alt="" width="360" height="400" />

KFR (with sigma = 2.6)

<img src="https://github.com/Bob-Yeah/Rectangular-Mapping-based-Foveated-Rendering/blob/main/Sources/Patterns/KFR_sigma_2.6_alpha_4.png" alt="" width="360" height="400" />

Full-resolution Rendering

<img src="https://github.com/Bob-Yeah/Rectangular-Mapping-based-Foveated-Rendering/blob/main/Sources/Patterns/Original.png" alt="" width="360" height="400" />

## Install
Clone this repo and open the RMFR folder using Unity 2020.3.8f1.

Or Download the "RMFR.unitypackage" and import the package to Unity 2020.3.8f1.


## Parameter Control
You may control the parameters within Keys

"Sigma": control the sigma: "Q" sigma- , "E" sigma+ ;

"Fx": control the parameter along x-axis: "Left" fx- , "Right" fx+;

"Fy": control the parameter along y-axis: "Up" fy+, "Down" fy-;

"Eye X": control the x-component of eye gaze position: "A" eyeX-, "D" eyeX+;

"Eye Y": control the y-component of eye gaze position: "W" eyeY+, "S" eyeY-;

If you want to change the display resolution, the corresponding settings of the "Game Window", and the size of the rendertextures TexturePass0 should ALL be modified manually.

Please note that this project only shows the effect of rectangular-mapping foveated rendering. 
The speedup cannot be shown in this project because the rendering task here is not complex.
