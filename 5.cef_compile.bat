cd E:\cef\chromium\src\cef
set CEF_USE_GN=1
set GN_ARGUMENTS=--ide=vs2022 --sln=cef --filters=//cef/*
set GN_DEFINES=is_official_build=true proprietary_codecs=true ffmpeg_branding=Chrome chrome_pgo_phase=0
set GYP_DEFINES=buildtype=Official
set GYP_GENERATORS=ninja,msvs-ninja
set GYP_MSVS_VERSION=2022
set CEF_ARCHIVE_FORMAT=tar.bz2
set VS_CRT_ROOT=D:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Tools\MSVC\14.40.33807\crt
set WIN_CUSTOM_TOOLCHAIN=1
::set CEF_VCVARS=none
set GYP_MSVS_OVERRIDE_PATH=D:\Program Files\Microsoft Visual Studio\2022\Professional
set MSVC_VERSION=14.40.33807
set SDK_ROOT=D:\Program Files (x86)\Windows Kits\10
set WINDOWSSDKDIR=D:\Program Files (x86)\Windows Kits\10
set SDK_VERSION=10.0.22621.0
@REM compiling 64-bit call VS script has problems, the following change to set the path manually
@REM call "D:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvarsall.bat" x64
set INCLUDE=%SDK_ROOT%\Include\%SDK_VERSION%\um;%SDK_ROOT%\Include\%SDK_VERSION%\ucrt;%SDK_ROOT%\Include\%SDK_VERSION%\shared;%GYP_MSVS_OVERRIDE_PATH%\VC\Tools\MSVC\%MSVC_VERSION%\include;%GYP_MSVS_OVERRIDE_PATH%\VC\Tools\MSVC\%MSVC_VERSION%\atlmfc\include;%INCLUDE%
set LIB=%SDK_ROOT%\Lib\%SDK_VERSION%\um\x64;%SDK_ROOT%\10\Lib\%SDK_VERSION%\ucrt\x64;%GYP_MSVS_OVERRIDE_PATH%\VC\Tools\MSVC\%MSVC_VERSION%\lib\x64;%GYP_MSVS_OVERRIDE_PATH%\VC\Tools\MSVC\%MSVC_VERSION%\atlmfc\lib\x64;%LIB%
set PATH=%SDK_ROOT%\bin\%SDK_VERSION%\x64;%GYP_MSVS_OVERRIDE_PATH%\VC\Tools\MSVC\%MSVC_VERSION%\bin\HostX64\x64;%GYP_MSVS_OVERRIDE_PATH%\VC\Tools\MSVC\%MSVC_VERSION%\bin\HostX64\x64;%GYP_MSVS_OVERRIDE_PATH%\VC\Redist\MSVC\14.40.33807\x64\Microsoft.VC143.CRT;%PATH%
:: create project
call cef_create_projects.bat
