$ErrorActionPreference = "Stop"
Set-Location -LiteralPath $PSScriptRoot
Write-Host "Starting RREL Production MIS..." -ForegroundColor Cyan
Write-Host "Local computer: http://127.0.0.1:8765" -ForegroundColor Green
Write-Host "Other devices: use this computer's LAN IP with port 8765." -ForegroundColor Green
python server.py --host 0.0.0.0 --port 8765
