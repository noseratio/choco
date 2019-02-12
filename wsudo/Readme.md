### [https://chocolatey.org/packages/wsudo](https://chocolatey.org/packages/wsudo)

    choco install wsudo --version 1.0.0

# Purpose

Invoke a program with elevated rights (as Administrator) from a non-admin shell command prompt.<br>
This implementation doesn't depend on the legacy Windows Script Host (`CScript`).<br>
Instead, it uses a helper PowerShell 5.0 script that invokes `"Start-Process -Wait -Verb runAs ..."` cmdlet.

# Usage

`wsudo` runs a program or an inline command with elevated rights in the current directory:

    C:\Users\User>wsudo del C:\Windows\Temp\*.* 

Internally, it invokes `"%ComSpec% /K"` elevated and passes the command line over to it for execution. It keeps the admin console open when the command has finished.

`wsudox` does the same besides using `"%ComSpec% /K"`, so it closes the console as soon as the command has finished:

    C:\Users\User>wsudox "del C:\Windows\Temp\*.* && pause"

To run a GUI program and close the console immediately, just use the [start](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/start) inline command:

    wsudox start notepad C:\Windows\System32\drivers\etc\hosts 
