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

  // FETCHING DATA
  // HOME TAB
  static final String dash = '/dash';
  static final String po = '/po';

  // LIST TAB
  static final String masterdata = '/master-data';
  static final String masterdatadetail = '/master-data-detail';

  // DETAIL PO
  static final String detailpo = '/po-detail';
  static final String detailout = '/po-detail-os';
}