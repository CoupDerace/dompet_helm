

class ApiEndpoints {
  static const String _base = AppConstants.apiVersion;

  // Health
  static const String health = '$_base/health';

  // Auth
  static const String verifyToken = '$_base/auth/verify-token';
  static const String register = '$_base/auth/register';
  static const String verifyEmailOtp = '$_base/auth/verify-email-otp';
  static const String me = '$_base/auth/me';
  static const String fcmToken = '$_base/auth/fcm-token';
}