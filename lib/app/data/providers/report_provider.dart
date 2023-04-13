import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/core/utils/api_url.dart';

class ReportProvider {
  final url = Uri.parse(ApiUrl.baseUrl + EndPoint.rank_ytmonth);
  var token;

  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('access');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<http.Response> fetchReport() async {
    await _getToken();
    return http.get(
      url,
      headers: _setHeaders(),
    );
  }
}
