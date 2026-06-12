class AppConstants {
  static const String appName = 'Dompet Kampus Global';
  static const String appVersion = '1.0.0';

  // API
  static const String baseUrl = 'http://10.32.98.204:8080'; // Android emulator → localhost
  static const String apiVersion = '/v1';
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;

  // Secure Storage Keys
  static const String kJwtToken = 'jwt_token';
  static const String kUserData = 'user_data';
  static const String k2faMethod = 'twofa_method';
  static const String kFcmToken = 'fcm_token';
  static const String kAuthVerified = 'auth_verified';

  // 2FA Method identifiers
  static const String twoFaSmtp = 'smtp';
  static const String twoFaTotp = 'totp';
  static const String twoFaNotif = 'notif';

  // OTP
  static const int otpLength = 6;
  static const int otpResendSeconds = 60;

  // PIN
  static const int pinLength = 6;
  
}