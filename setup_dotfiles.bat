cd "%USERPROFILE%"
del .atom\config.cson
mklink .atom\config.cson C:\Repos\config\home\.atom\config.cson
del .atom\keymap.cson
mklink .atom\keymap.cson C:\Repos\config\home\.atom\keymap.cson
del .atom\packages.cson
mklink .atom\packages.cson C:\Repos\config\home\.atom\packages.cson
del .atom\styles.less
mklink .atom\styles.less C:\Repos\config\home\.atom\styles.less
rmdir /S .atom\packages\fuzzy-finder
if not exist ".atom\packages" mkdir .atom\packages
mklink /J .atom\packages\fuzzy-finder C:\Repos\config\home\.atom\packages\fuzzy-finder
del AppData\Roaming\ConEmu.xml
mklink AppData\Roaming\ConEmu.xml C:\Repos\config\home\AppData\Roaming\ConEmu.xml