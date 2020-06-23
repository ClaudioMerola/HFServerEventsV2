# HFServerEventsV2

Indeed the script basically install those solutions and configures them accordingly.

The script will:

-	Enables the Event Forwarding on the Server 
-	Creates the Event Forwarding Subscriptions
-	Install ElasticSearch
-	Install Kibana*
-	Install WinLogBeat
-	Configure the Domain Controller to Forward Events


* *Kibana does not create the Windows Service by default. The script does that and sets the service as depended of ElasticSearch

Even that WinLogBeat comes with default Dashboards in Kibana (and are enough to consult and beautifully manage the events). I’m creating new custom Dashboard to complement the solution as a whole.


## Requirements:

The script expects the installation files from ElasticSearch, Kibana and WinLogBeats are present on the C: drive in the server:

- ElasticSearch (MSI Installer) can be downloaded from: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.0.msi 

-	Kibana (There is no MSI installer) download the ZIP file from: https://artifacts.elastic.co/downloads/kibana/kibana-7.8.0-windows-x86_64.zip 

-	WinLogBeat (MSI Installer) can be downloaded from: https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.8.0-windows-x86_64.msi 

## Steps:

- Just put everything together and run the script :)

