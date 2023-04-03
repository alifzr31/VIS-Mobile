import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/core/utils/api_url.dart';
import 'package:http/http.dart' as http;

class GlobalProvider {
  final urlgrr = Uri.parse(ApiUrl.baseUrl + EndPoint.grr);
  final urlapinv = Uri.parse(ApiUrl.baseUrl + EndPoint.ap_inv);
  final urlgr = Uri.parse(ApiUrl.baseUrl + EndPoint.gr);
  final urlapmem = Uri.parse(ApiUrl.baseUrl + EndPoint.ap_mem);
  var token;

  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('access');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<http.Response> fetchGRR() async {
    await _getToken();
    return http.get(
      urlgrr,
      headers: _setHeaders(),
    );
  }

  Future<http.Response> fetchApInv() async {
    await _getToken();
    return http.get(
      urlapinv,
      headers: _setHeaders(),
    );
  }

  Future<http.Response> fetchGr() async {
    await _getToken();
    return http.get(
      urlgr,
      headers: _setHeaders(),
    );
  }

  Future<http.Response> fetchApMem() async {
    await _getToken();
    return http.get(
      urlapmem,
      headers: _setHeaders(),
    );
  }
}
