# Screenshots Checklist for BIRLN Compliance Documentation

This document lists all the screenshots needed for Twilio A2P 10DLC compliance review.

## 📱 App Screenshots Required

### 1. Phone Number Input Screen
- **What to capture**: The initial phone number entry screen
- **Key elements to show**:
  - Phone number input field
  - "Continue" or "Next" button
  - App branding/logo
- **File name**: `01-phone-input-screen.png`

### 2. SMS Consent Checkbox Screen
- **What to capture**: The consent screen with checkbox
- **Key elements to show**:
  - Consent language text
  - Unchecked consent checkbox
  - Privacy Policy and Terms of Service links
  - "Continue" button (should be disabled until checkbox is checked)
- **File name**: `02-sms-consent-checkbox.png`

### 3. SMS Consent Checkbox (Checked)
- **What to capture**: Same screen with checkbox checked
- **Key elements to show**:
  - Consent language text
  - Checked consent checkbox
  - Privacy Policy and Terms of Service links
  - "Continue" button (now enabled)
- **File name**: `03-sms-consent-checked.png`

### 4. Verification Code Screen
- **What to capture**: SMS verification code input screen
- **Key elements to show**:
  - Verification code input field
  - "Verify" button
  - "Resend code" option
- **File name**: `04-verification-code-screen.png`

### 5. Privacy Policy Modal
- **What to capture**: In-app WebView showing Privacy Policy
- **Key elements to show**:
  - Modal header with "Privacy Policy" title
  - Close button (X)
  - WebView content showing phlout.com/privacy-policy
  - User stays within the app (no external browser)
- **File name**: `05-privacy-policy-modal.png`

### 6. Terms of Service Modal
- **What to capture**: In-app WebView showing Terms of Service
- **Key elements to show**:
  - Modal header with "Terms of Service" title
  - Close button (X)
  - WebView content showing phlout.com/terms-of-service
  - User stays within the app (no external browser)
- **File name**: `06-terms-of-service-modal.png`

### 7. Consent Flow Complete
- **What to capture**: Success screen after verification
- **Key elements to show**:
  - Success message
  - Next step in onboarding
  - App navigation
- **File name**: `07-consent-flow-complete.png`

## 🌐 Website Screenshots Required

### 8. Privacy Policy Page
- **What to capture**: Full phlout.com/privacy-policy page
- **Key elements to show**:
  - Complete privacy policy content
  - SMS consent section (if present)
  - Contact information
- **File name**: `08-privacy-policy-website.png`

### 9. Terms of Service Page
- **What to capture**: Full phlout.com/terms-of-service page
- **Key elements to show**:
  - Complete terms of service content
  - SMS consent section (if present)
  - Contact information
- **File name**: `09-terms-of-service-website.png`

## 📋 Additional Screenshots (Optional but Recommended)

### 10. App Settings - SMS Preferences
- **What to capture**: Settings screen showing SMS preferences
- **Key elements to show**:
  - SMS notification settings
  - Opt-out options
  - User control over SMS communications
- **File name**: `10-sms-settings.png`

### 11. Database Consent Record (Admin View)
- **What to capture**: Database record showing consent
- **Key elements to show**:
  - User ID
  - Phone number
  - Consent timestamp
  - Consent language
  - IP address (if logged)
- **File name**: `11-database-consent-record.png`

## 📱 How to Take Screenshots

### iOS Device
1. **iPhone**: Press Volume Up + Side Button simultaneously
2. **iPad**: Press Volume Up + Top Button simultaneously
3. Screenshots are saved to Photos app

### Android Device
1. **Most devices**: Press Volume Down + Power Button simultaneously
2. **Samsung**: Press Volume Down + Bixby Button
3. Screenshots are saved to Gallery app

### Simulator/Emulator
1. **iOS Simulator**: Device → Screenshot
2. **Android Emulator**: Click camera icon in toolbar
3. Screenshots are saved to desktop

## 🖥️ Screenshot Requirements

### Technical Specifications
- **Format**: PNG (preferred) or JPG
- **Resolution**: High resolution (at least 1080p)
- **Quality**: Clear, readable text
- **Orientation**: Portrait (for mobile app screenshots)

### Content Requirements
- **Complete screens**: Show entire screen, not cropped
- **Readable text**: All text should be clearly readable
- **No personal data**: Remove or blur any personal information
- **Consistent styling**: Use same device/simulator for consistency

## 📁 How to Add Screenshots to Repository

### Method 1: Direct Upload to GitHub
1. Go to https://github.com/ChrisRousseau/birln-compliance
2. Navigate to `screenshots/` folder
3. Click "Add file" → "Upload files"
4. Drag and drop your screenshot files
5. Commit with message: "Add compliance screenshots"

### Method 2: Git Commands
```bash
# Navigate to compliance-repo folder
cd compliance-repo

# Create screenshots directory if it doesn't exist
mkdir -p screenshots

# Copy your screenshots to the screenshots folder
# (Replace with your actual file paths)
cp /path/to/your/screenshots/*.png screenshots/

# Add screenshots to git
git add screenshots/

# Commit screenshots
git commit -m "Add compliance screenshots"

# Push to GitHub
git push origin main
```

### Method 3: I can help with Git commands
If you want me to run the git commands for you, just let me know!

## ✅ Screenshot Checklist

- [ ] 01-phone-input-screen.png
- [ ] 02-sms-consent-checkbox.png
- [ ] 03-sms-consent-checked.png
- [ ] 04-verification-code-screen.png
- [ ] 05-privacy-policy-modal.png
- [ ] 06-terms-of-service-modal.png
- [ ] 07-consent-flow-complete.png
- [ ] 08-privacy-policy-website.png
- [ ] 09-terms-of-service-website.png
- [ ] 10-sms-settings.png (optional)
- [ ] 11-database-consent-record.png (optional)

## 📝 Notes

- **Test on real device**: Take screenshots on actual device for best quality
- **Remove personal data**: Blur or remove any personal information
- **Consistent device**: Use same device for all app screenshots
- **High quality**: Ensure all text is readable
- **Complete screens**: Show entire screen, not cropped sections

---

**Last Updated**: December 2024  
**Purpose**: Screenshot checklist for Twilio A2P 10DLC compliance  
**Audience**: BIRLN development team
