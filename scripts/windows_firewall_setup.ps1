param(
    [switch]$AllowSSH = $false,
    [switch]$AllowWeb = $false,
    [switch]$AllowDNS = $true
)

Write-Host "Applying a least-privilege Windows Defender Firewall baseline..." -ForegroundColor Cyan

# Default deny inbound; default allow outbound.
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True -DefaultInboundAction Block -DefaultOutboundAction Allow

# Allow outbound DNS if required.
if ($AllowDNS) {
    New-NetFirewallRule -DisplayName "Allow DNS Outbound" -Direction Outbound -Action Allow -Protocol UDP -LocalPort 53 -Enabled True
    New-NetFirewallRule -DisplayName "Allow DNS Outbound TCP" -Direction Outbound -Action Allow -Protocol TCP -LocalPort 53 -Enabled True
}

# Optional inbound services.
if ($AllowWeb) {
    New-NetFirewallRule -DisplayName "Allow HTTP Inbound" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 80 -Enabled True
    New-NetFirewallRule -DisplayName "Allow HTTPS Inbound" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 443 -Enabled True
}

if ($AllowSSH) {
    New-NetFirewallRule -DisplayName "Allow SSH Inbound" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 22 -Enabled True
}

Write-Host "Firewall baseline applied successfully." -ForegroundColor Green
Write-Host "Review the active rules with: Get-NetFirewallRule | Sort-Object DisplayName" -ForegroundColor Yellow
