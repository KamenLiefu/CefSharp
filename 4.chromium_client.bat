cd E:\cef\chromium

:: Create the .gclient file with the command
gclient config  https://chromium.googlesource.com/chromium/src.git --unmanaged

gclient sync --nohooks --no-history

set DEPOT_TOOLS_WIN_TOOLCHAIN=0

@echo "gclient runhooks"
gclient runhooks

