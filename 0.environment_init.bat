:: Disable automatic update of depot_tools
setx DEPOT_TOOLS_UPDATE "0"

:: Using a locally installed version of Visual Studio
setx DEPOT_TOOLS_WIN_TOOLCHAIN "0"

:: GN Build Tool
set CEF_USE_GN=1
:: Creating a Project with VS2022
set GN_ARGUMENTS=--ide=vs2022 --sln=cef --filters=//cef/*
:: Use the official build and add ffmpeg audio/video decoding
set GN_DEFINES=is_official_build=true proprietary_codecs=true ffmpeg_branding=Chrome chrome_pgo_phase=0
set GYP_DEFINES=buildtype=Official

set GYP_GENERATORS=ninja,msvs-ninja
set GYP_MSVS_VERSION=2022
set CEF_ARCHIVE_FORMAT=tar.bz2
set VS_CRT_ROOT=D:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Tools\MSVC\14.40.33807\crt
set WIN_CUSTOM_TOOLCHAIN=1

set CEF_VCVARS=none
set GYP_MSVS_OVERRIDE_PATH=D:\Program Files\Microsoft Visual Studio\2022\Professional
set MSVC_VERSION=14.40.33807
set SDK_ROOT=D:\Program Files (x86)\Windows Kits\10
set WINDOWSSDKDIR=D:\Program Files (x86)\Windows Kits\10
set SDK_VERSION=10.0.22621.0

for /f "tokens=3,*" %i in ('reg query HKCU\Environment /v Path') do setx Path "E:\cef\depot_tools\;%i%j"