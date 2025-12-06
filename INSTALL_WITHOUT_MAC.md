# 📱 Installing AI Keyboard on iPhone Without a Mac

Since you don't have a Mac, here are your options to get this app on your iPhone.

## 🎯 Quick Comparison

| Method | Cost | Difficulty | Time | Recommended |
|--------|------|------------|------|-------------|
| **GitHub Actions** | Free | Medium | 1 hour | ⭐⭐⭐⭐⭐ |
| **Codemagic** | Free tier | Easy | 30 min | ⭐⭐⭐⭐ |
| **Cloud Mac Rental** | $30-80/mo | Medium | 2 hours | ⭐⭐⭐ |
| **Friend with Mac** | Free | Easy | 15 min | ⭐⭐⭐⭐⭐ |
| **AltStore + Sideload** | Free | Hard | 1 hour | ⭐⭐ |

---

## ⭐ Method 1: GitHub Actions (RECOMMENDED)

**Cost:** Free  
**Requirements:** GitHub account, Apple Developer account ($99/year)

### Steps:

1. **Create GitHub Repository**
   ```bash
   cd deep-station
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/ai-keyboard.git
   git push -u origin main
   ```

2. **Add Apple Certificates to GitHub Secrets**
   - Go to your repo → Settings → Secrets and variables → Actions
   - Add these secrets:
     - `APPLE_CERTIFICATE` - Your .p12 certificate (base64 encoded)
     - `APPLE_CERTIFICATE_PASSWORD` - Certificate password
     - `PROVISIONING_PROFILE` - Your provisioning profile (base64 encoded)

3. **Push Code to Trigger Build**
   - GitHub Actions will automatically build your app
   - Download the IPA from the Actions artifacts

4. **Install via TestFlight or AltStore**

