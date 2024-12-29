# nvOFApi
Relay library for OpticalFlow library - nvOFApi.  

This relays calls from nvofapi64_cuda.dll <-> libnvidia-opticalflow.so.1 - `NvOFAPICreateInstanceCuda`  
and requires a custom version of `nvofapi64.dll`  

Currently no support for Vulkan interop - `NvOFAPICreateInstanceVk`  

## OpticalFlow CUDA interop
This should work with the game Indiana Jones and the Great Circle for enabling DLSS FrameGeneration  
on RTX 40xx adapters if used together with nvcuda and nvofapi64 from:  
[https://github.com/SveSop/nvidia-libs](https://github.com/SveSop/nvidia-libs)  

## Build requirements:  
- [WINE] (version >= 9.0) [https://www.winehq.org/](https://www.winehq.org/)  
- [Meson] [http://mesonbuild.com/](http://mesonbuild.com/)  
- [NINJA] [https://ninja-build.org/](https://ninja-build.org/)  

Build by running the included script:  
`./package-release.sh destdir`  
