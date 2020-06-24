if ((Test-Path -Path C:\EvtHFv2 -PathType Container) -eq $false) {New-Item -Type Directory -Force -Path C:\EvtHFv2}

$EvtServer = ((Get-WmiObject win32_computersystem).DNSHostName+"."+(Get-WmiObject win32_computersystem).Domain)

#$EvtServerIP = (Get-NetIPAddress | ? {$_.InterfaceAlias -notlike '*Loopback*' -and $_.AddressFamily -eq 'IPv4'}).IPaddress


$Forest = [system.directoryservices.activedirectory.Forest]::GetCurrentForest()

$DCs = $Forest.domains | ForEach-Object {$_.DomainControllers}


##################################################################################################
#                                                                                                #
#                                                                                                #
#                                        COLLECTOR SETUP                                         #
#                                                                                                #
#                                                                                                #
##################################################################################################


function Collector {

if ((Test-Path -Path C:\EvtHFv2\Collector -PathType Container) -eq $false) {New-Item -Type Directory -Force -Path C:\EvtHFv2\Collector}

$DCSec = ("C:\EvtHFv2\Collector\EvtHF_DC_Sec.xml") 
if ((test-path $DCSec) -eq $false) {new-item $DCSec -Type file -Force}
Clear-Content $DCSec

$DCSys = ("C:\EvtHFv2\Collector\EvtHF_DC_Sys.xml") 
if ((test-path $DCSys) -eq $false) {new-item $DCSys -Type file -Force}
Clear-Content $DCSys


$XMLDCSec = @'
<?xml version="1.0" encoding="UTF-8"?>
<Subscription xmlns="http://schemas.microsoft.com/2006/03/windows/events/subscription">
	<SubscriptionId>HFEventServer_DC_Security</SubscriptionId>
	<SubscriptionType>SourceInitiated</SubscriptionType>
	<Description></Description>
	<Enabled>true</Enabled>
	<Uri>http://schemas.microsoft.com/wbem/wsman/1/windows/EventLog</Uri>
	<ConfigurationMode>Custom</ConfigurationMode>
	<Delivery Mode="Push">
		<Batching>
			<MaxLatencyTime>900000</MaxLatencyTime>
		</Batching>
		<PushSettings>
			<Heartbeat Interval="900000"/>
		</PushSettings>
	</Delivery>
<Query>
		<![CDATA[
<QueryList>
    <Query Id="0"><Select Path="Security">*[System[(EventID=4618 or EventID=4618 or EventID=4649 or EventID=4719 or EventID=4765 or EventID=4766 or EventID=4794 or EventID=4897)]]</Select></Query>
    <Query Id="1"><Select Path="Security">*[System[(EventID=4964 or EventID=5124 or EventID=1102 or EventID=4621 or EventID=4675 or EventID=4692 or EventID=4693 or EventID=4706)]]</Select></Query>
    <Query Id="2"><Select Path="Security">*[System[(EventID=4713 or EventID=4714 or EventID=4715 or EventID=4716 or EventID=4724 or EventID=4727 or EventID=4735 or EventID=4737)]]</Select></Query>
    <Query Id="3"><Select Path="Security">*[System[(EventID=4739 or EventID=4754 or EventID=4755 or EventID=4764 or EventID=4764 or EventID=4780 or EventID=4816 or EventID=4865)]]</Select></Query>
    <Query Id="4"><Select Path="Security">*[System[(EventID=4866 or EventID=4867 or EventID=4868 or EventID=4870 or EventID=4882 or EventID=4885 or EventID=4890 or EventID=4892)]]</Select></Query>
    <Query Id="5"><Select Path="Security">*[System[(EventID=4896 or EventID=4906 or EventID=4907 or EventID=4908 or EventID=4912 or EventID=4960 or EventID=4961 or EventID=4962)]]</Select></Query>
    <Query Id="6"><Select Path="Security">*[System[(EventID=4963 or EventID=4965 or EventID=4976 or EventID=4977 or EventID=4978 or EventID=4983 or EventID=4984 or EventID=5027)]]</Select></Query>
    <Query Id="7"><Select Path="Security">*[System[(EventID=5028 or EventID=5029 or EventID=5030 or EventID=5035 or EventID=5037 or EventID=5038 or EventID=5120 or EventID=5121)]]</Select></Query>
    <Query Id="8"><Select Path="Security">*[System[(EventID=5122 or EventID=5123 or EventID=5376 or EventID=5377 or EventID=5453 or EventID=5480 or EventID=5483 or EventID=5484)]]</Select></Query>
    <Query Id="9"><Select Path="Security">*[System[(EventID=5485 or EventID=6145 or EventID=6273 or EventID=6274 or EventID=6275 or EventID=6276 or EventID=6277 or EventID=6278)]]</Select></Query>
    <Query Id="10"><Select Path="Security">*[System[(EventID=6279 or EventID=6280 or EventID=24586 or EventID=24592 or EventID=24593 or EventID=24594 or EventID=4608 or EventID=4609)]]</Select></Query>
    <Query Id="11"><Select Path="Security">*[System[(EventID=4610 or EventID=4611 or EventID=4612 or EventID=4614 or EventID=4615 or EventID=4616 or EventID=4622 or EventID=4624)]]</Select></Query>
    <Query Id="12"><Select Path="Security">*[System[(EventID=4625 or EventID=4634 or EventID=4646 or EventID=4647 or EventID=4648 or EventID=4650 or EventID=4651 or EventID=4652)]]</Select></Query>
    <Query Id="13"><Select Path="Security">*[System[(EventID=4653 or EventID=4654 or EventID=4655 or EventID=4656 or EventID=4657 or EventID=4658 or EventID=4659 or EventID=4660)]]</Select></Query>
    <Query Id="14"><Select Path="Security">*[System[(EventID=4661 or EventID=4662 or EventID=4663 or EventID=4664 or EventID=4665 or EventID=4666 or EventID=4667 or EventID=4668)]]</Select></Query>
    <Query Id="15"><Select Path="Security">*[System[(EventID=4670 or EventID=4671 or EventID=4672 or EventID=4673 or EventID=4674 or EventID=4688 or EventID=4689 or EventID=4690)]]</Select></Query>
    <Query Id="16"><Select Path="Security">*[System[(EventID=4691 or EventID=4694 or EventID=4695 or EventID=4696 or EventID=4697 or EventID=4698 or EventID=4699 or EventID=4700)]]</Select></Query>
    <Query Id="17"><Select Path="Security">*[System[(EventID=4701 or EventID=4702 or EventID=4704 or EventID=4705 or EventID=4707 or EventID=4709 or EventID=4710 or EventID=4711)]]</Select></Query>
    <Query Id="18"><Select Path="Security">*[System[(EventID=4712 or EventID=4717 or EventID=4718 or EventID=4720 or EventID=4722 or EventID=4723 or EventID=4725 or EventID=4726)]]</Select></Query>
    <Query Id="19"><Select Path="Security">*[System[(EventID=4728 or EventID=4729 or EventID=4730 or EventID=4731 or EventID=4732 or EventID=4733 or EventID=4734 or EventID=4738)]]</Select></Query>
    <Query Id="20"><Select Path="Security">*[System[(EventID=4740 or EventID=4741 or EventID=4742 or EventID=4743 or EventID=4744 or EventID=4745 or EventID=4746 or EventID=4747)]]</Select></Query>
    <Query Id="21"><Select Path="Security">*[System[(EventID=4748 or EventID=4749 or EventID=4750 or EventID=4751 or EventID=4752 or EventID=4753 or EventID=4756 or EventID=4757)]]</Select></Query>
    <Query Id="22"><Select Path="Security">*[System[(EventID=4758 or EventID=4759 or EventID=4760 or EventID=4761 or EventID=4762 or EventID=4767 or EventID=4768 or EventID=4769)]]</Select></Query>
    <Query Id="23"><Select Path="Security">*[System[(EventID=4770 or EventID=4771 or EventID=4772 or EventID=4774 or EventID=4775 or EventID=4776 or EventID=4777 or EventID=4778)]]</Select></Query>
    <Query Id="24"><Select Path="Security">*[System[(EventID=4779 or EventID=4781 or EventID=4782 or EventID=4783 or EventID=4784 or EventID=4785 or EventID=4786 or EventID=4787)]]</Select></Query>
    <Query Id="25"><Select Path="Security">*[System[(EventID=4788 or EventID=4789 or EventID=4790 or EventID=4793 or EventID=4800 or EventID=4801 or EventID=4802 or EventID=4803)]]</Select></Query>
    <Query Id="26"><Select Path="Security">*[System[(EventID=4864 or EventID=4869 or EventID=4871 or EventID=4872 or EventID=4873 or EventID=4874 or EventID=4875 or EventID=4876)]]</Select></Query>
    <Query Id="27"><Select Path="Security">*[System[(EventID=4877 or EventID=4878 or EventID=4879 or EventID=4880 or EventID=4881 or EventID=4883 or EventID=4884 or EventID=4886)]]</Select></Query>
    <Query Id="28"><Select Path="Security">*[System[(EventID=4887 or EventID=4888 or EventID=4889 or EventID=4891 or EventID=4893 or EventID=4894 or EventID=4895 or EventID=4898)]]</Select></Query>
    <Query Id="29"><Select Path="Security">*[System[(EventID=4902 or EventID=4904 or EventID=4905 or EventID=4909 or EventID=4910 or EventID=4928 or EventID=4929 or EventID=4930)]]</Select></Query>
    <Query Id="30"><Select Path="Security">*[System[(EventID=4931 or EventID=4932 or EventID=4933 or EventID=4934 or EventID=4935 or EventID=4936 or EventID=4937 or EventID=4944)]]</Select></Query>
    <Query Id="31"><Select Path="Security">*[System[(EventID=4945 or EventID=4946 or EventID=4947 or EventID=4948 or EventID=4949 or EventID=4950 or EventID=4951 or EventID=4952)]]</Select></Query>
    <Query Id="32"><Select Path="Security">*[System[(EventID=4953 or EventID=4954 or EventID=4956 or EventID=4957 or EventID=4958 or EventID=4979 or EventID=4980 or EventID=4981)]]</Select></Query>
    <Query Id="33"><Select Path="Security">*[System[(EventID=4982 or EventID=4985 or EventID=5024 or EventID=5025 or EventID=5031 or EventID=5032 or EventID=5033 or EventID=5034)]]</Select></Query>
    <Query Id="34"><Select Path="Security">*[System[(EventID=5039 or EventID=5040 or EventID=5041 or EventID=5042 or EventID=5043 or EventID=5044 or EventID=5045 or EventID=5046)]]</Select></Query>
    <Query Id="35"><Select Path="Security">*[System[(EventID=5047 or EventID=5048 or EventID=5050 or EventID=5051 or EventID=5056 or EventID=5057 or EventID=5058 or EventID=5059)]]</Select></Query>
    <Query Id="36"><Select Path="Security">*[System[(EventID=5060 or EventID=5061 or EventID=5062 or EventID=5063 or EventID=5064 or EventID=5065 or EventID=5066 or EventID=5067)]]</Select></Query>
    <Query Id="37"><Select Path="Security">*[System[(EventID=5068 or EventID=5069 or EventID=5070 or EventID=5125 or EventID=5126 or EventID=5127 or EventID=5136 or EventID=5137)]]</Select></Query>
    <Query Id="38"><Select Path="Security">*[System[(EventID=5138 or EventID=5139 or EventID=5140 or EventID=5141 or EventID=5152 or EventID=5153 or EventID=5154 or EventID=5155)]]</Select></Query>
    <Query Id="39"><Select Path="Security">*[System[(EventID=5156 or EventID=5157 or EventID=5158 or EventID=5159 or EventID=5378 or EventID=5440 or EventID=5441 or EventID=5442)]]</Select></Query>
    <Query Id="40"><Select Path="Security">*[System[(EventID=5443 or EventID=5444 or EventID=5446 or EventID=5447 or EventID=5448 or EventID=5449 or EventID=5450 or EventID=5451)]]</Select></Query>
    <Query Id="41"><Select Path="Security">*[System[(EventID=5452 or EventID=5456 or EventID=5457 or EventID=5458 or EventID=5459 or EventID=5460 or EventID=5461 or EventID=5462)]]</Select></Query>
    <Query Id="42"><Select Path="Security">*[System[(EventID=5463 or EventID=5464 or EventID=5465 or EventID=5466 or EventID=5467 or EventID=5468 or EventID=5471 or EventID=5472)]]</Select></Query>
    <Query Id="43"><Select Path="Security">*[System[(EventID=5473 or EventID=5474 or EventID=5477 or EventID=5479 or EventID=5632 or EventID=5633 or EventID=5712 or EventID=5888)]]</Select></Query>
    <Query Id="44"><Select Path="Security">*[System[(EventID=5889 or EventID=5890 or EventID=6008 or EventID=6144 or EventID=6272 or EventID=24577 or EventID=24578 or EventID=24579)]]</Select></Query>
    <Query Id="45"><Select Path="Security">*[System[(EventID=24580 or EventID=24581 or EventID=24582 or EventID=24583 or EventID=24584 or EventID=24588 or EventID=24595 or EventID=24621)]]</Select></Query>
    <Query Id="46"><Select Path="Security">*[System[(EventID=5049 or EventID=5478)]]</Select></Query>
    </QueryList>
        ]]>
	</Query>
	<ReadExistingEvents>false</ReadExistingEvents>
	<TransportName>HTTP</TransportName>
	<ContentFormat>RenderedText</ContentFormat>
	<Locale Language="en-US"/>
	<LogFile>ForwardedEvents</LogFile>
	<PublisherName>Microsoft-Windows-EventCollector</PublisherName>
	<AllowedSourceNonDomainComputers>
		<AllowedIssuerCAList>
		</AllowedIssuerCAList>
	</AllowedSourceNonDomainComputers>
	<AllowedSourceDomainComputers>O:NSG:BAD:P(A;;GA;;;DD)S:</AllowedSourceDomainComputers>
</Subscription>
'@

Add-Content $DCSec $XMLDCSec


$XMLDCSys = @'
<?xml version="1.0" encoding="UTF-8"?>
<Subscription xmlns="http://schemas.microsoft.com/2006/03/windows/events/subscription">
	<SubscriptionId>HFEventServer_DC_System</SubscriptionId>
	<SubscriptionType>SourceInitiated</SubscriptionType>
	<Description></Description>
	<Enabled>true</Enabled>
	<Uri>http://schemas.microsoft.com/wbem/wsman/1/windows/EventLog</Uri>
	<ConfigurationMode>Custom</ConfigurationMode>
	<Delivery Mode="Push">
		<Batching>
			<MaxLatencyTime>900000</MaxLatencyTime>
		</Batching>
		<PushSettings>
			<Heartbeat Interval="900000"/>
		</PushSettings>
	</Delivery>
<Query>
		<![CDATA[
<QueryList><Query Id="0"><Select Path="System">*[System[(Level=1  or Level=2 or Level=3)]]</Select></Query></QueryList>
		]]>
	</Query>
	<ReadExistingEvents>false</ReadExistingEvents>
	<TransportName>HTTP</TransportName>
	<ContentFormat>RenderedText</ContentFormat>
	<Locale Language="en-US"/>
	<LogFile>ForwardedEvents</LogFile>
	<PublisherName>Microsoft-Windows-EventCollector</PublisherName>
	<AllowedSourceNonDomainComputers>
		<AllowedIssuerCAList>
		</AllowedIssuerCAList>
	</AllowedSourceNonDomainComputers>
	<AllowedSourceDomainComputers>O:NSG:BAD:P(A;;GA;;;DD)S:</AllowedSourceDomainComputers>
</Subscription>
'@

Add-Content $DCSys $XMLDCSys

Invoke-Command -ScriptBlock {winrm quickconfig} 
Invoke-Command -ScriptBlock {net stop wecsvc}
Invoke-Command -ScriptBlock {net start wecsvc}
Invoke-Command -ScriptBlock {wecutil qc /quiet}
Invoke-Command -ScriptBlock {wecutil cs $DCSec}
Invoke-Command -ScriptBlock {wecutil cs $DCSys}
#Invoke-Command -ScriptBlock {New-NetFirewallRule -DisplayName 'Kibana Portal' -Direction Inbound -LocalPort 5601 -Protocol TCP -Action Allow}
Invoke-Command -ScriptBlock {netsh http delete urlacl url=http://+:5985/wsman/}
Invoke-Command -ScriptBlock {netsh http add urlacl url=http://+:5985/wsman/ sddl="D:(A;;GX;;;S-1-5-80-569256582-2953403351-2909559716-1301513147-412116970)(A;;GX;;;S-1-5-80-4059739203-877974739-1245631912-527174227-2996563517)"}
Invoke-Command -ScriptBlock {net stop WinRM}
Invoke-Command -ScriptBlock {net start WinRM}
Invoke-Command -ScriptBlock {net stop wecsvc}
Invoke-Command -ScriptBlock {net start wecsvc}
Set-Itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\ForwardedEvents' -Name 'MaxSize' -value '1055129600'


}

##################################################################################################
#                                                                                                #
#                                                                                                #
#                                   ELASTICSEARCH INSTALLATION                                   #
#                                                                                                #
#                                                                                                #
##################################################################################################


function ElasticSearch {

#Write-Host 'How many hosts does the Cluster is going to have?'
#$s = Read-Host 

$Elastic = ('C:\'+(Get-ChildItem -Path C:\ -Name '*elasticsearch*.msi' -Recurse))

#start-job -Name 'ElasticSearch' -ScriptBlock {msiexec.exe /i $($args[0]) /qn CLUSTERNAME='HFEvents' NETWORKHOST=$($args[1])} -ArgumentList $Elastic, $EvtServer

start-job -Name 'ElasticSearch' -ScriptBlock {msiexec.exe /i $($args[0]) /qn CLUSTERNAME='HFEvents'} -ArgumentList $Elastic

Get-Job -Name 'ElasticSearch' | Wait-Job

Get-Job -Name 'ElasticSearch' | Remove-Job

}

##################################################################################################
#                                                                                                #
#                                                                                                #
#                                   KIBANA INSTALLATION                                          #
#                                                                                                #
#                                                                                                #
##################################################################################################

function Kibana {

if ((Test-Path -Path C:\EvtHFv2\Kibana -PathType Container) -eq $false) {New-Item -Type Directory -Force -Path C:\EvtHFv2\Kibana}

$kibana = (Get-ChildItem -Path C:\ -Name '*kibana*.zip' -Recurse)

Expand-Archive -Path ('C:\'+$kibana) -DestinationPath 'C:\EvtHFv2\Kibana'

$kibanaFile = ('C:\EvtHFv2\Kibana\'+(Get-ChildItem -Path 'C:\EvtHFv2\Kibana' -Name '*kibana.bat' -Recurse))

$kibanaFile = $kibanaFile.replace('\','\\')

$source = @"
  using System;
  using System.ServiceProcess;
  using System.Diagnostics;
  using System.Runtime.InteropServices;
  using System.ComponentModel;
  using System.Timers;

  public enum ServiceType : int {
    SERVICE_WIN32_OWN_PROCESS = 0x00000010,
    SERVICE_WIN32_SHARE_PROCESS = 0x00000020,
  };

  public enum ServiceState : int {
    SERVICE_STOPPED = 0x00000001,
    SERVICE_START_PENDING = 0x00000002,
    SERVICE_STOP_PENDING = 0x00000003,
    SERVICE_RUNNING = 0x00000004,
    SERVICE_CONTINUE_PENDING = 0x00000005,
    SERVICE_PAUSE_PENDING = 0x00000006,
    SERVICE_PAUSED = 0x00000007,
  };

  [StructLayout(LayoutKind.Sequential)]
  public struct ServiceStatus {
    public ServiceType dwServiceType;
    public ServiceState dwCurrentState;
    public int dwControlsAccepted;
    public int dwWin32ExitCode;
    public int dwServiceSpecificExitCode;
    public int dwCheckPoint;
    public int dwWaitHint;
  };

  public enum Win32Error : int {
    NO_ERROR = 0,
    ERROR_APP_INIT_FAILURE = 575,
    ERROR_FATAL_APP_EXIT = 713,
    ERROR_SERVICE_NOT_ACTIVE = 1062,
    ERROR_EXCEPTION_IN_SERVICE = 1064,
    ERROR_SERVICE_SPECIFIC_ERROR = 1066,
    ERROR_PROCESS_ABORTED = 1067,
  };

  public class Service_HFKibana : ServiceBase {
    private ServiceStatus serviceStatus;

    public Service_HFKibana() {
      ServiceName = "HFKibana";
      CanStop = true;
      CanPauseAndContinue = false;
      AutoLog = true;
    }

    [DllImport("advapi32.dll", SetLastError=true)]
    private static extern bool SetServiceStatus(IntPtr handle, ref ServiceStatus serviceStatus);

    protected override void OnStart(string [] args) {
      Timer timer = new Timer();
      timer.Interval = 60000; // 60 seconds
      timer.Start();
      serviceStatus.dwServiceType = ServiceType.SERVICE_WIN32_OWN_PROCESS;
      serviceStatus.dwCurrentState = ServiceState.SERVICE_START_PENDING;
      serviceStatus.dwWin32ExitCode = 0;
      serviceStatus.dwWaitHint = 10000;
      SetServiceStatus(ServiceHandle, ref serviceStatus);
      try {  
        Process p = new Process();
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.RedirectStandardOutput = true;
        p.StartInfo.FileName = "$kibanaFile";
        p.Start();
        serviceStatus.dwCurrentState = ServiceState.SERVICE_RUNNING;
      } catch (Exception e) {
        serviceStatus.dwCurrentState = ServiceState.SERVICE_STOPPED;
        Win32Exception w32ex = e as Win32Exception;
        if (w32ex == null) {
          w32ex = e.InnerException as Win32Exception;
        }    
        if (w32ex != null) {
          serviceStatus.dwWin32ExitCode = w32ex.NativeErrorCode;
        } else {
          serviceStatus.dwWin32ExitCode = (int)(Win32Error.ERROR_APP_INIT_FAILURE);
        }
      } finally {
        serviceStatus.dwWaitHint = 0;
        SetServiceStatus(ServiceHandle, ref serviceStatus);
      }
    }

       protected override void OnStop() {
      try {
        Process p = new Process();
        p.StartInfo.UseShellExecute = false;
        p.StartInfo.RedirectStandardOutput = true;
        p.StartInfo.FileName = "$kibanaFile";
        p.Start();
        string output = p.StandardOutput.ReadToEnd();
        p.WaitForExit();
        if (p.ExitCode != 0) throw new Win32Exception((int)(Win32Error.ERROR_APP_INIT_FAILURE));
        serviceStatus.dwCurrentState = ServiceState.SERVICE_STOPPED;
      } catch (Exception e) {
        serviceStatus.dwCurrentState = ServiceState.SERVICE_RUNNING;
        Win32Exception w32ex = e as Win32Exception;
        if (w32ex == null) {
          w32ex = e.InnerException as Win32Exception;
        }    
        if (w32ex != null) {
          serviceStatus.dwWin32ExitCode = w32ex.NativeErrorCode;
        } else {
          serviceStatus.dwWin32ExitCode = (int)(Win32Error.ERROR_APP_INIT_FAILURE);
        }
      } finally {
        serviceStatus.dwWaitHint = 0;
        SetServiceStatus(ServiceHandle, ref serviceStatus);
      }
    }

    public static void Main() {
      System.ServiceProcess.ServiceBase.Run(new Service_HFKibana());
    }
  }
"@

Add-Type -TypeDefinition $source -Language CSharp -OutputAssembly C:\EvtHFv2\Kibana\HFKibana.exe -OutputType ConsoleApplication -ReferencedAssemblies "System.ServiceProcess" -Debug:$false

New-Service -Name 'HFKibana' -DisplayName 'Elastic Kibana' -Description 'This Service was created and configured by HF Event Server. This is not part of the Elastic Stack' -BinaryPathName 'C:\EvtHFv2\Kibana\HFKibana.exe' -StartupType Boot -DependsOn 'elasticsearch'

Invoke-Command -ScriptBlock {sc.exe config HFKibana start=delayed-auto }

$Kibanafile = @"
server.port: 5601

server.host: "0.0.0.0"

server.name: "HF Event Server"

elasticsearch.hosts: ["http://localhost:9200"]
"@

$Kibanayml = ('C:\EvtHFv2\Kibana\'+(Get-ChildItem -Path 'C:\EvtHFv2\Kibana' -Name '*kibana.yml' -Recurse))

$Kibanafile | Out-File $Kibanayml -Encoding utf8 


Start-Service -Name 'HFKibana'

}


##################################################################################################
#                                                                                                #
#                                                                                                #
#                                   WINLOGBEAT INSTALLATION                                      #
#                                                                                                #
#                                                                                                #
##################################################################################################


function WinLogBeat {

if ((Test-Path -Path C:\EvtHFv2\Winlogbeat -PathType Container) -eq $false) {New-Item -Type Directory -Force -Path C:\EvtHFv2\Winlogbeat}

$Winbeat = ('C:\'+(Get-ChildItem -Path C:\ -Name '*winlogbeat*.msi' -Recurse))

#$EvtHosts = ('['+$EvtServer+':9200]')
#$EvtKibana = ('"'+$EvtServer+':5601"')

start-job -Name 'WinLogBeatInstall' -ScriptBlock {msiexec.exe /i $($args) /qn} -ArgumentList $Winbeat

Get-Job -Name 'WinLogBeatInstall' | Wait-Job

Get-Job -Name 'WinLogBeatInstall' | Remove-Job

$Winlogbeatfile = @"
winlogbeat.event_logs:
  - name: ForwardedEvents

output.elasticsearch:
  hosts: [localhost:9200]

setup.kibana:
  host: "localhost:5601"

logging.level: info
logging.to_files: true
logging.files:
  path: C:\ProgramData\Elastic\Beats\winlogbeat\logs
  name: winlogbeat
  keepfiles: 7
  permissions: 0644

setup.ilm.overwrite: true
"@

$Winlogbeatfile |  Out-File C:\EvtHFv2\Winlogbeat\winlogbeat.yml

$winbeatbat = ('C:\Program Files\'+(Get-ChildItem -Path 'C:\Program Files\' -Name '*winlogbeat.exe' -Recurse))

if (!(Get-Service -Name *winlogbeat*)) {wait 10}

if ((Get-Service -Name *winlogbeat*).Status -eq 'Running') {Stop-Service -Name *winlogbeat*}

Copy-Item -Path C:\EvtHFv2\Winlogbeat\winlogbeat.yml -Destination C:\ProgramData\Elastic\Beats\winlogbeat\winlogbeat.yml -Force

$exec = ($winbeatbat+' setup -c C:\ProgramData\Elastic\Beats\winlogbeat\winlogbeat.yml')

$argo = (' setup -c C:\ProgramData\Elastic\Beats\winlogbeat\winlogbeat.yml')

Start-Process $winbeatbat -ArgumentList $argo -wait -NoNewWindow -PassThru

if ((Get-Service -Name *winlogbeat*).Status -ne 'Running') {Start-Service -Name *winlogbeat*}


}



##################################################################################################
#                                                                                                #
#                                                                                                #
#                                CONFIGURE DOMAIN CONTROLLERS                                    #
#                                                                                                #
#                                                                                                #
##################################################################################################



function WinlogBeatAgent {

Foreach ($DC in $DCs)
{
write-host 'Configuring Domain Controllers to Forward Events..'
Invoke-Command -ScriptBlock {winrm quickconfig} -ComputerName $DC.Name
Invoke-Command -ScriptBlock {wecutil qc /quiet} -ComputerName $DC.Name
Invoke-Command -ScriptBlock {if (!(Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\EventForwarding\SubscriptionManager')) {New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\EventForwarding\SubscriptionManager' -Force | Out-Null}} -ComputerName $DC.Name
Invoke-Command -ComputerName $DC.Name -ScriptBlock {if (!(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\EventForwarding\SubscriptionManager' -Name 1)) {New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\EventForwarding\SubscriptionManager' -Name 1 -Value ('Server=http://'+$($args)+':5985/wsman/SubscriptionManager/WEC,Refresh=60') -PropertyType String -Force | Out-Null}}  -ArgumentList $EvtServer
}

Invoke-Command -ComputerName $DC.Name -ScriptBlock {net localgroup "Event Log Readers" /add 'Network Service'}
#Invoke-Command -ComputerName $DC.Name -ScriptBlock {$Acc = Get-ADComputer -Identity $($args); Get-ADGroup -Identity "Event Log Readers" | Add-ADGroupMember -Members $Acc} -ArgumentList $EvtS

}







$Prompt2 = ''
$Prompt = Read-Host -Prompt 'Install HF Server Events Full? (Y or N)'
if ($Prompt -eq 'N'){
Write-Host 'Select Option:'
Write-Host 'Press "1" to Run Phase 1 - Collector Setup'
Write-Host 'Press "2" to Run Phase 2 - ElasticSearch Install'
Write-Host 'Press "3" to Run Phase 3 - Kibana Install'
Write-Host 'Press "4" to Run Phase 4 - WinLogBeat Install'
Write-Host 'Press "5" to Run Phase 5 - Config Domain Controllers'
Write-Host 'Press "0" to Exit'
Write-Host '-----------------------------'
$Prompt2 = Read-Host -Prompt 'Press Key:'
if($Prompt2 -eq '0') {exit}
if($Prompt2 -notin ('1','2','3','4','5','0')) {exit}
}
if ($Prompt -eq 'Y' -or $Prompt2 -eq '1'){
Write-Host 'Calling Phase 1 - Collector Setup'
Collector
ElasticSearch
Write-Host 'Phase 1 - Complete'
}
if ($Prompt -eq 'Y' -or $Prompt2 -eq '2'){
Write-Host 'Calling Phase 2 - ElasticSearch Install'
Collector
ElasticSearch
Write-Host 'Phase 2 - Complete'
}
if ($Prompt -eq 'Y' -or $Prompt2 -eq '3'){
Write-Host 'Calling Phase 3 - Kibana Install'
Kibana
Write-Host 'Phase 3 - Complete'
}
if ($Prompt -eq 'Y' -or $Prompt2 -eq '4'){
Write-Host 'Calling Phase 4 - WinLogBeat Install'
WinLogBeat
Write-Host 'Phase 4 - Complete'
}
if ($Prompt -eq 'Y' -or $Prompt2 -eq '5'){
Write-Host 'Calling Phase 5 - Config Domain Controllers'
WinlogBeatAgent
Write-Host 'Phase 5 - Complete'
}
