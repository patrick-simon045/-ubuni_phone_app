import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ubuni_phone_app/models/phone.dart';

class HttpGetRequest {
  final String url;
  final Map<String, String> headers;

  HttpGetRequest({required this.url, required this.headers});

  Future<Phone> requestPhoneDetails() async {
    final response = await http.get(Uri.parse(this.url), headers: this.headers);

    if (response.statusCode == 200) {
      return Phone.fromJson(jsonData: jsonDecode(response.body));
    } else {
      throw Exception('Failed to get phone details');
    }
  }

  Future<List<Phone>> requestPhoneList() async {
    final response = await http.get(Uri.parse(this.url), headers: this.headers);

    if (response.statusCode == 200) {
      print("empty list");
      Iterable responseList = jsonDecode(response.body);
      List<Phone> phones = [];
      phones =
          responseList.map((phone) => Phone.fromJson(jsonData: phone)).toList();
      return phones;
    } else {
      throw Exception('Failed to get phones');
    }
  }
}
