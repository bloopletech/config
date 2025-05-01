cd "%USERPROFILE%"
del .pulsar\config.cson
mklink .pulsar\config.cson C:\Repos\config\home\.atom\config.cson
del .pulsar\keymap.cson
mklink .pulsar\keymap.cson C:\Repos\config\home\.atom\keymap.cson
del .pulsar\packages.cson
mklink .pulsar\packages.cson C:\Repos\config\home\.atom\packages.cson
del .pulsar\styles.less
mklink .pulsar\styles.less C:\Repos\config\home\.atom\styles.less
rmdir /S .pulsar\packages\fuzzy-finder
if not exist ".pulsar\packages" mkdir .pulsar\packages
mklink /J .pulsar\packages\fuzzy-finder C:\Repos\config\home\.atom\packages\fuzzy-finder
del AppData\Roaming\ConEmu.xml
mklink AppData\Roaming\ConEmu.xml C:\Repos\config\home\AppData\Roaming\ConEmu.xml
del Documents\PowerShell\Profile.ps1
if not exist ".Documents\PowerShell" mkdir Documents\PowerShell
mklink Documents\PowerShell\Profile.ps1 C:\Repos\config\home\Documents\PowerShell\Profile.ps1