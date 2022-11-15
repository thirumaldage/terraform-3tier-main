# #On the VM to read
# #Raw data
# $respraw=Invoke-WebRequest -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/instance?api-version=2021-01-01"
# $respraw
# $respraw.Content
# $respraw.Content | ConvertFrom-Json | ConvertTo-Json -Depth 6

# #Instance details
# $resp=Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/instance?api-version=2021-01-01"
# $respJSON = $resp | ConvertTo-Json -Depth 6

# #Compute only, could do Network, all the main JSON headings
# Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/instance/compute?api-version=2021-01-01"

# #Just get tags
# Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri "http://169.254.169.254/metadata/instance/compute/tagsList?api-version=2021-01-01"

# #size
# Write-Output "VM name - $($resp.compute.name), RG - $($resp.compute.resourceGroupName), VM size - $($resp.compute.vmSize)"
alert("test")
$var = "test"
$var