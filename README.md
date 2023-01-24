## Installation

To install, clone this repo to your $PROFILE location.
This is usually `C:\Users\<user>\Documents\PowerShell` for PowerShell 7 or `C:\Users\<user>\Documents\Windows_PowerShell` for earlier versions.

This directory will need to be empty of the clone command will fail.

```PowerShell
$profile_path = Split-Path -Path $PROFILE

# Create profile directory if it does not already exist
If(!(Test-Path -Path $profile_path)) {
	New-Item -ItemType Directory -Path $profile_path
}

git clone https://github.com/MarkEmmons/windot.git $profile_path
```