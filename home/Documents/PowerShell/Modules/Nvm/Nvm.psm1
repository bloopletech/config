$OriginalNvmExe = Get-Command nvm -CommandType Application -ErrorAction SilentlyContinue
if ($OriginalNvmExe)
{
  Set-Alias nvm-original $OriginalNvmExe.Path
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

function Find-NvmCwdVersion ([boolean] $Warn = $false)
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

function Invoke-Nvm {
  param(
    [string]$Argument = $null,
    [string]$Version = $null
  )

  if ($Argument -eq "install" -or $Argument -eq "use")
  {
    if (!$Version)
    {
      $Version = Find-NvmCwdVersion $true
    }

    if ($Version)
    {
      & nvm-original $Argument $Version
    }
  }
  elseif ($Argument)
  {
    & nvm-original $Argument $Version
  }
  else
  {
    & nvm-original
  }
}

Set-Alias nvm Invoke-Nvm

function NvmAutoUse
{
  $Version = Find-NvmCwdVersion
  if ($Version)
  {
    & nvm-original use $Version
  }
}

Export-ModuleMember -Function NvmAutoUse
Export-ModuleMember -Function Invoke-Nvm
Export-ModuleMember -Alias nvm-original
Export-ModuleMember -Alias nvm