# Common Paths
$DOCUMENTS = "$HOME\Documents"
$DOWNLOADS = "$HOME\Downloads"
$WORKSPACE = "$DOCUMENTS\workspace"

# Default location
Set-Location -Path $DOCUMENTS
Function dc { Set-Location -Path $DOCUMENTS }
Function dl { Set-Location -Path $DOWNLOADS }
Function re { Set-Location -Path $WORKSPACE }

# Close PowerShell with Ctrl+d
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit

# Enhanced Tab Completion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -ShowToolTips

# Better History Search
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Better cd
Remove-Alias -Name cd
Function cd {
	If($args.Length -eq 0) {
		Push-Location $HOME
	} ElseIf("$args" -eq '-') {
		Pop-Location
	} Else {
		Push-Location "$args"
	}
}

# PERL-isms
Function ql { $args }
Function qs { "$args" }

# Add programs
Function Add-ToPath($Path) {
	$env:Path += ";$Path"
}

Add-ToPath -Path "C:\Program Files\qemu"

# Aliases
Set-Alias -Name l -Value Get-ChildItem
Set-Alias -Name v -Value 'C:\Program Files\Neovim\bin\nvim.exe'