# Purpose: Uninstalls Windows Defender - called by "join-domain.ps1" - Separating this as it causes Windows Defender to kill the Join Domain script.
# Source of join-domain.ps1: https://github.com/MaximumPigs/DetectionLab

# Uninstalling Windows Defender (https://github.com/StefanScherer/packer-windows/issues/201)
Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Uninstalling Windows Defender..."
Try {
  Uninstall-WindowsFeature Windows-Defender -ErrorAction Stop
  Uninstall-WindowsFeature Windows-Defender-Features -ErrorAction Stop
} Catch {
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Windows Defender did not uninstall successfully..."
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) We'll try again during install-red-team.ps1"
}