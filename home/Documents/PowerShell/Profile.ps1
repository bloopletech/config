function prompt
{
  $loc = Get-Location

  # Emulate standard PS prompt with location followed by ">"
  $out = "PS $loc> "
  
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
