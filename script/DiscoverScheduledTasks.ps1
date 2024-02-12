# Script: DiscoverSchelduledTasks
# Author: Romain Si
# Revision: Isaac de Moraes
# This script is intended for use with Zabbix > 3.x
#
#
# Add to Zabbix Agent
# UserParameter=TaskSchedulerMonitoring[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Program Files\Zabbix Agent\DiscoverScheduledTasks.ps1" "$1" "$2"
#
## Modifier la variable $path pour indiquer les sous dossiers de Tâches Planifiées à traiter sous la forme "\nomDossier\","\nomdossier2\sousdossier\" voir (Get-ScheduledTask -TaskPath )
## Change the $path variable to indicate the Scheduled Tasks subfolder to be processed as "\nameFolder\","\nameFolder2\subfolder\" see (Get-ScheduledTask -TaskPath )

$Paths = [string]$args[0]
$Item = [string]$args[1]

$ErrorActionPreference = "Stop"

switch ($Item) {
	"DiscoverTasks" {
 		$data = @()
   		$Paths = $Paths.replace('/','\') -split ',' | % { $_.Trim() }
		foreach ($path in $Paths) {
			$apptasks = Get-ScheduledTask -TaskPath $path | where { $_.state -ne "Disabled" }
			if ($NULL -eq $apptasks) { continue }

			foreach ($currentapptasks in $apptasks)	{
				$data += @{ "{#APPTASKS}" = $currentapptasks.TaskPath.replace("\","/") + $currentapptasks.TaskName }
			}
		}
		$json = @{ "data" = $data }
		$json | ConvertTo-Json | Write-Host
	}
}
