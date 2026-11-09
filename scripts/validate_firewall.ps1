# Firewall validation template
# Run as Administrator.

param(
    [string]$Target = "127.0.0.1",
    [int[]]$Ports = @(22, 80, 443, 53)
)

Write-Host "Firewall rule inventory:" -ForegroundColor Cyan
Get-NetFirewallRule | Sort-Object DisplayName | Format-Table DisplayName, Enabled, Direction, Action, Profile

Write-Host "`nTesting connectivity to $Target..." -ForegroundColor Cyan
foreach ($port in $Ports) {
    $result = Test-NetConnection -ComputerName $Target -Port $port -WarningAction SilentlyContinue
    $status = if ($result.TcpTestSucceeded) { "OPEN" } else { "BLOCKED" }
    Write-Host ("Port {0}: {1}" -f $port, $status)
}

Write-Host "`nValidation complete. Record the outcome in the firewall test plan." -ForegroundColor Green
