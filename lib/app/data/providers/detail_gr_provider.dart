import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/core/utils/api_url.dart';
import 'package:http/http.dart' as http;

class DetailGrProvider {
  var url = ApiUrl.baseUrl + EndPoint.detailgr;
  var token;

  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('access');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<http.Response> fetchDetailGr(id) async {
    await _getToken();
    return http.get(
      Uri.parse(url + '?id=$id'),
      headers: _setHeaders(),
    );
  }
}
