import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vis_mobile/app/core/utils/api_url.dart';

class DetailPOProvider {
  final urlpo = ApiUrl.baseUrl + EndPoint.detailpo;
  final urlout = ApiUrl.baseUrl + EndPoint.detailout;
  var token;

  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('access');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<http.Response> fetchDetailPO(id) async {
    await _getToken();
    return http.get(
      Uri.parse(urlpo + '?id=$id'),
      headers: _setHeaders(),
    );
  }

  Future<http.Response> fetchDetailOut(id) async {
    await _getToken();
    return http.get(
      Uri.parse(urlout + '?id=$id'),
      headers: _setHeaders(),
    );
  }
}
