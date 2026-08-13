cd "$HOME"

function rm-f ([string] $Path)
{
	if (Test-Path $Path)
	{
	    Remove-Item $Path >$null
	}
}

function ln-nfs ([string] $Target, [string] $Path)
{
	New-Item -ItemType SymbolicLink -Path $Path -Target $Target >$null
}

function ln-nf ([string] $Target, [string] $Path)
{
	New-Item -ItemType Junction -Path $Path -Target $Target >$null
}

function mkdir-p ([string] $Path)
{
	New-Item -ItemType Directory -Force -Path $Path >$null
}

rm-f .gitconfig
ln-nfs C:\Repos\config\home\.gitconfig .gitconfig

rm-f .pulsar\config.cson
ln-nfs C:\Repos\config\home\.atom\config.cson .pulsar\config.cson

rm-f .pulsar\keymap.cson
ln-nfs C:\Repos\config\home\.atom\keymap.cson .pulsar\keymap.cson

rm-f .pulsar\packages.cson
ln-nfs C:\Repos\config\home\.atom\packages.cson .pulsar\packages.cson

rm-f .pulsar\styles.less
ln-nfs C:\Repos\config\home\.atom\styles.less .pulsar\styles.less

mkdir-p .pulsar\packages
rm-f .pulsar\packages\fuzzy-finder
ln-nf C:\Repos\config\home\.atom\packages\fuzzy-finder .pulsar\packages\fuzzy-finder

rm-f AppData\Roaming\ConEmu.xml
ln-nfs C:\Repos\config\home\AppData\Roaming\ConEmu.xml AppData\Roaming\ConEmu.xml

mkdir-p Documents\PowerShell
rm-f Documents\PowerShell\Profile.ps1
ln-nfs C:\Repos\config\home\Documents\PowerShell\Profile.ps1 Documents\PowerShell\Profile.ps1
