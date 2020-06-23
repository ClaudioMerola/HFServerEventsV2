# HFServerEventsV2

This is the new version of the HF Server Events (that was based on SQL Server). 

<br/>

This version is powered by (the opensource and free) ElasticSearch, Kibana and WinLogBeat.

Indeed the script basically install those solutions and configures them accordingly.

<br/><br/>

The script will:

<br/>

-	Enables the Event Forwarding on the Server 
-	Creates the Event Forwarding Subscriptions
-	Install ElasticSearch
-	Install Kibana*
-	Install WinLogBeat
-	Configure the Domain Controller to Forward Events


* *Kibana does not create the Windows Service by default. The script does that and sets the service as depended of ElasticSearch

<br/>

Even that WinLogBeat comes with default Dashboards in Kibana (and are enough to consult and beautifully manage the events). I’m creating new custom Dashboard to complement the solution as a whole.

<br/><br/>

## Requirements:

<br/>

The script expects the installation files from ElasticSearch, Kibana and WinLogBeats are present on the C: drive (any folder) in the server:

<br/>
- Windows Server

- ElasticSearch. (MSI Installer) can be downloaded from: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.0.msi 

-	Kibana. Download the ZIP file from: https://artifacts.elastic.co/downloads/kibana/kibana-7.8.0-windows-x86_64.zip 

-	WinLogBeat. (MSI Installer) can be downloaded from: https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.8.0-windows-x86_64.msi 

<br/><br/>

## Steps:

<br/>

1) Just put everything together and run the script :)
2) browse to http://servername:5601 and go to WinLogBeat Dashboards 



<br/>
