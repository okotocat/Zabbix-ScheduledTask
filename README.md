# Zabbix-ScheduledTask

## Step 1:
#### Copy the *.ps1 files to the zabbix_agent2\script folder
#### Normally is in "C:\Zabbix\"
#### C:\Zabbix\script\*.ps1
#### Copy config file to zabbix_agent2 config folder
#### C:\Zabbix\conf\zabbix_agent2.d\plugins.d\Zabbix-ScheduledTask.conf

## Step 2:
#### Add host level macro {$TASKPATHS} (open host properties and look for the "Macros" tab) and specify your tasks location(s) in Task Scheduler Library, root is "/", custom folder may be "/CustomFolder/", several locations will be comma-separated: "/,/CustomFolder/"
#### default route is root " / " defined in template.

## Step 3:
#### Verify if your Windows Hosts is enable for execute scripts, if no, run in powershell:

    Set-ExecutionPolicy RemoteSigned
    
## Step 4:
#### Restart the Zabbix Agent

## Step 5:
#### Bind the Template Windows Task Scheduled in host.
