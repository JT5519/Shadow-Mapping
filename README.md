# Shadow-Mapping
Click [here](https://youtu.be/gaQO_OXkavY) to watch a demo for the project.

## Concept
Shadow Mapping is a texture-based solution to shadows. For every light that implements shadows, a depth buffer is created for all objects in the scene from that lights perspective. This depth buffer stores the distances of the closest objects to the light for all given directions. This is later used to check if a given point is in the shadow of the light or not. <br/>
These depth buffer's are mapped onto 2D textures, that are then passed to the pixel shader when rendering the actual frame. These textures are then sampled for every pixel. The distance of the pixel from each light is compared with the value in that light's depth buffer in the direction of the pixel. If the sampled depth buffer distance is greater than the pixel's distance, the pixel is lit since there is no obstruction between this pixel and the light. For the other lights (pixel distance > sampled distance), this pixel is in that light's shadow.<br/>
In this way, shadow's can be implemented for multiple lights. It is usually limited to a single main light (like the sun) in the game because of how expensive it can get. 

## Overview
This project implements multiple directional lights that each have shadow mapping enabled. Each directional light's color and intensity can be changed and their shadow mapping can be toggled.

## External resources
This project was made as part of the final deliverable of a graduate level graphics course. A base class (DXCore) and a utlity class to handle shaders (SimpleShader) were provided as part of the course. Also, some mathematical assistance in figuring out some of the hlsl calculations was provided, like how to calculate the region of the shadow map's to sample.

## External libraries
This project was built in DirectX 11, and uses ImGUI for all UI purposes.
