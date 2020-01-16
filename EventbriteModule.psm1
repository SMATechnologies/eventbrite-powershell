function SMA_GetEvents($token,$org)
{
    $hdr = @{"Authorization" = "Bearer " + $token}
    $uriget = "https://www.eventbriteapi.com/v3/organizations/" + $org + "/events/"

    try
    {
        $events = Invoke-RestMethod -Method GET -Uri $uriget -Headers $hdr -ContentType "application/json"
    }
    catch [Exception]
    {
        write-host $_.Exception
        write-host $_.Exception.Message
        Exit 103
    }
    
    return $events
}

function SMA_GetOrganizers($token,$org)
{
    $hdr = @{"Authorization" = "Bearer " + $token}
    $uriget = "https://www.eventbriteapi.com/v3/organizations/" + $org + "/organizers/"

    try
    {
        $events = Invoke-RestMethod -Method GET -Uri $uriget -Headers $hdr -ContentType "application/json"
    }
    catch [Exception]
    {
        write-host $_.Exception
        write-host $_.Exception.Message
        Exit 103
    }
    
    return $events
}

function SMA_GetUserInfo($token)
{
    $hdr = @{"Authorization" = "Bearer " + $token}
    $uriget = "https://www.eventbriteapi.com/v3/users/me/"

    try
    {
        $user = Invoke-RestMethod -Method GET -Uri $uriget -Headers $hdr -ContentType "application/json"
    }
    catch [Exception]
    {
        write-host $_.Exception
        write-host $_.Exception.Message
        Exit 103
    }
    
    return $user
}

function SMA_GetOrganization($token)
{
    $hdr = @{"Authorization" = "Bearer " + $token}
    $uriget = "https://www.eventbriteapi.com/v3/users/me/organizations/"

    try
    {
        $user = Invoke-RestMethod -Method GET -Uri $uriget -Headers $hdr -ContentType "application/json"
    }
    catch [Exception]
    {
        write-host $_.Exception
        write-host $_.Exception.Message
        Exit 103
    }
    
    return $user
}

function SMA_GetOrganizers($token,$org)
{
    $hdr = @{"Authorization" = "Bearer " + $token}
    $uriget = "https://www.eventbriteapi.com/v3/organizations/" + $org + "/organizers/"

    try
    {
        $organizers = Invoke-RestMethod -Method GET -Uri $uriget -Headers $hdr -ContentType "application/json"
    }
    catch [Exception]
    {
        write-host $_.Exception
        write-host $_.Exception.Message
        Exit 103
    }
    
    return $organizers
}


function SMA_GetAttendees($token,$org,$continuation)
{
    $hdr = @{"Authorization" = "Bearer " + $token}
    
	if($continuation)
	{
		$uriget = "https://www.eventbriteapi.com/v3/organizations/" + $org + "/attendees/?continuation=" + $continuation
	}
	else
	{
		$uriget = "https://www.eventbriteapi.com/v3/organizations/" + $org + "/attendees/"
	}
	
    try
    {
        $attendees = Invoke-RestMethod -Method GET -Uri $uriget -Headers $hdr -ContentType "application/json" #| Where-Object{ $_.event_id -eq $eventId }
    }
    catch [Exception]
    {
        write-host $_.Exception
        write-host $_.Exception.Message
        Exit 103
    }
    
    return $attendees
}