### Detailed Guide:
See: [GitHub iOS Build Guide](https://docs.github.com/en/actions/deployment/deploying-xcode-applications)

---

## 🌐 Method 2: Codemagic (Easiest)

**Cost:** Free for 500 build minutes/month  
**Requirements:** Apple Developer account

### Steps:

1. **Sign up at [codemagic.io](https://codemagic.io)**

2. **Connect Your Repository**
   - Push your code to GitHub/GitLab/Bitbucket
   - Connect to Codemagic

3. **Configure iOS Build**
   - Select iOS app
   - Add your Apple Developer credentials
   - Configure signing

4. **Build & Download**
   - Codemagic builds the IPA
   - Download or publish to TestFlight

5. **Install on iPhone**
   - Use TestFlight (recommended)
   - Or install via Codemagic's direct install

### Tutorial:
[Codemagic iOS Setup](https://docs.codemagic.io/getting-started/building-a-native-ios-app/)

---

## 💻 Method 3: Rent a Cloud Mac

**Cost:** $30-80/month  
**Requirements:** Credit card

### Option A: MacinCloud

1. **Sign up at [macincloud.com](https://www.macincloud.com)**
2. **Choose a plan** (Pay-as-you-go or monthly)
3. **Connect via RDP** (Remote Desktop)
4. **Install Xcode** (if not pre-installed)
5. **Build your app:**
   ```bash
   # Upload your code
   # Open AIKeyboard.xcodeproj
   # Build and export IPA
   ```
6. **Download IPA** to your Windows PC
7. **Install on iPhone** (see installation methods below)

### Option B: AWS EC2 Mac

1. **Sign up for AWS**
2. **Launch EC2 Mac instance** (mac1.metal or mac2.metal)
3. **Connect via VNC**
4. **Build your app**
5. **Download IPA**

**Cost:** ~$1.08/hour (minimum 24-hour allocation)

---

## 👥 Method 4: Friend with Mac (Simplest)

**Cost:** Free (maybe buy them coffee ☕)

### Steps:

1. **Send them your code**
   - Zip the `deep-station` folder
   - Email or share via cloud storage

2. **They build it:**
   ```bash
   # On their Mac:
   cd deep-station
   open AIKeyboard.xcodeproj
   # In Xcode: Product → Archive → Export
   ```

3. **They send you the IPA file**

4. **You install it** (see installation methods below)

---

## 📲 Installing IPA on iPhone (Without Mac)

Once you have the IPA file, here's how to install it:

### Option A: AltStore (No Jailbreak Required)

**Requirements:** Windows PC, iPhone, Lightning cable

1. **Download AltServer for Windows**
   - [altstore.io](https://altstore.io)

2. **Install AltStore on iPhone**
   - Connect iPhone to PC
   - Run AltServer on Windows
   - Install AltStore via iTunes/iCloud

3. **Sideload Your IPA**
   - Open AltStore on iPhone
   - Tap "+" to add IPA
   - Select your AI Keyboard IPA
   - Install (refreshes every 7 days)

### Option B: Sideloadly

**Requirements:** Windows PC, Apple ID

1. **Download Sideloadly**
   - [sideloadly.io](https://sideloadly.io)

2. **Connect iPhone**

3. **Drag IPA to Sideloadly**

4. **Enter Apple ID**

5. **Install** (refreshes every 7 days)

### Option C: TestFlight (Best for Testing)

**Requirements:** Apple Developer account

1. **Upload to App Store Connect**
   - Use Xcode or Transporter app
   - Upload your IPA

2. **Add to TestFlight**
   - Invite yourself as tester
   - Install TestFlight app on iPhone

3. **Install from TestFlight**
   - Open TestFlight
   - Install AI Keyboard
   - No 7-day refresh needed!

### Option D: Diawi (Quick Share)

**Requirements:** IPA file

1. **Upload to [diawi.com](https://diawi.com)**
2. **Get install link**
3. **Open link on iPhone**
4. **Install** (requires proper signing)

---

## 🔑 About Apple Developer Account

**Do you need it?**
- **For TestFlight:** Yes ($99/year)
- **For AltStore/Sideloadly:** No (free Apple ID works)
- **For App Store:** Yes ($99/year)

**What it gives you:**
- Proper code signing
- TestFlight access
- App Store distribution
- No 7-day refresh limit

**Sign up:** [developer.apple.com](https://developer.apple.com)

---

## 🎯 Recommended Path for You

Based on your situation (no Mac, want to use on iPhone):

### **Short Term (Today):**
1. Find a friend with a Mac
2. Have them build the IPA
3. Install via AltStore

### **Long Term (This Week):**
1. Set up GitHub Actions (free)
2. Get Apple Developer account ($99/year)
3. Use TestFlight for testing
4. Publish to App Store when ready

### **Alternative (If No Friends with Mac):**
1. Use Codemagic free tier
2. Build IPA in cloud
3. Install via TestFlight or AltStore

---

## 🛠️ Step-by-Step: GitHub Actions Method

### 1. Prepare Your Code

```bash
cd deep-station
git init
git add .
git commit -m "Initial commit"
```

### 2. Create GitHub Repository

- Go to [github.com](https://github.com)
- Create new repository "ai-keyboard"
- Push your code:

```bash
git remote add origin https://github.com/YOUR_USERNAME/ai-keyboard.git
git push -u origin main
```

### 3. Get Apple Developer Certificates

You need:
- **Certificate:** From Apple Developer portal
- **Provisioning Profile:** For your app

Export as `.p12` file and convert to base64:
```bash
# On any computer with the certificate:
base64 certificate.p12 > certificate.txt
base64 profile.mobileprovision > profile.txt
```

### 4. Add to GitHub Secrets

- Repository → Settings → Secrets → New secret
- Add `APPLE_CERTIFICATE` (paste certificate.txt content)
- Add `APPLE_CERTIFICATE_PASSWORD`
- Add `PROVISIONING_PROFILE` (paste profile.txt content)

### 5. Update Workflow File

Edit `.github/workflows/ios-build.yml` with proper signing

### 6. Push and Build

```bash
git add .
git commit -m "Add signing"
git push
```

GitHub will build your IPA automatically!

### 7. Download IPA

- Go to Actions tab
- Click latest workflow run
- Download artifacts
- Get your IPA file

### 8. Install on iPhone

Use AltStore or TestFlight (see above)

---

## ❓ FAQ

**Q: Can I build iOS apps without a Mac at all?**  
A: Yes! Use cloud services like GitHub Actions, Codemagic, or rent a cloud Mac.

**Q: Is it free?**  
A: GitHub Actions is free. Apple Developer account is $99/year (optional for testing).

**Q: How long does it take?**  
A: First time: 2-3 hours. After setup: 10 minutes per build.

**Q: Can I publish to App Store?**  
A: Yes! Once you have the IPA, you can submit to App Store.

**Q: What about ipatool?**  
A: ipatool downloads existing App Store apps. You need to BUILD your custom app first.

---

## 🆘 Need Help?

1. **GitHub Actions not working?**
   - Check the Actions tab for error logs
   - Verify your secrets are correct
   - Make sure certificates are valid

2. **Can't install IPA?**
   - Check if IPA is properly signed
   - Try AltStore if Sideloadly fails
   - Use TestFlight for easiest installation

3. **Still stuck?**
   - Open a GitHub issue
   - Email: support@aikeyboard.com
   - Check Apple Developer forums

---

## 📚 Additional Resources

- [Apple Developer Portal](https://developer.apple.com)
- [GitHub Actions for iOS](https://docs.github.com/en/actions/deployment/deploying-xcode-applications)
- [AltStore Guide](https://altstore.io/faq/)
- [Codemagic Docs](https://docs.codemagic.io)
- [TestFlight Guide](https://developer.apple.com/testflight/)

---

**Good luck! 🚀 You can do this even without a Mac!**
