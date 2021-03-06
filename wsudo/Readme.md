### [https://chocolatey.org/packages/wsudo](https://chocolatey.org/packages/wsudo)

# Installation

    choco install wsudo --version=1.0.3

[Chocolatey](https://chocolatey.org/install) must already be installed.

# Purpose

`wsudo` is a Linux `sudo`-like tool for Windows to invoke a program with elevated rights (as Administrator) from a non-admin shell command prompt.
This implementation doesn't depend on the legacy Windows Script Host (`CScript`). Instead, it uses a helper PowerShell 5.1 script that invokes `"Start-Process -Wait -Verb runAs ..."` cmdlet. Your system most likely already has PowerShell 5.x installed, otherwise you'll be offered to install it as a dependency.

# Usage

`wsudo` runs a program or an inline command with elevated rights in the context of the current directory:

    C:\Users\Me>wsudo .\myAdminScript.bat 
    C:\Users\Me>wsudo del C:\Windows\Temp\*.* 

Internally, it invokes `cmd.exe` (`"%ComSpec% /K"`) elevating it and passing the whole command line over to it for execution. `wsudo` does not close the admin console when the command has finished, so it's easy to inspect the output or execute more commands as admin. You can also just type `wsudo` <kbd>Enter</kbd> to go to an admin mode command prompt at the current directory. `wsudo` is synchronous, so it only ends when the admin console it created is closed.

`wsudox` does the same besides using `"%ComSpec% /C"`, so it closes the admin console as soon as the command has finished ("wsudo**x**" is for e**X**it). It is also synchronous as it waits for the command to finish:

    C:\Users\Me>wsudox "del C:\Windows\Temp\*.* && pause"

`wasudo`/`wasudox` variants are different from `wsudo`/`wsudox` only in that they start the admin console and then immediately exit themselves. They don't wait for the admin console to close ("w**a**sudo" is for **A**synchronous). This is handy if you need to run something from the Windows Run UI (<kbd>Win+R</kbd>). E.g., to update all Chocolatey packages:

    wasudo cup all -y

In all cases, the specified command runs attached to and reusing the admin console created by any of `wsudo` variants. This makes sense for the most CLI-based commands. To run a GUI program as Administrator detached from the admin console (and thus close the admin console and exit immediately), you could use [start](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/start):

    wasudox start notepad C:\Windows\System32\drivers\etc\hosts 

Another example, run Windows Terminal in elevated mode in the current folder:

    wasudox start wt.exe -d %cd%

**Starting from v1.0.3**, another pair of aliases has been added for launching elevated GUI apps, `wsudog`/`wasudog`, so appending `start` as above is no longer needed:

    wasudog notepad.exe C:\Windows\System32\drivers\etc\hosts 
    wasudog wt.exe -d %cd%

I also often invoke `wasudo` from the Windows Run box (<kbd>Win</kbd>+<kbd>R</kbd>), or by typing `wasudo` <kbd>Enter</kbd> in the Windows Explorer address bar (<kbd>Alt</kbd>+<kbd>D</kbd>). The latter opens an admin command prompt in the Explorer's current folder.
