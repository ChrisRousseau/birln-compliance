# Apple App Store Requirements for BIRLN

This document outlines the specific requirements and policy updates needed for Apple App Store submission.

## 📱 Required App Permissions

### Location Services
- **Foreground Location**: "Birln needs your location to show nearby nightlife venues and help you discover the hottest spots around you."
- **Always Location**: "Birln needs your location to automatically check you into venues and help you collect BIRLN BUX rewards without forgetting to check in manually."
- **Usage**: 
  - Venue discovery and recommendations
  - Automatic check-ins when users arrive at venues
  - BIRLN BUX rewards collection
  - Location-based social features

### Camera Access
- **Purpose**: "We need access to your camera to let you capture and share your nightlife moments."
- **Usage**: Taking photos for venue posts and social sharing

### Photo Library Access
- **Purpose**: "We need access to your photo library to let you select and share your nightlife photos."
- **Usage**: Selecting existing photos for venue posts and profile pictures

### Push Notifications
- **Purpose**: "Receive notifications about new chili peppers, venue updates, and social activities."
- **Usage**: In-app notifications for social interactions (NOT SMS)

## 🔔 Notification Systems Clarification

### App Push Notifications (iOS/Android)
- **Chili Pepper Alerts**: When someone gives you a chili pepper
- **Venue Alerts**: When people you follow are going to venues
- **Social Notifications**: Follows, messages, mutual connections
- **System Notifications**: App updates, important announcements
- **Consent**: Handled by iOS/Android permission system
- **Opt-out**: Through device settings or app settings

### SMS Messages (Twilio)
- **Verification Codes**: Account verification and security
- **Account Updates**: Important account changes
- **Marketing Messages**: Promotional content (with explicit consent)
- **Consent**: Explicit checkbox consent required
- **Opt-out**: Reply "STOP" or app settings

## 📋 Required Policy Updates for Apple

### Privacy Policy Updates Needed

#### Data Collection Section
```markdown
## Information We Collect

### Location Data
- **Precise Location**: We collect your precise location to show nearby venues and enable automatic check-ins
- **Always Location**: We access your location even when the app is closed to automatically check you into venues and help you collect BIRLN BUX rewards
- **Background Location**: We monitor your location in the background for automatic venue check-ins and rewards collection
- **Location Sharing**: Your location is shared with other users when you check into venues
- **Automatic Check-ins**: We automatically check you into venues when you arrive to ensure you don't miss BIRLN BUX rewards

### Camera and Photos
- **Camera Access**: We access your camera to let you take photos for venue posts
- **Photo Library**: We access your photo library to let you select existing photos
- **Photo Storage**: Photos are stored on our servers and may be shared with other users

### Device Information
- **Device ID**: We collect device identifiers for analytics and security
- **App Usage**: We track how you use the app for service improvement
- **Crash Reports**: We collect crash reports to improve app stability
```

#### Third-Party Services Section
```markdown
## Third-Party Services

### Twilio
- **Purpose**: SMS verification and communications
- **Data Shared**: Phone numbers, verification codes
- **Privacy Policy**: https://www.twilio.com/legal/privacy

### Google Places API
- **Purpose**: Venue information and location services
- **Data Shared**: Location coordinates, venue searches
- **Privacy Policy**: https://policies.google.com/privacy

### Supabase
- **Purpose**: Database and backend services
- **Data Shared**: User profiles, posts, location data
- **Privacy Policy**: https://supabase.com/privacy

### Expo/React Native
- **Purpose**: App development and analytics
- **Data Shared**: App usage, crash reports
- **Privacy Policy**: https://expo.dev/privacy
```

### Terms of Service Updates Needed

