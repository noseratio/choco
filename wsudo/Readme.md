### [https://chocolatey.org/packages/wsudo](https://chocolatey.org/packages/wsudo)

# Installation

    choco install wsudo

[Chocolatey](https://chocolatey.org/install) must already be installed.

# Purpose

`wsudo` is a Linux `sudo`-like tool for Windows to invoke a program with elevated rights (as Administrator) from a non-admin shell command prompt.
This implementation doesn't depend on the legacy Windows Script Host (`CScript`). Instead, it uses a helper PowerShell 5 script that invokes `"Start-Process -Wait -Verb runAs ..."` cmdlet. Your system most likely already has PowerShell 5.x installed, otherwise you'll be offered to install it as a dependency.

# Usage

`wsudo` runs a program or an inline command with elevated rights in the context of the current directory:

    C:\Users\Me>wsudo .\myAdminScript.bat 
    C:\Users\Me>wsudo del C:\Windows\Temp\*.* 

Internally, it invokes `cmd.exe` (`"%ComSpec% /K"`) elevated and passes the command line over to it for execution. It keeps the admin console open once the command has finished. Or, one can just type `wsudo` <kbd>Enter</kbd> to go to an admin mode command prompt at the current directory.

`wsudox` does the same besides using `"%ComSpec% /C"`, so it closes the admin console as soon as the command has finished:

    C:\Users\Me>wsudox "del C:\Windows\Temp\*.* && pause"

To run a GUI program as Administrator and close the admin console immediately, just launch it via the [start](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/start) inline command:

    C:\Users\Me>wsudox start notepad C:\Windows\System32\drivers\etc\hosts 
