Function ConvertTo-Hex($Value) { '{0:x}' -f $Value }
Set-Alias -Name ctx -Value ConvertTo-Hex

Function ConvertFrom-Hex($Value) { [uint32]"0x$Value" }
Set-Alias -Name cfx -Value ConvertFrom-Hex

Function Get-HexMidPoint($a, $b) {

	$a = (ConvertFrom-Hex $a)
	$b = (ConvertFrom-Hex $b)

	If($a -gt $b) {

		$tmp = $a
		$a = $b
		$b = $tmp
	}

	$diff = $b - $a
	$mid_point = $a + [int]($diff / 2)
	Write-Host $mid_point

	ConvertTo-Hex $mid_point
}

Function Get-ColorMidPoint($a, $b) {

	$a = $a.TrimStart("#")
	$b = $b.TrimStart("#")

	$r = Get-HexMidPoint $a.Substring(0, 2) $b.Substring(0, 2)
	$g = Get-HexMidPoint $a.Substring(2, 2) $b.Substring(2, 2)
	$b = Get-HexMidPoint $a.Substring(4, 2) $b.Substring(4, 2)

	"$r$g$b"
}