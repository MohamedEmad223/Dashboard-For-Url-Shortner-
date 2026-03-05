class EndPoints {
  static const String login = 'login';
  static const String signUp = 'register';
  static const String forgetPassword = 'forgot-password';
  static const String verifyCode = 'forgot-password/verify';
  static const String resetPassword = 'reset-password';
  static const String logOut = 'logout';
  static const String overView = 'overview';
  static const String generatelinks = 'generate';
  static const String getLinks = 'links';

  // Dynamic endpoints with ID parameter
  static String deleteLink(int id) => 'delete-link/$id';
  static String toggleLink(int id) => 'toggle-link/$id';


  static const String clicksOverTime = 'clicks-over-time';
  static const String recentClicks = 'recent-clicks';
  static String linkAnalytics(int id) => 'links/$id';
}