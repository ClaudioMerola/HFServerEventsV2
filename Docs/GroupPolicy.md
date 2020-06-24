# Group Policy Recommendations 

<br/>

I recommend that you configure 2 extra GPOs to be applied to your Domain Controllers. One to configure the Event Forwarding to the Event Collector Server, and one for configure the auditing settings to record the events we need to forward. 

<br/>

There are many guides on the internet on how to configure the Event Forward trough GPO, but I have created a GPO template that you can import in your environment. You just need to change the name of your collector server

<br/>

There is also a template I have created with the Auditing settings you should set in your environment. If you are already using the Microsoft Security Compliance Baseline Toolkit (https://www.microsoft.com/en-us/download/confirmation.aspx?id=55319) you don’t need to use this template since all those auditing is already present in the Microsoft’s baseline.

<br/>

If you want to use the templates I created, you can download them here: 
https://github.com/ClaudioMerola/HFServerEventsV2/blob/master/GPO/HFEventServer.zip 

<br/>

## Applying the templates

<br/>

After you have downloaded the templates and have copied the extracted files to a Domain Controller. Do the following:

<br/>

1) Create a new GPO:

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/GPO1.png)

<br/>

2) Now you have an empty GPO, right click and select "Import Settings":

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/GPO2.png)

<br/>

3) Browse to the folder containing the extracted Templates and select the "HF Event Server - Forwarder":

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/GPO3.png)

<br/>

4) Now you need to edit this GPO and configure your server's name:

![alt text](https://github.com/ClaudioMerola/HFServerEventsV2/raw/master/Docs/img/GPO4.png)

<br/>

Now repeat the steps 1, 2 and 3 only for the template "HF Event Server - Domain Controllers" (this template only contains the auditing settings and nothing extra has to be done)

<br/>

Just apply both GPOs in the Domain Controllers containner.
