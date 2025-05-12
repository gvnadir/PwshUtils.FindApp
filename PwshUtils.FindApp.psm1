Function Find-App {
	param(
		[string]$AppName
	)
	$FinalTable = @()

	$FinalTable += Find-AppCDrive -AppName $AppName -Path "C:\Program Files"
	$FinalTable += Find-AppCDrive -AppName $AppName -Path "C:\Program Files (x86)"
	$FinalTable += Find-AppCDrive -AppName $AppName -Path "C:\Users\$env:USERNAME\AppData\"
	$FinalTable += Find-MSStoreApp -AppName $AppName

	$FinalTable
}


Function Find-AppCDrive {
	param(
		[string]$AppName,
		[string]$Path
	)
	Write-Host "Checking $Path..."
	$Result = Get-ChildItem -Path $Path -Recurse -Filter "*$AppName*.exe" -ErrorAction SilentlyContinue
	if ($null -eq $Result) {
		Write-Host "No results found."
	}
	else {
		$hits = $Result | Select-Object Name, Directory | Measure-Object | Select-Object -ExpandProperty Count
		Write-Host "Found $hits $($hits -gt 1 ? "hits" : "hit")!"
		return ($Result | Select-Object Name, Directory)
	}
}
Function Find-MSStoreApp {
	param(
		[string]$AppName
	)
	Write-Host "Checking MSStore Installed Apps..."
	$Result = Get-AppxPackage *$AppName*
	if ($null -eq $Result) {
		Write-Host "No results found."
	}
	else {
		$hits = $Result | Select-Object Name, InstallLocation | Measure-Object | Select-Object -ExpandProperty Count
		Write-Host "Found $hits $($hits -gt 1 ? "hits" : "hit")!"
		return (
			$Result | Select-Object `
			@{Name = "Name"; Expression = { $_.Name } },
			@{Name = "Directory"; Expression = { $_.InstallLocation } }
		)
	}
}
		