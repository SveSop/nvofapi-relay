# nvOFApi
Relay library for OpticalFlow library - nvOFApi.  

This relays calls from nvofapi64.dll <-> libnvidia-opticalflow.so.1 - `NvOFAPICreateInstanceCuda`  

Currently no support for Vulkan interop - `NvOFAPICreateInstanceVk`  

## OpticalFlow CUDA interop
This should work with the game Indiana Jones and the Great Circle for enabling DLSS FrameGeneration  
on RTX 40xx adapters if used together with nvcuda relay from either:  
[https://github.com/SveSop/nvcuda/tree/devel](https://github.com/SveSop/nvcuda/tree/devel)  
or  
[https://github.com/SveSop/nvidia-libs](https://github.com/SveSop/nvidia-libs)  

See note below for usage.  

## Build requirements:  
- [WINE] (version >= 9.0) [https://www.winehq.org/](https://www.winehq.org/)  
- [Meson] [http://mesonbuild.com/](http://mesonbuild.com/)  
- [NINJA] [https://ninja-build.org/](https://ninja-build.org/)  

Build by running the included script:  
`./package-release.sh destdir`  

## Usage
To use this with Steam Proton, you can replace the dxvk-nvapi version of nvofapi64.dll usually located  
in the Proton library.  
Eg. `$HOME/.steam/steam/steamapps/common/Proton - Experimental/files/lib64/wine/nvapi`  

OBS! This will replace dxvk-nvapi implementation of `nvofapi64.dll`, so use with caution.  
