# How to Do stuff in Kibana

<br/>

After you have run the script and your server is automatically configured as Event Forwarder Collector with ElasticSearch, Kibana and WinLogBeat correctly installed, is time to dig in Kibana and start to extract information.  

<br/>

You probably have already checked the default Winlogbeat dashboard:   

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/winlogdashboard.png)

<br/>

But for deep searching and event filtering you have to use the “Discover” part of Kibana.   

<br/>

In the “Discover” you can search for a specific Event ID for example:

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/SearchEventID.png)

<br/>

For that, in the search bar you should select the source of the data, in this case: "winlog.event_id", the next thing is if you want an exact match (":") or a ("like" for example), and then the Event ID your looking for.

<br/>

The matching logged events are presented down below, and you can expand them to see the details of every reported event:



<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
