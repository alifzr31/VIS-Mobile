import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/core/utils/api_url.dart';
import 'package:http/http.dart' as http;

class RankingProvider {
  var url = Uri.parse(ApiUrl.baseUrl + EndPoint.rank_bfmonth);
  final urlthismonth = Uri.parse(ApiUrl.baseUrl + EndPoint.rank_thismonth);
  var token;

  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('access');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<http.Response> fetchRankbfMonth() async {
    await _getToken();
    return http.get(
      url,
      headers: _setHeaders(),
    );
  }

  Future<http.Response> fetchRankthisMonth() async {
    await _getToken();
    return http.get(
      urlthismonth,
      headers: _setHeaders(),
    );
  }
}
