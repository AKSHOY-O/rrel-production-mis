#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"
$ruleName = "RREL MIS Local Network"
$existing = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
if ($existing) {
    Set-NetFirewallRule -DisplayName $ruleName -Enabled True -Profile Private -Action Allow
    Write-Host "The RREL MIS private-network firewall rule is enabled." -ForegroundColor Green
} else {
    New-NetFirewallRule `
        -DisplayName $ruleName `
        -Description "Allow the RREL Production MIS on TCP port 8765 from private networks." `
        -Direction Inbound `
        -Protocol TCP `
        -LocalPort 8765 `
        -Action Allow `
        -Profile Private | Out-Null
    Write-Host "TCP port 8765 is now allowed on Private networks." -ForegroundColor Green
}
