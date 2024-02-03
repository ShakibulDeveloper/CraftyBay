class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String sentEmailOtp(String email) => '$_baseUrl/UserLogin/$email';
  static String otpVerify(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
}
