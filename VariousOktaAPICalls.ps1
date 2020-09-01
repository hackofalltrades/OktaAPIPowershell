

#Replace YourOktaTenantURL with your entire Okta URL, and YourApiToken with the API Token you've generated.
#user-list.csv can be replaced by the CSV file of your choice.  The script requires that the CSV file has a "login" column that contains the username of each user that is to be deleted.  Additional columns can exist in the CSV file and will be ignored by the script.



#param([string]$orgurl , [string]$apikey, [string]$filepath)

$apikey = ""
$orgurl = "https://dev-307117-admin.okta.com/"
$authorizationHeader = "SSWS " + $apikey



    $headers = @{}
	$headers["Authorization"] = $authorizationHeader
	$headers["Accept"] = "application/json"
	$headers["Content-Type"] = "application/json"


############## End Authentication Info ##################
# Get Users in Env
$usersUri = $orgurl + "/api/v1/users/"

    $users = (Invoke-WebRequest -Uri $usersuri -Headers $headers).Content | ConvertFrom-Json
    $users 

# Get All Apps in Env
    $appsUri = $orgurl + "/api/v1/apps/"
    $apps= (Invoke-WebRequest -Uri $uri -Headers $headers).Content | ConvertFrom-Json   
    $apps


# Get Single App in Env
    $singleappsUri = $orgurl + "/api/v1/apps/"
    $singleapps= (Invoke-WebRequest -Uri $uri -Headers $headers).Content | ConvertFrom-Json   
    foreach ($singleapp in $singleapps) {
    if ($singleapps.label -like "My Web App") {
    Write-Host $singleapp
    }

# Append ID to label
$appendidpost = '{
  "profile": {
    "name": "Ameliorate Name",
    "description": "Amended description"
  }
}' 

$appendidUri = $orgurl + "/api/v1/groups/$groupid"
    $appendid= (Invoke-WebRequest -Method POST -Uri $appendiduri -Headers $headers -ContentType "application/json" -Body $appendidpost).Content | ConvertFrom-Json 
    $appendid


# Create Group in Env
$groupcreatepost =    '{
  "profile": {
    "name": "West Coast Users",
    "description": "All Users West of The Rockies"
  }
}' 

    $groupcreateUri = $orgurl + "/api/v1/groups/"
    $groupcreate= (Invoke-WebRequest -Method POST -Uri $groupcreateuri -Headers $headers -ContentType "application/json" -Body $groupcreatepost).Content | ConvertFrom-Json 
    $groupcreate

# Group associated with an application
$groupcreatepost =    '{
  "profile": {
    "name": "West Coast Users",
    "description": "All Users West of The Rockies"
  }
}' 

    $groupcreateUri = $orgurl + "/api/v1/groups/"
    $groupcreate= (Invoke-WebRequest -Method POST -Uri $groupcreateuri -Headers $headers -ContentType "application/json" -Body $groupcreatepost).Content | ConvertFrom-Json 
    $groupcreate


##Search Group By Name
#"https://${yourOktaDomain}/api/v1/groups?q=West&limit=10"

#### Assign application to a group
$appgroupaddeUri = $orgurl + "/api/v1/groups/$applicationId/users/$groupId"
    $appgroupcadd= (Invoke-WebRequest -Method POST -Uri $appgroupaddeuri -Headers $headers -ContentType "application/json").Content | ConvertFrom-Json 
    $appgroupadd


# Add user to Group
$groupaddpost =    '{
  "profile": {
    "name": "West Coast Users",
    "description": "All Users West of The Rockies"
  }
}' 
$userid = $users.id
$groupid = $groups.id

    $groupaddeUri = $orgurl + "/api/v1/groups/$groupId/users/$userId"
    $groupcadd= (Invoke-WebRequest -Method POST -Uri $groupaddeuri -Headers $headers -ContentType "application/json" -Body $groupaddepost).Content | ConvertFrom-Json 
    $groupadd
