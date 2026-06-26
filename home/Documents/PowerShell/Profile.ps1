if (Test-Path "$PSScriptRoot\Profile-Private.ps1")
{
    . "$PSScriptRoot\Profile-Private.ps1"
}

function Get-ParentItem([string] $Name)
{
	$Current = Get-Location

	while ($Current)
	{
		$Path = Join-Path $Current $Name
		if (Test-Path $Path)
		{
			return $Path
		}

		$Current = Split-Path $current
	}

	return $null
}

function Get-CwdNvmVersion ([boolean] $Warn = $false)
{
	$Path = Get-ParentItem ".nvmrc"
	if ($Path)
	{
		return (Get-Content $Path).Trim()
	}

	$Path = Get-ParentItem "node-version"
	if ($Path)
	{
		return (Get-Content $Path).Trim()
	}

	if ($Warn)
	{
		Write-Warning "No .nvmrc or .node-version file found"
	}

	return $null
}

$OriginalNvmExe = Get-Command nvm -CommandType Application -ErrorAction SilentlyContinue
if ($OriginalNvmExe)
{
	Set-Alias nvm-original $OriginalNvmExe.Path
}

function _NvmWrapper {
    param(
        [string]$Argument = $null,
        [string]$Version = $null
    )

    if ($Argument -eq "install" -or $Argument -eq "use")
	{
		if (!$Version)
		{
			$Version = Get-CwdNvmVersion $true
		}

		if ($Version)
		{
			& nvm-original $Argument $Version
		}
	}
    elseif ($Argument)
	{
        & nvm-original $Argument
    }
	else
	{
		& nvm-original
	}
}

Set-Alias nvm _NvmWrapper

function _NvmAutoUse
{
	$Version = Get-CwdNvmVersion
	if ($Version)
	{
		& nvm-original use $Version
	}
}

$OriginalPrompt = Get-Command prompt -CommandType Function

function prompt
{
  #_NvmAutoUse

  $loc = Get-Location

  # Emulate standard PS prompt with location followed by ">"
  $out = "PS $loc> "
  #$out = & $OriginalPrompt

  # Or prettify the prompt by coloring its parts
  # Write-Host -NoNewline -ForegroundColor Cyan "PS "
  # Write-Host -NoNewline -ForegroundColor Yellow $loc
  # $out = "> "

  # Check for ConEmu existance and ANSI emulation enabled
  if ($env:ConEmuANSI -eq "ON") {
    # Let ConEmu know when the prompt ends, to select typed
    # command properly with "Shift+Home", to change cursor
    # position in the prompt by simple mouse click, etc.
    $out += "$([char]27)]9;12$([char]7)"

    # And current working directory (FileSystem)
    # ConEmu may show full path or just current folder name
    # in the Tab label (check Tab templates)
    # Also this knowledge is crucial to process hyperlinks clicks
    # on files in the output from compilers and source control
    # systems (git, hg, ...)
    if ($loc.Provider.Name -eq "FileSystem") {
      $out += "$([char]27)]9;9;`"$($loc.Path)`"$([char]7)"
    }
  }

  return $out
}

New-Alias which get-command

$Env:NODE_OPTIONS='--max-old-space-size=4096'

function Base64Encode ([string] $Raw)
{
    [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Raw))
}

function Base64EncodeFile ([string] $RawFilename)
{
	$Raw = [System.IO.File]::ReadAllText($RawFilename)
    [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Raw))
}

function Base64EncodeFileBinary ([string] $RawFilename)
{
	$Raw = [System.IO.File]::ReadAllBytes($RawFilename)
    [Convert]::ToBase64String($Raw)
}

function Base64Decode ([string] $Encoded)
{
    [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($Encoded))
}

function Base64DecodeFile ([string] $EncodedFilename)
{
	$Encoded = [System.IO.File]::ReadAllText($EncodedFilename)
    [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($Encoded))
}

function Base64DecodeFileBinary ([string] $EncodedFilename)
{
	$Encoded = [System.IO.File]::ReadAllText($EncodedFilename)
    [System.Convert]::FromBase64String($Encoded)
}

function Open([string]$Path)
{
  $ResolvedPath = Resolve-Path $Path
  explorer.exe $ResolvedPath
}

function Here
{
  Open .
}

function CleanDir
{
  if (Test-Path -Path ./* -Include *.sln,*.slnx)
  {
    # From https://sachabarbs.wordpress.com/2014/10/24/powershell-to-clean-visual-studio-binobj-folders/
    Get-ChildItem -inc bin,obj -rec | Remove-Item -rec -force
  }
}