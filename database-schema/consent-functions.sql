-- SMS Consent Database Functions for BIRLN
-- These functions handle SMS consent recording and management
-- Required for Twilio A2P 10DLC compliance

-- Function to record SMS consent with full audit trail
CREATE OR REPLACE FUNCTION record_sms_consent(
    p_user_id TEXT,
    p_phone_number TEXT,
    p_consent_language TEXT,
    p_ip_address TEXT DEFAULT NULL
)
RETURNS BOOLEAN AS $$
BEGIN
    -- Update user profile with consent information
    UPDATE user_profiles 
    SET 
        sms_consent = true,
        sms_consent_timestamp = NOW(),
        sms_consent_language = p_consent_language,
        sms_consent_ip_address = p_ip_address,
        phone_number = p_phone_number,
        updated_at = NOW()
    WHERE id = p_user_id;
    
    -- Log the consent action for audit purposes
    INSERT INTO consent_audit_log (
        user_id,
        action_type,
        phone_number,
        consent_language,
        ip_address,
        timestamp
    ) VALUES (
        p_user_id,
        'consent_given',
        p_phone_number,
        p_consent_language,
        p_ip_address,
        NOW()
    );
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to revoke SMS consent
CREATE OR REPLACE FUNCTION revoke_sms_consent(
    p_user_id TEXT,
    p_reason TEXT DEFAULT 'user_request'
)
RETURNS BOOLEAN AS $$
DECLARE
    user_phone TEXT;
BEGIN
    -- Get user's phone number before revoking
    SELECT phone_number INTO user_phone 
    FROM user_profiles 
    WHERE id = p_user_id;
    
    -- Update user profile to revoke consent
    UPDATE user_profiles 
    SET 
        sms_consent = false,
        sms_consent_timestamp = NOW(),
        updated_at = NOW()
    WHERE id = p_user_id;
    
    -- Log the revocation action
    INSERT INTO consent_audit_log (
        user_id,
        action_type,
        phone_number,
        consent_language,
        ip_address,
        timestamp,
        notes
    ) VALUES (
        p_user_id,
        'consent_revoked',
        user_phone,
        'en', -- Default language
        NULL, -- IP not available for revocations
        NOW(),
        p_reason
    );
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to get consent status for a user
CREATE OR REPLACE FUNCTION get_sms_consent_status(p_user_id TEXT)
RETURNS TABLE (
    has_consent BOOLEAN,
    consent_timestamp TIMESTAMPTZ,
    phone_number TEXT,
    consent_language TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        up.sms_consent,
        up.sms_consent_timestamp,
        up.phone_number,
        up.sms_consent_language
    FROM user_profiles up
    WHERE up.id = p_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to get consent audit trail for a user
CREATE OR REPLACE FUNCTION get_consent_audit_trail(p_user_id TEXT)
RETURNS TABLE (
    action_type TEXT,
    timestamp TIMESTAMPTZ,
    phone_number TEXT,
    consent_language TEXT,
    ip_address TEXT,
    notes TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        cal.action_type,
        cal.timestamp,
        cal.phone_number,
        cal.consent_language,
        cal.ip_address,
        cal.notes
    FROM consent_audit_log cal
    WHERE cal.user_id = p_user_id
    ORDER BY cal.timestamp DESC;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create consent audit log table if it doesn't exist
CREATE TABLE IF NOT EXISTS consent_audit_log (
    id SERIAL PRIMARY KEY,
    user_id TEXT NOT NULL,
    action_type TEXT NOT NULL, -- 'consent_given', 'consent_revoked', 'opt_out_request'
    phone_number TEXT,
    consent_language TEXT,
    ip_address TEXT,
    timestamp TIMESTAMPTZ DEFAULT NOW(),
    notes TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add indexes for audit log
CREATE INDEX IF NOT EXISTS idx_consent_audit_user_id ON consent_audit_log(user_id);
CREATE INDEX IF NOT EXISTS idx_consent_audit_timestamp ON consent_audit_log(timestamp);
CREATE INDEX IF NOT EXISTS idx_consent_audit_action_type ON consent_audit_log(action_type);

-- Grant permissions
GRANT EXECUTE ON FUNCTION record_sms_consent(TEXT, TEXT, TEXT, TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION revoke_sms_consent(TEXT, TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_sms_consent_status(TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_consent_audit_trail(TEXT) TO authenticated;

-- Grant table permissions
GRANT SELECT ON consent_audit_log TO authenticated;
GRANT INSERT ON consent_audit_log TO authenticated;

-- Add RLS policies for audit log
ALTER TABLE consent_audit_log ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own consent audit log" ON consent_audit_log
    FOR SELECT USING (auth.uid()::text = user_id);

CREATE POLICY "System can insert consent audit log" ON consent_audit_log
    FOR INSERT WITH CHECK (true);
