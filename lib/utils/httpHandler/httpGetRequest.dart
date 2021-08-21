import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ubuni_phone_app/globals/getRequestHeaders.dart';
import 'package:ubuni_phone_app/globals/urls.dart';
import 'package:ubuni_phone_app/models/phone.dart';

class HttpGetRequest {
  final urlPhoneList = phoneListEndpoint;

  Future<Phone> requestPhoneDetails({required int phoneId}) async {
    final response = await http.get(
      Uri.parse("$urlPhoneList/$phoneId"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Phone.fromJson(jsonData: jsonDecode(response.body));
    } else {
      throw Exception('Failed to get phone details');
    }
  }

  Future<List<Phone>> requestPhoneList() async {
    final response = await http.get(Uri.parse(urlPhoneList), headers: headers);

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
