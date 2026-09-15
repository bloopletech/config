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
