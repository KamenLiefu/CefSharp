# CefSharp
Cefharp audio and video playback compile,generate the correspondig dll files,so as to support project development.
It is recommended to compile at least **`16G of RAM`** and at least **`250G of SSD`**.The script uses **`the E drive`** as an example, and you need to manually **`create the cef directory`** on the E drive.It is **`prohibited to charge users`** for downloading by **`publishing other platforms after reprinting`**.
```
md E:\cef\chromium\src
```
# 1.Version Selection
**Configure web address:**</p>
https://bitbucket.org/chromiumembedded/cef/wiki/BranchesAndBuilding.md</p>
|Date|Release Branch|Chromium Version|	CEF Version	Windows Build Requirements|	
|:--:|:--:|:--:|:--:|
|Jun 2024|	6533|	127|	127	Win 10+ deployment, Win 10+ build system w/ VS2022 17.9.2, Win 10.0.22621 SDK, Ninja|
|May 2024|	6478|	126|	126	Win 10+ deployment, Win 10+ build system w/ VS2022 17.9.2, Win 10.0.22621 SDK, Ninja|
|Apr 2024|	6422|	125|	125	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|
|Mar 2024|	6367|	124|  124	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|
|Feb 2024|	6312|	123|	123	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja	|
|Jan 2024|	6261|	122|	122	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja	|
|Dec 2023|	6167|	121|	121	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|	
|Nov 2023|	6099|	120|	120	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja	|
|Oct 2023|	6045|	119|	119	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|
|Sep 2023|	5993|	118|	118	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|	
|Aug 2023|	5938|	117|	117	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|	
|Jun 2023|	5845|	116|	116	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|	
|May 2023|	5790|	115|	115	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|	
|Apr 2023|	5735|	114|	114	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|
|Mar 2023|	5672|	113|	113	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|
|Feb 2023|	5615|	112|	112	Win 10+ deployment, Win 10+ build system w/ VS2022 17.5+, Win 10.0.22621 SDK, Ninja|
|Jan 2023|	5563|	111|	111	Win 10+ deployment, Win 10+ build system w/ VS2019 16.11.13+, Win 10.0.20348 SDK, Ninja|	
|Dec 2022|	5481|	110|	110	Win 10+ deployment, Win 10+ build system w/ VS2019 16.11.13+, Win 10.0.20348 SDK, Ninja|
|Nov 2022|	5414|	109|	109	Win 7+ deployment, Win 10+ build system w/ VS2019 16.11.13+, Win 10.0.20348 SDK, Ninja|

**Selcet the required version and configure the environment.**</p>
For example:**`install vs2022`**,**`select the appropriate sdk,10.0.22621.2428`**。</p>
</p>

**`VS2022 requires the selection of C++.`**

![image](https://github.com/user-attachments/assets/ed54ecbb-3a61-4b13-9269-ff8796b6bcfa)

# 2.Internet Choose
Choose the appropriate network to access the Internet, and depending on the Internet tool you can set up a proxy.
E.g. It is recommended to manually execute it every time you open cmd.</p>
```
set HTTP_PROXY=http://127.0.0.1:7890
set HTTPS_PROXY=http://127.0.0.1:7890
```
# 3.Environment initialization
Run cmd as an administrator and enter the directory where the batch script is located
```markdown
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
```
**`Command line execution 0.environment_init.bat`**
# 4.cef download
Execute according to the selected branch, here is the 6422 branch as an example
```markdown
cd E:\cef
::Clone the source code and switch to the 6422 branch
git clone https://bitbucket.org/chromiumembedded/cef.git -b 6422

```
**`Command line execution 1.downing_cef.bat`**

# 5.chromium download
Check the version according to CHROMIUM_BUILD_COMPATIBILITY.txt of the selected branch.
```
# The Chromium Embedded Framework (CEF) project is built on top of the Chromium
# project source tree. Chromium should be updated to the URL and revision listed
# below before building CEF. Chromium compatibility information for older CEF
# revisions is available by viewing this file's change history.
#
# Instructions for building CEF are available at:
# https://bitbucket.org/chromiumembedded/cef/wiki/BranchesAndBuilding

{
  'chromium_checkout': 'refs/tags/125.0.6422.142',
  'depot_tools_checkout': '3e4ab13934'
}

```
```markdown
cd E:\cef\chromium
::  (cef 6422 branch corresponds to chromiun tag: 125.0.6422.142)
git clone https://chromium.googlesource.com/chromium/src.git -b 125.0.6422.142 --depth 1

```
**`Command line execution 2.downing_chromium.bat`**
# 6.depot_tools download
```markdown
cd E:\cef
:: Download depot_tools tool
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
cd E:\cef\depot_tools
:: Temporary permission to update
set DEPOT_TOOLS_UPDATE=1
:: depot_tools batch script Update_Depot_tools.bat
update_depot_tools.bat
:: prohibit updating
set DEPOT_TOOLS_UPDATE=0
:: checkout,(CEF 6422 branch corresponds to depot_tools commit ID: 3e4ab13934)
checkout 3e4ab13934
```
**`Command line execution 3.downing_depot_tools`**
# 7.Synchronize 
```markdown
cd E:\cef\chromium

:: Create the .gclient file with the command
gclient config  https://chromium.googlesource.com/chromium/src.git --unmanaged

gclient sync --nohooks --no-history

set DEPOT_TOOLS_WIN_TOOLCHAIN=0

@echo "gclient runhooks"
gclient runhooks

```
**`Command line execution 4.chromium_client`**

# 8.Build Project
```markdown
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
```
**`Command line execution 5.build_project`**
# 9.Cef Compilation
According to the computer time, the relative compilation time is longer, 5~10 hours, or even longer.
```markdown
cd E:\cef\chromium\src
ninja -C out\Release_GN_x64_sandbox cef_sandbox
ninja -C out/Release_GN_x64 cef
```
**`Command line execution 6.cef_compile`**
# 10.Package Generation
```markdown
cd E:\cef\chromium\src\cef\tools
set CEF_VCVARS=none
set CEF_ARCHIVE_FORMAT=tar.bz2
::  --minimal
make_distrib.bat --ninja-build --no-docs --x64-build --no-symbols --minimal
```
**`Command line execution 7.pack-x64`**
# 11.Result Showcase
**Test the site with the generated dll**
<p/>
	
![Honeycam 2024-07-20 00-23-20](https://github.com/user-attachments/assets/36cc90bb-35f0-4033-b692-f4b6d7a422d3)
<p/>
	
**Tests if h264 is on, i.e. audio/video playback.**
<p/>
	
![Honeycam 2024-07-20 00-18-13](https://github.com/user-attachments/assets/c1e35bc8-61ff-4ebd-81ec-57dd00b8a3e2)





