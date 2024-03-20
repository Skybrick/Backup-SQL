$DISCORD_WEBHOOK_URL = "Introduce aquí tu webhook de discord donde quieres que se mande un registro"
$DISCORD_MESSAGE = "¡Copia de seguridad realizada con éxito! Fecha y hora: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

$body = @{
    content = $DISCORD_MESSAGE
} | ConvertTo-Json

Invoke-RestMethod -Uri $DISCORD_WEBHOOK_URL -Method Post -Body $body -ContentType 'application/json'
