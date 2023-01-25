# Installation

## Powershell

To install, clone this repo to your $PROFILE location.
This is usually `C:\Users\<user>\Documents\PowerShell` for PowerShell 7 or `C:\Users\<user>\Documents\Windows_PowerShell` for earlier versions.

This directory will need to be empty or the clone command will fail.

```PowerShell
$profile_path = Split-Path -Path $PROFILE

# Create profile directory if it does not already exist
If(!(Test-Path -Path $profile_path)) {
	New-Item -ItemType Directory -Path $profile_path
}

git clone https://github.com/MarkEmmons/windot.git $profile_path
```

## AppData

The `AppData` folder contains the config files from `C:\Users\<user>\AppData\Roaming`. These must mirror the structure of the destination folder exactly, but need not include every file from the destination.

To install run the `install.ps1` script. It will create hardlinks from the repo to the destination folder, so the files can be modified from either location and will reflect in both the program and source control. In order to create the links you will need to either (a) run the script as Admin, or (b) enable [Developer Mode](https://learn.microsoft.com/en-us/windows/apps/get-started/developer-mode-features-and-debugging).

If a file already exists the install script will not replace it by default. To modify this behavior, include the `-Clobber` argument.