class ApiUrl {
  static final String baseUrl = 'https://vis.anyargroup.co.id/api';
  // static final String baseUrl = 'http://10.1.1.148:8009/api';
  static EndPoint endPoint = EndPoint();
}

class EndPoint {
  // AUTHENTICATION
  static final String login = '/token';

  // USER
  static final String profile = '/profile';
  static final String dash = '/dash';

  // FETCHING DATA
  static final String masterdata = '/master-data';
}