# See https://conemu.github.io/en/AnsiEscapeCodes.html#OSC_Operating_system_commands

function Is-ConEmuAnsi
{
  return $env:ConEmuANSI -eq "ON"
}

# Let ConEmu know when the prompt ends, to select typed
# command properly with "Shift+Home", to change cursor
# position in the prompt by simple mouse click, etc.
function Get-ConEmuPromptCursorPositionCommand
{
  return "$([char]27)]9;12$([char]7)"
}

function Get-ConEmuConsoleTitleCommand([string] $Title)
{
  return "$([char]27)]2;`"$($Title)`"$([char]7)"
}

# And current working directory (FileSystem)
# ConEmu may show full path or just current folder name
# in the Tab label (check Tab templates)
# Also this knowledge is crucial to process hyperlinks clicks
# on files in the output from compilers and source control
# systems (git, hg, ...)
function Get-ConEmuConsoleWorkingDirectoryCommand([string] $Cwd)
{
  return "$([char]27)]9;9;`"$($Cwd)`"$([char]7)"
}
