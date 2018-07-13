#REGION Function declarations
Function Invoke-SessionLog {
    Param(
        [cmdletBinding()]
        [Parameter(Mandatory, Position = 0)]
        [String]$LogPath
    )

    $Oldlogs = Get-ChildItem -Path $LogPath -Recurse -Force
    foreach ($log in $Oldlogs) {

        If ($log.CreationTime -lt (Get-Date).AddDays(-7)) {

            Remove-Item $log.FullName -Force

        }
    }


    Start-Transcript -OutputDirectory $LogPath | Out-Null

}

#END REGION

#REGION Function calls (if needed)
Invoke-SessionLog -LogPath C:\Temp\PSLogs
#END REGION



