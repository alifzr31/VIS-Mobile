import 'package:vis_mobile/app/core/utils/api_url.dart';
import 'package:http/http.dart' as http;

class LoginProvider {
  final url = Uri.parse(ApiUrl.baseUrl + EndPoint.login);

  Future<http.Response> login(Map data) async {
    return http.post(
      url,
      body: data,
    );
  }
}
