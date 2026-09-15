if (Test-Path "$PSScriptRoot\Profile-Private.ps1")
{
  . "$PSScriptRoot\Profile-Private.ps1"
}

Import-Module Nvm

$OriginalPrompt = Get-Command prompt -CommandType Function

function prompt
{
  #NvmAutoUse

  $loc = Get-Location

  # Emulate standard PS prompt with location followed by ">"
  $out = "PS $loc> "
  #$out = & $OriginalPrompt

  # Or prettify the prompt by coloring its parts
  # Write-Host -NoNewline -ForegroundColor Cyan "PS "
  # Write-Host -NoNewline -ForegroundColor Yellow $loc
  # $out = "> "

  if (Is-ConEmuAnsi) {
    $out += Get-ConEmuPromptCursorPositionCommand

    if ($loc.Provider.Name -eq "FileSystem") {
      $out += Get-ConEmuConsoleWorkingDirectoryCommand($loc.Path)
    }

    $out += Get-ConEmuConsoleTitleCommand("pwsh")
  }

  return $out
}

# Partly based on https://gist.github.com/mklement0/290ef7cdbdf0db274d6da64fade46929
Set-PSReadLineKeyHandler -Key Enter -ScriptBlock {
  $line = $cursor = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref] $line, [ref] $cursor)

  if (Is-ConEmuAnsi) {
    Get-ConEmuConsoleTitleCommand($line) | Write-Host -NoNewline
  }

  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

New-Alias which get-command

$Env:NODE_OPTIONS='--max-old-space-size=4096'

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