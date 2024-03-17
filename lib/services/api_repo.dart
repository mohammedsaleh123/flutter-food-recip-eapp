import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRepo {
  Future getApi(
    String url,
  ) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    }
  }
}
