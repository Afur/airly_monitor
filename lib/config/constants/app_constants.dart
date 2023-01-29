// ignore_for_file: non_constant_identifier_names

class AppConstants {
  const AppConstants._();

  // GENERAL
  static String get SERVER_URL => 'http://146.59.126.193';

  // AUTH
  static String get AUTH_CLIENT_ID => 'mobile';
  static String get AUTH_URL => '$SERVER_URL/connect/authorize';
  static String get AUTH_TOKEN_URL => '$SERVER_URL/connect/token';
  static String get AUTH_DISCOUVERY_DOCUMENTS => '$SERVER_URL/.well-known/openid-configuration';
  static String get AUTH_REDIRECT_URL => 'http://io.pstmn.oauth/v1/callback';
  static List<String> get AUTH_SCOPE => ['api', 'openid',];
}
