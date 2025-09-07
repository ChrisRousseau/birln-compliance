-- SMS Consent Database Schema for BIRLN
-- This file contains the database schema for SMS consent compliance
-- Required for Twilio A2P 10DLC compliance

-- Add SMS consent columns to user_profiles table
-- This ensures legal compliance for Twilio A2P 10DLC requirements

-- Add SMS consent columns
ALTER TABLE user_profiles 
ADD COLUMN IF NOT EXISTS sms_consent BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS sms_consent_timestamp TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS sms_consent_language TEXT,
ADD COLUMN IF NOT EXISTS sms_consent_ip_address TEXT,
ADD COLUMN IF NOT EXISTS phone_number TEXT;

-- Add index for phone number lookups
CREATE INDEX IF NOT EXISTS idx_user_profiles_phone_number ON user_profiles(phone_number);

-- Add index for SMS consent queries
CREATE INDEX IF NOT EXISTS idx_user_profiles_sms_consent ON user_profiles(sms_consent);

-- Add check constraint for phone number format (optional)
-- ALTER TABLE user_profiles ADD CONSTRAINT check_phone_format 
--   CHECK (phone_number IS NULL OR phone_number ~ '^\+[1-9]\d{1,14}$');

-- Update the public_user_profiles view to exclude sensitive consent data
CREATE OR REPLACE VIEW public_user_profiles AS
SELECT 
    id,
    name,
    username,
    avatar,
    bio,
    website,
    gender,
    followers_count,
    following_count,
    chili_pepper_count,
    birln_bux_count,
    is_private,
    is_online,
    last_seen,
    created_at,
    coords,
    photos,
    liked_places,
    has_completed_onboarding
FROM user_profiles
WHERE is_private = false;

-- Create a function to record SMS consent
CREATE OR REPLACE FUNCTION record_sms_consent(
    p_user_id TEXT,
    p_phone_number TEXT,
    p_consent_language TEXT,
    p_ip_address TEXT DEFAULT NULL
)
RETURNS BOOLEAN AS $$
BEGIN
    UPDATE user_profiles 
    SET 
        sms_consent = true,
        sms_consent_timestamp = NOW(),
        sms_consent_language = p_consent_language,
        sms_consent_ip_address = p_ip_address,
        phone_number = p_phone_number,
        updated_at = NOW()
    WHERE id = p_user_id;
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute permission on the function
GRANT EXECUTE ON FUNCTION record_sms_consent(TEXT, TEXT, TEXT, TEXT) TO authenticated;

-- Create a function to revoke SMS consent
CREATE OR REPLACE FUNCTION revoke_sms_consent(p_user_id TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    UPDATE user_profiles 
    SET 
        sms_consent = false,
        sms_consent_timestamp = NOW(),
        updated_at = NOW()
    WHERE id = p_user_id;
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute permission on the function
GRANT EXECUTE ON FUNCTION revoke_sms_consent(TEXT) TO authenticated;

-- Add RLS policy for SMS consent functions
CREATE POLICY "Users can update own SMS consent" ON user_profiles
    FOR UPDATE USING (auth.uid()::text = id);

-- Verify the changes
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns 
WHERE table_name = 'user_profiles' 
AND column_name IN ('sms_consent', 'sms_consent_timestamp', 'sms_consent_language', 'sms_consent_ip_address', 'phone_number')
ORDER BY column_name;
