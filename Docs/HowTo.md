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

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/SearchEventID2.png)

<br/>

The field “Message” contains the details of the event.

<br/>

Is also possible to search for a specific word in the message of the event:

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/Search1.png)

<br/>

In this case I was using the Event Message as source ("winlog.event_data.Detail"), since I didn't want an exact match I used “Like” as the filtering criteria, and “NewUser4” (an user account I had created a few minutes earlier).

<br/>

Once again, the details of the event were present correctly in the “Message” field.

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/Search2.png)

<br/>

Is even possible to combine searches into a unique query to be even more specific in the search:

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/SearchEventIDAND.png)

<br/>

Only 16 record were found.

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/SearchEventIDANDResult.png)

<br/>

One last thing. Don’t forget to set the time filtering correctly.

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/SearchDate.png)

<br/>

Is possible to configure the specific date or even time range inside the search bar if you need.

<br/>
