import 'package:shared_preferences/shared_preferences.dart';
import 'package:vis_mobile/app/core/utils/api_url.dart';
import 'package:http/http.dart' as http;

class MasterProvider {
  final urlmasterdata = Uri.parse(ApiUrl.baseUrl + EndPoint.masterdata);
  final urlmasterdatadetail = ApiUrl.baseUrl + EndPoint.masterdatadetail;
  var token;

  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('access');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<http.Response> fetchMasterData() async {
    await _getToken();
    return http.get(
      urlmasterdata,
      headers: _setHeaders(),
    );
  }

  Future<http.Response> fetchMasterDataDetail(String id) async {
    await _getToken();
    return http.get(
      Uri.parse(urlmasterdatadetail + '?id=$id'),
      headers: _setHeaders(),
    );
  }
}
