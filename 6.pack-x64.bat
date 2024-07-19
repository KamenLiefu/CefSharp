cd E:\cef\chromium\src\cef\tools
set CEF_VCVARS=none
set CEF_ARCHIVE_FORMAT=tar.bz2
::  --minimal
make_distrib.bat --ninja-build --no-docs --x64-build --no-symbols --minimal