# 🎯 QUICK START - Get Your IPA File in 3 Steps!

## ⚡ Super Quick Guide (15 Minutes)

### Step 1: Install Git (2 minutes)

**Download Git:**
👉 https://git-scm.com/download/win

**Install it:**
- Run the installer
- Click "Next" for everything (defaults are fine)
- Restart PowerShell when done

### Step 2: Create GitHub Account (3 minutes)

**If you don't have one:**
👉 https://github.com/join

**Create a new repository:**
1. Go to: https://github.com/new
2. Name: `ai-keyboard`
3. Make it **PUBLIC** ✅
4. Click "Create repository"

### Step 3: Run the Setup Script (10 minutes)

**Open PowerShell in this folder and run:**

```powershell
.\setup-github.ps1
```

**The script will:**
1. ✅ Check if Git is installed
2. ✅ Ask for your GitHub username
3. ✅ Push your code to GitHub
4. ✅ Trigger automatic IPA build
5. ✅ Open your repository

**That's it!** 🎉

---

## 📥 Download Your IPA

After ~10 minutes:

1. Go to: `https://github.com/YOUR_USERNAME/ai-keyboard`
2. Click **"Actions"** tab
3. Click the latest workflow run
4. Scroll down to **"Artifacts"**
5. Download **"AIKeyboard-IPA"**
6. Extract the ZIP file
7. You have your IPA! 🎉

---

## 📱 Install on iPhone

### Use AltStore (Windows):

1. **Download AltStore:** https://altstore.io
2. **Install iTunes & iCloud** (if not installed)
3. **Run AltServer** (system tray icon)
4. **Connect iPhone** via USB
5. **Install AltStore:**
   - Click AltServer icon → Install AltStore → [Your iPhone]
   - Enter Apple ID
6. **Open AltStore on iPhone**
7. **Tap "+" and select your IPA**
8. **Done!** 🎉

### Enable Keyboard:

1. Settings → General → Keyboard → Keyboards
2. Add New Keyboard → AI Keyboard
3. Enable "Allow Full Access"

---

## 🆘 Troubleshooting

### Git not installed?
- Download: https://git-scm.com/download/win
- Install and restart PowerShell

### Script won't run?
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

### Push failed?
- Make sure repository exists on GitHub
- Check GitHub username is correct
- Try again!

### Build failed?
- Check Actions tab for errors
- Usually works on second try
- Open an issue if stuck

---

## 📞 Need Help?

**Read the full guide:**
- [GITHUB_ACTIONS_GUIDE.md](GITHUB_ACTIONS_GUIDE.md) - Detailed instructions
- [INSTALL_WITHOUT_MAC.md](INSTALL_WITHOUT_MAC.md) - All installation methods

**Still stuck?**
- Open an issue on GitHub
- Email: support@aikeyboard.com

---

## ✅ Checklist

- [ ] Git installed
- [ ] GitHub account created
- [ ] Repository created (public)
- [ ] Ran setup script
- [ ] Code pushed to GitHub
- [ ] Build completed (check Actions tab)
- [ ] IPA downloaded
- [ ] AltStore installed
- [ ] IPA installed on iPhone
- [ ] Keyboard enabled

---

**🚀 Ready? Run this command:**

```powershell
.\setup-github.ps1
```

**That's all you need!** The script does everything else! 🎉
