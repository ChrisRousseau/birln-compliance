-- SMS Consent Audit Trail Examples for BIRLN
-- This file shows example queries for auditing SMS consent compliance
-- Useful for Twilio A2P 10DLC compliance reporting

-- Example 1: Get all users with SMS consent
SELECT 
    id,
    name,
    phone_number,
    sms_consent,
    sms_consent_timestamp,
    sms_consent_language,
    created_at
FROM user_profiles 
WHERE sms_consent = true
ORDER BY sms_consent_timestamp DESC;

-- Example 2: Get consent statistics
SELECT 
    COUNT(*) as total_users,
    COUNT(CASE WHEN sms_consent = true THEN 1 END) as users_with_consent,
    COUNT(CASE WHEN sms_consent = false THEN 1 END) as users_without_consent,
    ROUND(
        COUNT(CASE WHEN sms_consent = true THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) as consent_percentage
FROM user_profiles;

-- Example 3: Get recent consent activity
SELECT 
    up.id,
    up.name,
    up.phone_number,
    up.sms_consent_timestamp,
    cal.action_type,
    cal.timestamp as audit_timestamp,
    cal.notes
FROM user_profiles up
LEFT JOIN consent_audit_log cal ON up.id = cal.user_id
WHERE up.sms_consent_timestamp >= NOW() - INTERVAL '30 days'
ORDER BY up.sms_consent_timestamp DESC;

-- Example 4: Get consent by language
SELECT 
    sms_consent_language,
    COUNT(*) as user_count,
    MIN(sms_consent_timestamp) as first_consent,
    MAX(sms_consent_timestamp) as latest_consent
FROM user_profiles 
WHERE sms_consent = true
GROUP BY sms_consent_language
ORDER BY user_count DESC;

-- Example 5: Get users who revoked consent
SELECT 
    up.id,
    up.name,
    up.phone_number,
    cal.timestamp as revocation_timestamp,
    cal.notes as revocation_reason
FROM user_profiles up
JOIN consent_audit_log cal ON up.id = cal.user_id
WHERE cal.action_type = 'consent_revoked'
ORDER BY cal.timestamp DESC;

-- Example 6: Get consent compliance report for Twilio
SELECT 
    'Total Users' as metric,
    COUNT(*) as value
FROM user_profiles
UNION ALL
SELECT 
    'Users with SMS Consent' as metric,
    COUNT(*) as value
FROM user_profiles 
WHERE sms_consent = true
UNION ALL
SELECT 
    'Consent Rate (%)' as metric,
    ROUND(
        COUNT(CASE WHEN sms_consent = true THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) as value
FROM user_profiles
UNION ALL
SELECT 
    'Recent Consents (7 days)' as metric,
    COUNT(*) as value
FROM user_profiles 
WHERE sms_consent = true 
AND sms_consent_timestamp >= NOW() - INTERVAL '7 days'
UNION ALL
SELECT 
    'Recent Revocations (7 days)' as metric,
    COUNT(*) as value
FROM consent_audit_log 
WHERE action_type = 'consent_revoked' 
AND timestamp >= NOW() - INTERVAL '7 days';

-- Example 7: Get detailed audit trail for a specific user
SELECT 
    cal.action_type,
    cal.timestamp,
    cal.phone_number,
    cal.consent_language,
    cal.ip_address,
    cal.notes
FROM consent_audit_log cal
WHERE cal.user_id = 'USER_ID_HERE'
ORDER BY cal.timestamp DESC;

-- Example 8: Get consent by date range (for monthly reports)
SELECT 
    DATE_TRUNC('day', sms_consent_timestamp) as consent_date,
    COUNT(*) as consents_given
FROM user_profiles 
WHERE sms_consent = true
AND sms_consent_timestamp >= NOW() - INTERVAL '30 days'
GROUP BY DATE_TRUNC('day', sms_consent_timestamp)
ORDER BY consent_date DESC;

-- Example 9: Get opt-out requests
SELECT 
    up.id,
    up.name,
    up.phone_number,
    cal.timestamp as opt_out_timestamp,
    cal.notes as opt_out_reason
FROM user_profiles up
JOIN consent_audit_log cal ON up.id = cal.user_id
WHERE cal.action_type = 'opt_out_request'
ORDER BY cal.timestamp DESC;

-- Example 10: Get compliance summary for regulatory reporting
SELECT 
    'SMS Consent Compliance Report' as report_title,
    NOW() as report_date,
    COUNT(*) as total_registered_users,
    COUNT(CASE WHEN sms_consent = true THEN 1 END) as users_with_consent,
    COUNT(CASE WHEN sms_consent = false THEN 1 END) as users_without_consent,
    COUNT(CASE WHEN sms_consent_timestamp >= NOW() - INTERVAL '30 days' THEN 1 END) as recent_consents,
    COUNT(CASE WHEN cal.action_type = 'consent_revoked' AND cal.timestamp >= NOW() - INTERVAL '30 days' THEN 1 END) as recent_revocations
FROM user_profiles up
LEFT JOIN consent_audit_log cal ON up.id = cal.user_id;

-- Example 11: Check for users with phone numbers but no consent
SELECT 
    id,
    name,
    phone_number,
    created_at,
    sms_consent
FROM user_profiles 
WHERE phone_number IS NOT NULL 
AND sms_consent = false
ORDER BY created_at DESC;

-- Example 12: Get consent by IP address (for fraud detection)
SELECT 
    sms_consent_ip_address,
    COUNT(*) as consent_count,
    COUNT(DISTINCT id) as unique_users,
    MIN(sms_consent_timestamp) as first_consent,
    MAX(sms_consent_timestamp) as latest_consent
FROM user_profiles 
WHERE sms_consent = true 
AND sms_consent_ip_address IS NOT NULL
GROUP BY sms_consent_ip_address
HAVING COUNT(*) > 1
ORDER BY consent_count DESC;
