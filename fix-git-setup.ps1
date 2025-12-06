# 🔧 Fix Git Setup - Run This After Installing Git

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Fixing Git Configuration" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Try to find Git in common locations
$gitPaths = @(
    "C:\Program Files\Git\cmd\git.exe",
    "C:\Program Files (x86)\Git\cmd\git.exe",
    "$env:LOCALAPPDATA\Programs\Git\cmd\git.exe"
)

$gitExe = $null
foreach ($path in $gitPaths) {
    if (Test-Path $path) {
        $gitExe = $path
        break
    }
}

if ($gitExe) {
    Write-Host "✅ Found Git at: $gitExe" -ForegroundColor Green
    $env:PATH = "$env:PATH;$(Split-Path $gitExe)"
}
else {
    Write-Host "❌ Git not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git:" -ForegroundColor Yellow
    Write-Host "1. Download: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Install it" -ForegroundColor White
    Write-Host "3. RESTART PowerShell" -ForegroundColor White
    Write-Host "4. Run this script again" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit
}

Write-Host ""
Write-Host "Setting up Git configuration..." -ForegroundColor Yellow

# Configure Git
& $gitExe config --global user.email "rivalic@github.com"
& $gitExe config --global user.name "Rivalic"

Write-Host "✅ Git configured!" -ForegroundColor Green
Write-Host ""

# Check if we're in a git repo
if (Test-Path ".git") {
    Write-Host "✅ Git repository exists" -ForegroundColor Green
}
else {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    & $gitExe init
    Write-Host "✅ Git initialized!" -ForegroundColor Green
}

Write-Host ""
Write-Host "Adding files..." -ForegroundColor Yellow
& $gitExe add .

Write-Host "Creating commit..." -ForegroundColor Yellow
& $gitExe commit -m "Initial commit - AI Keyboard iOS App"

Write-Host "Creating main branch..." -ForegroundColor Yellow
& $gitExe branch -M main

Write-Host ""
Write-Host "Adding remote..." -ForegroundColor Yellow
& $gitExe remote remove origin 2>$null
& $gitExe remote add origin https://github.com/Rivalic/ai-keyboard.git

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Pushing to GitHub" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "You may be asked for GitHub credentials..." -ForegroundColor Yellow
Write-Host ""

& $gitExe push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Green
    Write-Host "  🎉 SUCCESS!" -ForegroundColor Green
    Write-Host "================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Your code is on GitHub!" -ForegroundColor Green
    Write-Host "GitHub Actions is building your IPA..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Go to: https://github.com/Rivalic/ai-keyboard/actions" -ForegroundColor White
    Write-Host "2. Watch the build (takes ~10 minutes)" -ForegroundColor White
    Write-Host "3. Download IPA from Artifacts when done" -ForegroundColor White
    Write-Host ""
    Start-Process "https://github.com/Rivalic/ai-keyboard/actions"
}
else {
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Red
    Write-Host "  ❌ Push Failed" -ForegroundColor Red
    Write-Host "================================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Make sure:" -ForegroundColor Yellow
    Write-Host "1. Repository exists: https://github.com/Rivalic/ai-keyboard" -ForegroundColor White
    Write-Host "2. You have access to push" -ForegroundColor White
    Write-Host "3. Your credentials are correct" -ForegroundColor White
}

Write-Host ""
Read-Host "Press Enter to exit"
