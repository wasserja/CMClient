﻿#region Invoke-CMClientSoftwareInventory
<#
.SYNOPSIS
	This function invokes a software inventory scan on a ConfigMgr client
.DESCRIPTION

.PARAMETER  Computername
	The name of the system you'd like to invoke the action on
.PARAMETER  AsJob
	Specify this parameter if you'd like to run this as a background job.
.EXAMPLE
	PS C:\> Invoke-CMClientSoftwareInventory -Computername 'Value1' -AsJob
.NOTES

#>
function Invoke-CMClientSoftwareInventory {
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true,
				   ValueFromPipeline = $true,
				   ValueFromPipelineByPropertyName = $true)]
		[string[]]$Computername,
		[Parameter()]
		[switch]$AsJob
	)
	
	Begin {
		
	}
	Process {
		foreach ($Computer in $Computername) {
            $Params = @{
			    'Computername' = $Computer;
			    'ClientAction' = 'SoftwareInventory';
			    'AsJob' = $AsJob.IsPresent
		    }
		    Invoke-CMClientAction @Params
            }
	}
	End {
		
	}
}
#endregion