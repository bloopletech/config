cd "$HOME"

rm .gitconfig
New-Item -ItemType SymbolicLink -Path .gitconfig -Target C:\Repos\config\home\.gitconfig

rm .pulsar\config.cson
New-Item -ItemType SymbolicLink -Path .pulsar\config.cson -Target C:\Repos\config\home\.atom\config.cson

rm .pulsar\keymap.cson
New-Item -ItemType SymbolicLink -Path .pulsar\keymap.cson -Target C:\Repos\config\home\.atom\keymap.cson

rm .pulsar\packages.cson
New-Item -ItemType SymbolicLink -Path .pulsar\packages.cson -Target C:\Repos\config\home\.atom\packages.cson

rm .pulsar\styles.less
New-Item -ItemType SymbolicLink -Path .pulsar\styles.less -Target C:\Repos\config\home\.atom\styles.less

New-Item -ItemType Directory -Force -Path .pulsar\packages
Remove-Item -Recurse .pulsar\packages\fuzzy-finder
New-Item -ItemType Junction -Path .pulsar\packages\fuzzy-finder -Target C:\Repos\config\home\.atom\packages\fuzzy-finder

rm AppData\Roaming\ConEmu.xml
New-Item -ItemType SymbolicLink -Path AppData\Roaming\ConEmu.xml -Target C:\Repos\config\home\AppData\Roaming\ConEmu.xml

New-Item -ItemType Directory -Force -Path Documents\PowerShell
rm Documents\PowerShell\Profile.ps1
New-Item -ItemType SymbolicLink -Path Documents\PowerShell\Profile.ps1 -Target C:\Repos\config\home\Documents\PowerShell\Profile.ps1
