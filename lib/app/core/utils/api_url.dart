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
  static final String grpo = '/grpo';
  static final String grr = '/grr';
  static final String gr = '/good-return';
  static final String ap_inv = '/ap-invoice';
  static final String ap_mem = '/ap-creditmemo';

  // LIST TAB
  static final String masterdata = '/master-data';
  static final String masterdatadetail = '/master-data-detail';

  // DETAIL PO
  static final String detailpo = '/po-detail';
  static final String detailout = '/po-detail-os';

  // DETAIL GRR
  static final String detailgrr = '/grr-detail';

  // DETAIL AP-INVOICE
  static final String detailapinv = '/ap-invoice-detail';

  // DETAIL GOODS RETURN
  static final String detailgr = '/good-return-detail';

  // DETAIL AP CREDIT MEMO
  static final String detailapmem = '/ap-creditmemo-detail';

  // DETAIL GRPO
  static final String detailgrpo = '/grpo-detail';
}