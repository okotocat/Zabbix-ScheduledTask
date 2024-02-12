# Zabbix-ScheduledTask

## Step 1:
### Copy folders to your zabbix_agent location
#### Normally is in "C:\Zabbix\"
#### example: C:\Zabbix\conf\zabbix_ag....

## Step 2:
#### Add host level macro {$TASKPATHS} (open host properties and look for the "Macros" tab) and specify your tasks location(s) in Task Scheduler Library, root is "/", custom folder may be "/CustomFolder/", several locations will be comma-separated: "/,/CustomFolder/"
#### default route is root " / " defined in template.

## Step 3:
#### Verify if your Windows Hosts is enable for execute scripts, if no, run in powershell:

    Set-ExecutionPolicy RemoteSigned
    
## Step 4:
#### Restart the Zabbix Agent

## Step 5:
#### Import template from Template_Tasks_Z6.0.xml in your zabbix server

## Step 6:
#### Bind the Template Windows Task Scheduled in host.
