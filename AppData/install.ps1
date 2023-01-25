[CmdletBinding(
	PositionalBinding = $false
)]
Param(
	[Parameter(
		Mandatory = $false
	)]
	[Switch]
	$Clobber
)

$app_data_filter = @{
	Path = $PSScriptRoot
	Exclude = 'install.ps1'
	Recurse = $true
	File = $true
}

ForEach($src in $(Get-ChildItem @app_data_filter).FullName) {

	$src_rel = $src.Replace("$PSScriptRoot\", '')
	$dest = "$env:APPDATA\$src_rel"

	Write-Verbose -Message "$src -> $dest"

	If(!(Test-Path -Path $dest) -OR $Clobber) {
		New-Item -ItemType HardLink -Path $dest -Target $src -Force | Out-Null
	} Else {
		Write-Warning -Message "Destination file $dest already exists. To overrite re-run the script with '-Clobber'"
	}
}