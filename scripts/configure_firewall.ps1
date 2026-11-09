# Windows Defender Firewall configuration template
# Run as Administrator.

param(
    [switch]$AllowHTTP = $false,
    [switch]$AllowHTTPS = $false,
    [switch]$AllowSSH = $false,
    [switch]$AllowDNS = $true
)

Write-Host "Applying a least-privilege Windows firewall baseline..." -ForegroundColor Cyan
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True -DefaultInboundAction Block -DefaultOutboundAction Allow

if ($AllowDNS) {
    New-NetFirewallRule -DisplayName "Allow DNS Outbound UDP" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 53 -Enabled True | Out-Null
    New-NetFirewallRule -DisplayName "Allow DNS Outbound TCP" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 53 -Enabled True | Out-Null
}

if ($AllowHTTP) {
    New-NetFirewallRule -DisplayName "Allow HTTP Inbound" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 80 -Enabled True | Out-Null
}

if ($AllowHTTPS) {
    New-NetFirewallRule -DisplayName "Allow HTTPS Inbound" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 443 -Enabled True | Out-Null
}

if ($AllowSSH) {
    New-NetFirewallRule -DisplayName "Allow SSH Inbound" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 22 -Enabled True | Out-Null
}

Write-Host "Firewall configuration applied successfully." -ForegroundColor Green
Write-Host "Review active rules with: Get-NetFirewallRule | Sort-Object DisplayName" -ForegroundColor Yellow
