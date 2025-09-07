# SMS Consent Language Documentation

## Primary Consent Language

**Displayed to users during phone verification:**

> "By providing your phone number, you agree to receive SMS messages from BIRLN for account verification and important updates. Message and data rates may apply. Message frequency varies. Reply STOP to opt out at any time."

## Consent Language Breakdown

### Key Elements

1. **Clear Purpose**: "account verification and important updates"
2. **Cost Disclosure**: "Message and data rates may apply"
3. **Frequency Notice**: "Message frequency varies"
4. **Opt-out Instructions**: "Reply STOP to opt out at any time"
5. **Company Identification**: "from BIRLN"

### Compliance Features

- ✅ **Explicit Consent**: User must actively check checkbox
- ✅ **Clear Language**: Easy to understand purpose
- ✅ **Cost Disclosure**: Mentions potential charges
- ✅ **Opt-out Method**: Clear STOP instructions
- ✅ **Company Name**: Identifies sender as BIRLN

## Consent Collection Process

### Step 1: Phone Number Entry
- User enters phone number in international format
- System validates phone number format
- No consent collected at this stage

### Step 2: Consent Checkbox
- Consent language displayed prominently
- Checkbox is **unchecked by default**
- User must actively check to proceed
- Cannot proceed without explicit consent

### Step 3: Legal Document Access
- **Privacy Policy**: Opens https://phlout.com/privacy-policy in-app modal
- **Terms of Service**: Opens https://phlout.com/terms-of-service in-app modal
- Users can read full legal documents without leaving the app
- No external redirects that could lose users

### Step 4: Consent Recording
- Consent timestamped in database
- Phone number linked to consent record
- IP address logged (optional)
- Language of consent recorded

## Message Types and Frequency

### Verification Messages
- **Purpose**: Account security and verification
- **Frequency**: As needed for account setup
- **Consent**: Required for account creation
- **Opt-out**: Not applicable (required for service)

### Account Update Messages
- **Purpose**: Important account notifications
- **Frequency**: Occasional (security alerts, policy changes)
- **Consent**: Included in primary consent
- **Opt-out**: Available via STOP or app settings

### Marketing Messages
- **Purpose**: Promotional content and offers
- **Frequency**: Up to 4 messages per month
- **Consent**: Separate explicit consent required
- **Opt-out**: Available via STOP or app settings

## Opt-Out Methods

### SMS Opt-Out
- **Method**: Reply "STOP" to any message
- **Response**: Confirmation message sent
- **Effect**: All marketing messages stopped
- **Timeline**: Immediate (within 24 hours)

### App Settings Opt-Out
- **Method**: Update preferences in app settings
- **Response**: Settings updated immediately
- **Effect**: Marketing messages stopped
- **Timeline**: Immediate

### Customer Support Opt-Out
- **Method**: Contact support through app
- **Response**: Manual processing
- **Effect**: All communications stopped
- **Timeline**: Within 48 hours

## Database Schema for Consent

### Consent Record Fields
```sql
sms_consent BOOLEAN DEFAULT false
sms_consent_timestamp TIMESTAMPTZ
sms_consent_language TEXT
sms_consent_ip_address TEXT
phone_number TEXT
```

### Audit Trail Requirements
- **Timestamp**: Exact time consent was given
- **Language**: Language of consent (e.g., "en")
- **IP Address**: For compliance auditing
- **Phone Number**: Associated phone number
- **User ID**: Links to user account

## Compliance Verification

### Twilio A2P 10DLC Requirements
- ✅ **Explicit Consent**: Checkbox must be actively checked
- ✅ **Clear Language**: Purpose and opt-out clearly stated
- ✅ **Easy Opt-out**: Multiple opt-out methods available
- ✅ **Audit Trail**: Complete consent records maintained
- ✅ **Legal Documents**: Privacy Policy and Terms accessible

### TCPA Compliance
- ✅ **Express Written Consent**: Checkbox constitutes written consent
- ✅ **Clear Identification**: BIRLN clearly identified as sender
- ✅ **Opt-out Mechanism**: STOP instructions provided
- ✅ **Consent Records**: Maintained for audit purposes

### CTIA Guidelines
- ✅ **Consent Language**: Meets industry standards
- ✅ **Opt-out Process**: Follows best practices
- ✅ **Message Frequency**: Reasonable and disclosed
- ✅ **Content Standards**: Appropriate and relevant

## Implementation Notes

### Technical Implementation
- Consent checkbox is **unchecked by default**
- Cannot proceed without checking consent
- Consent recorded immediately when checked
- Database functions handle consent recording

### User Experience
- Consent language is prominent and clear
- Legal documents accessible without leaving app
- Opt-out options clearly communicated
- Process is streamlined and user-friendly

### Monitoring and Auditing
- All consent actions logged with timestamps
- Regular audits of consent records
- Monitoring of opt-out requests
- Compliance reporting for regulators

---

*This documentation ensures full compliance with SMS consent requirements for Twilio A2P 10DLC registration.*
