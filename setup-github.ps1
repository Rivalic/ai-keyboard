# 🚀 Complete Setup Script for GitHub Actions

# This script will help you push your code to GitHub and trigger the IPA build

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  AI Keyboard - GitHub Actions Setup" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
Write-Host "Checking for Git..." -ForegroundColor Yellow
$gitInstalled = Get-Command git -ErrorAction SilentlyContinue

if (-not $gitInstalled) {
    Write-Host "❌ Git is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git first:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Run the installer" -ForegroundColor White
    Write-Host "3. Restart PowerShell" -ForegroundColor White
    Write-Host "4. Run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Opening download page..." -ForegroundColor Yellow
    Start-Process "https://git-scm.com/download/win"
    exit
}

Write-Host "✅ Git is installed!" -ForegroundColor Green
Write-Host ""

# Get GitHub username
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Step 1: GitHub Setup" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$username = Read-Host "Enter your GitHub username"

if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "❌ Username cannot be empty!" -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "Great! Your repository will be:" -ForegroundColor Green
Write-Host "https://github.com/$username/ai-keyboard" -ForegroundColor White
Write-Host ""

# Ask if repository is created
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Step 2: Create GitHub Repository" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Have you created the repository on GitHub?" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: ai-keyboard" -ForegroundColor White
Write-Host "3. Make it PUBLIC (for free Actions)" -ForegroundColor White
Write-Host "4. Click 'Create repository'" -ForegroundColor White
Write-Host ""

$created = Read-Host "Have you created the repository? (y/n)"

if ($created -ne "y" -and $created -ne "Y") {
    Write-Host ""
    Write-Host "Opening GitHub..." -ForegroundColor Yellow
    Start-Process "https://github.com/new"
    Write-Host ""
    Write-Host "Create the repository and run this script again!" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Step 3: Initialize Git Repository" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Initialize git if needed
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git initialized!" -ForegroundColor Green
} else {
    Write-Host "✅ Git already initialized!" -ForegroundColor Green
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Step 4: Add Files" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Adding all files..." -ForegroundColor Yellow
git add .
Write-Host "✅ Files added!" -ForegroundColor Green

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Step 5: Commit" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Creating commit..." -ForegroundColor Yellow
git commit -m "Initial commit - AI Keyboard iOS App"
Write-Host "✅ Commit created!" -ForegroundColor Green

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Step 6: Add Remote" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$remoteUrl = "https://github.com/$username/ai-keyboard.git"
Write-Host "Adding remote: $remoteUrl" -ForegroundColor Yellow

# Remove existing remote if it exists
git remote remove origin 2>$null

git remote add origin $remoteUrl
Write-Host "✅ Remote added!" -ForegroundColor Green

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Step 7: Push to GitHub" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "(You may be asked for GitHub credentials)" -ForegroundColor White
Write-Host ""

git branch -M main
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Green
    Write-Host "  🎉 SUCCESS!" -ForegroundColor Green
    Write-Host "================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Your code is now on GitHub!" -ForegroundColor Green
    Write-Host "GitHub Actions is building your IPA file..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Go to: https://github.com/$username/ai-keyboard" -ForegroundColor White
    Write-Host "2. Click 'Actions' tab" -ForegroundColor White
    Write-Host "3. Watch the build progress" -ForegroundColor White
    Write-Host "4. When done, download the IPA from 'Artifacts'" -ForegroundColor White
    Write-Host ""
    Write-Host "Opening your repository..." -ForegroundColor Yellow
    Start-Process "https://github.com/$username/ai-keyboard/actions"
    Write-Host ""
    Write-Host "Build time: ~5-10 minutes ⏱️" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Red
    Write-Host "  ❌ Push Failed" -ForegroundColor Red
    Write-Host "================================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Common issues:" -ForegroundColor Yellow
    Write-Host "1. Repository doesn't exist - create it on GitHub" -ForegroundColor White
    Write-Host "2. Authentication failed - check your credentials" -ForegroundColor White
    Write-Host "3. Network error - check internet connection" -ForegroundColor White
    Write-Host ""
    Write-Host "Try running the script again!" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
