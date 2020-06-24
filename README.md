# HF Server Events (V2)

#### This is the new version of the HF Server Events. 

<br/>

This version is powered by (the opensource and free) ElasticSearch, Kibana and WinLogBeat:
<br/>

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/Dashboard.png)

<br/>

Indeed the script basically install those solutions and configures them accordingly. 

First of all. Nothing of that would be possible without Elastic Stack solutions and Jean-François Larvoire’s script on how to create a Windows Service using powershell  

<br/>

The script will:

<br/>

-	Enables the Event Forwarding on the Server 
-	Creates the Event Forwarding Subscriptions
-	Install ElasticSearch
-	Install Kibana*
-	Install WinLogBeat
-	Configure the Domain Controller to Forward Events**


* *Kibana does not create the Windows Service by default. The script does that and sets the service as depended of ElasticSearch

<br/>

** *Even the script will try to configure the Event Forward Subscription on each Domain Controller. I advise to configure a GPO to set the Event Forward (a template GPO is available in the GPO folder is this repository)

<br/><br/>

## Requirements:

<br/>

The script expects the installation files from ElasticSearch, Kibana and WinLogBeats are present on the C: drive (at any folder) in the server:

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/Install.png)

<br/>

- Windows Server (I used Windows Server 2019 on the testing phase. But it should work on at least Windows Server 2012 R2)

- ElasticSearch. (MSI Installer) can be downloaded from: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.0.msi 

-	Kibana. Download the ZIP file from: https://artifacts.elastic.co/downloads/kibana/kibana-7.8.0-windows-x86_64.zip 

-	WinLogBeat. (MSI Installer) can be downloaded from: https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.8.0-windows-x86_64.msi 

<br/><br/>

## Steps:

<br/>

1) Just put everything together and run the script :)
2) browse to http://servername:5601 and go to WinLogBeat Dashboards 

<br/><br/>

## Post Install:

<br/>

After the script finishes. If everything ran smoothly you should see events start to appear in the Forwarded Events in the Server

<br/>

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/ForwardedEvents.png)

<br/>

The next thing you should do is to open Internet Explorer on the server and browse to: http://localhost:5601. This will open Kibana Portal.

You should be presented with the Kibana home. At the home there are 3 main areas you will use:

- Dashboards (for overall view and consolidated status of Collector Server) 
- Visualize (for custom reports and graphics of specific status) 
- Discover (for details and event searches)

<br/>

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/Home.png)

<br/>

Details on how to use the “Discover” sections are present in the HOW TO SEARCH IN KIBANA document

<br/>

If you are not presented with the Kibana home, or are presented with a screen asking to configure the index pattern. Re-run the script’s phase that configures the WinLogBeat:

<br/>

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/script4.png)

<br/>

In the back level this will run the WinLogBeat “Setup” parameter. That will create the Index Patterns, dashboards and etc. in Kibana

<br/>

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/winlogbeatkibana.png)

<br/>

