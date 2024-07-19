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