#### App Store Compliance Section
```markdown
## App Store Compliance

### Age Requirements
- **Minimum Age**: Users must be 18 years or older
- **Age Verification**: We may request age verification
- **Parental Controls**: Parents should monitor their children's app usage

### Content Guidelines
- **Appropriate Content**: All content must be appropriate for nightlife venues
- **No Illegal Activities**: Users may not use the app for illegal purposes
- **Respectful Behavior**: Users must treat others with respect

### Location Services
- **Location Accuracy**: We strive to provide accurate location information
- **Privacy**: Location data is handled according to our Privacy Policy
- **Opt-out**: Users can disable location services in device settings
```

## 🛡️ Required App Store Information

### App Description
```
BIRLN - Social Nightlife Discovery

Discover the hottest nightlife spots, connect with friends, and share your experiences. BIRLN helps you find the best clubs, bars, and events in your area.

Features:
• Discover nearby venues and events
• Connect with friends and meet new people
• Share photos and experiences
• Get real-time venue updates
• Automatic check-ins at your favorite spots
• Earn BIRLN BUX rewards for visiting venues
• Never miss rewards with automatic check-ins

Perfect for nightlife enthusiasts who want to discover new places, connect with like-minded people, and earn rewards for their nightlife adventures.
```

### Keywords
```
nightlife, clubs, bars, social, discovery, venues, events, nightlife app, social networking, location-based
```

### Age Rating
- **17+**: Due to nightlife content and location sharing
- **Reasons**: 
  - Location sharing with other users
  - Nightlife venue content
  - Social networking features
  - User-generated content

### App Store Review Information
```
Review Notes:
- App requires "Always" location permission for automatic check-ins and BIRLN BUX rewards collection
- Users can earn rewards by visiting venues, and automatic check-ins ensure they don't miss rewards
- Camera access needed for photo sharing
- SMS verification required for account security
- Push notifications for social interactions
- All permissions are clearly explained to users
- Automatic check-ins are a core feature for rewards collection
```

## 📱 Required App Store Screenshots

### Screenshot Requirements
1. **Main Discovery Screen**: Show venue discovery interface
2. **Profile Screen**: Show user profiles and social features
3. **Camera/Photo Screen**: Show photo sharing capabilities
4. **Notifications Screen**: Show in-app notification system
5. **Settings Screen**: Show privacy and permission controls

### App Preview Video
- Show venue discovery process
- Demonstrate photo sharing
- Show social interaction features
- Highlight location-based features

## 🔒 Privacy Compliance Checklist

### Required Disclosures
- [ ] **Location Data**: Clear explanation of location usage
- [ ] **Camera Access**: Purpose of camera access
- [ ] **Photo Library**: Purpose of photo library access
- [ ] **Push Notifications**: Types of notifications sent
- [ ] **Third-Party Services**: All third-party integrations
- [ ] **Data Sharing**: How data is shared with other users
- [ ] **Data Retention**: How long data is kept
- [ ] **User Rights**: How users can control their data

### App Store Privacy Labels
- [ ] **Location**: Precise location, approximate location
- [ ] **Photos**: Photo library access
- [ ] **Camera**: Camera access
- [ ] **Contacts**: Contact information (if used)
- [ ] **Identifiers**: Device ID, user ID
- [ ] **Usage Data**: App interactions, analytics
- [ ] **Diagnostics**: Crash reports, performance data

## 📋 Submission Checklist

### Before Submission
- [ ] Update Privacy Policy with all required disclosures
- [ ] Update Terms of Service with App Store requirements
- [ ] Test all permission requests and explanations
- [ ] Verify all third-party service integrations
- [ ] Prepare App Store screenshots and preview video
- [ ] Complete App Store privacy labels
- [ ] Test app on multiple devices and iOS versions

### During Review
- [ ] Respond quickly to any App Store questions
- [ ] Provide additional information if requested
- [ ] Be prepared to explain any rejected features
- [ ] Have compliance documentation ready

### Post-Approval
- [ ] Monitor app performance and user feedback
- [ ] Keep privacy policies updated
- [ ] Maintain compliance with App Store guidelines
- [ ] Regular security and privacy audits

---

**Last Updated**: December 2024  
**Next Review**: Before App Store submission  
**Responsible Party**: BIRLN Development Team
