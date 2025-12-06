# 🚀 GitHub Actions - Build IPA Automatically

This guide will help you build your iOS app IPA file using GitHub Actions (completely free!).

## ✅ What You'll Get

- ✅ Automatic IPA builds in the cloud
- ✅ No Mac required
- ✅ Free (GitHub Actions is free for public repos)
- ✅ Download IPA file directly

## 📋 Prerequisites

1. **GitHub Account** (free) - [Sign up here](https://github.com/join)
2. **Git installed** on Windows - [Download here](https://git-scm.com/download/win)

**Optional (for signed IPA):**
- Apple Developer Account ($99/year)
- Signing certificates

## 🚀 Quick Start (5 Steps)

### Step 1: Install Git (if not installed)

Download and install Git for Windows: https://git-scm.com/download/win

### Step 2: Create GitHub Repository

1. Go to [github.com](https://github.com)
2. Click "New repository"
3. Name it: `ai-keyboard`
4. Make it **Public** (for free Actions)
5. Click "Create repository"

### Step 3: Push Your Code to GitHub

Open PowerShell in the `deep-station` folder and run:

```powershell
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - AI Keyboard"

# Add your GitHub repository
git remote add origin https://github.com/YOUR_USERNAME/ai-keyboard.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Replace `YOUR_USERNAME` with your actual GitHub username!**

### Step 4: Trigger the Build

The build will start automatically when you push! 

Or trigger manually:
1. Go to your repository on GitHub
2. Click "Actions" tab
3. Click "Build iOS IPA" workflow
4. Click "Run workflow"
5. Click the green "Run workflow" button

### Step 5: Download Your IPA

1. Wait for the build to complete (~5-10 minutes)
2. Go to the workflow run
3. Scroll down to "Artifacts"
4. Download **"AIKeyboard-IPA"**
5. Extract the ZIP file
6. You'll have your IPA file! 🎉

## 📥 Installing the IPA on iPhone

Once you have the IPA file, use **AltStore**:

### Install AltStore (Windows)

1. **Download AltServer**: https://altstore.io
2. **Install iTunes** (if not installed): https://www.apple.com/itunes/download/
3. **Install iCloud** (if not installed): https://support.apple.com/en-us/HT204283

### Sideload Your IPA

1. **Run AltServer** on Windows (check system tray)
2. **Connect iPhone** via USB
3. **Trust computer** on iPhone
4. **Install AltStore**:
   - Click AltServer icon in system tray
   - Install AltStore → [Your iPhone]
   - Enter Apple ID and password
5. **Open AltStore** on iPhone
6. **Tap "My Apps"**
7. **Tap "+" button**
8. **Select your IPA file**
9. **Wait for installation**
10. **Done!** 🎉

### Enable the Keyboard

1. Settings → General → Keyboard → Keyboards
2. Add New Keyboard → AI Keyboard
3. Enable "Allow Full Access"

## 🔐 Building a SIGNED IPA (Optional)

For a properly signed IPA that doesn't need refreshing every 7 days:

### Requirements:
- Apple Developer Account ($99/year)
- Signing certificate (.p12 file)
- Provisioning profile (.mobileprovision file)

### Steps:

1. **Get Your Certificates** from Apple Developer Portal

2. **Convert to Base64**:

On Mac/Linux:
```bash
base64 -i certificate.p12 -o certificate.txt
base64 -i profile.mobileprovision -o profile.txt
```

On Windows (PowerShell):
```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("certificate.p12")) | Out-File certificate.txt
[Convert]::ToBase64String([IO.File]::ReadAllBytes("profile.mobileprovision")) | Out-File profile.txt
```

3. **Add to GitHub Secrets**:
   - Go to your repo → Settings → Secrets and variables → Actions
   - Click "New repository secret"
   - Add these secrets:

   | Name | Value |
   |------|-------|
   | `BUILD_CERTIFICATE_BASE64` | Content of certificate.txt |
   | `P12_PASSWORD` | Your certificate password |
   | `BUILD_PROVISION_PROFILE_BASE64` | Content of profile.txt |
   | `KEYCHAIN_PASSWORD` | Any password (e.g., "actions") |

4. **Push code again** - GitHub Actions will build a signed IPA!

## 📊 Build Status

Check your build status:
1. Go to your repository
2. Click "Actions" tab
3. See all builds and their status

## 🐛 Troubleshooting

### Build Failed?

**Check the logs:**
1. Click on the failed workflow run
2. Click on the "build-ios" job
3. Expand each step to see errors

**Common issues:**

**"No scheme specified"**
- The workflow will try to find the scheme automatically
- Check that `AIKeyboard.xcodeproj` exists

**"Code signing error"**
- This is expected for unsigned builds
- The unsigned IPA will still be created
- For signed builds, add certificates (see above)

**"No artifacts uploaded"**
- Check build logs for errors
- Make sure the build completed

### IPA Won't Install?

**Using AltStore:**
- Make sure iTunes and iCloud are installed
- Trust your computer on iPhone
- Check Apple ID credentials

**"Untrusted Developer":**
- Settings → General → VPN & Device Management
- Trust the developer profile

**App Crashes:**
- This is an unsigned build for testing
- Some features may not work
- For production, use signed IPA

## 💡 Tips

1. **Make repo public** for free GitHub Actions minutes
2. **Private repos** get 2,000 free minutes/month
3. **Each build** takes ~5-10 minutes
4. **Artifacts** are kept for 30 days
5. **Re-run builds** anytime from Actions tab

## 🔄 Updating Your App

When you make changes:

```powershell
git add .
git commit -m "Updated features"
git push
```

GitHub Actions will automatically build a new IPA! 🚀

## 📱 Alternative: Use Codemagic

If GitHub Actions doesn't work, try Codemagic:

1. Sign up: https://codemagic.io
2. Connect your GitHub repo
3. Configure iOS build
4. Download IPA

It's even easier and has a nice UI!

## ❓ FAQ

**Q: Is this free?**  
A: Yes! GitHub Actions is free for public repositories.

**Q: How long does it take?**  
A: First build: ~10 minutes. Subsequent builds: ~5 minutes.

**Q: Do I need a Mac?**  
A: No! GitHub provides macOS runners for free.

**Q: Can I build for App Store?**  
A: Yes! Add signing certificates and build a signed IPA.

**Q: Will the app work?**  
A: Unsigned builds work for testing. For full functionality, use signed builds.

**Q: How often can I build?**  
A: Unlimited for public repos! Private repos: 2,000 minutes/month.

## 📚 Resources

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [iOS Build Guide](https://docs.github.com/en/actions/deployment/deploying-xcode-applications)
- [AltStore Guide](https://altstore.io/faq/)
- [Apple Developer](https://developer.apple.com)

## 🆘 Need Help?

1. **Check Actions logs** for detailed errors
2. **Open an issue** on GitHub
3. **Email**: support@aikeyboard.com

---

## 🎯 Quick Command Reference

```powershell
# First time setup
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/ai-keyboard.git
git branch -M main
git push -u origin main

# After making changes
git add .
git commit -m "Your message"
git push

# Check status
git status

# View remote
git remote -v
```

---

**Ready to build your IPA? Let's go! 🚀**

1. Create GitHub account
2. Push your code
3. Wait for build
4. Download IPA
5. Install with AltStore

**That's it!** No Mac needed! 🎉
