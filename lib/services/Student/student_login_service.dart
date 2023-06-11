import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_tracker/constants/endpoints.dart';

String? userToken;

Future<void> studentLoginMethod(studentNumber, studentPassword) async {
  var url = Uri.parse(studentAuthEP);
  var headers = {'Content-Type': 'application/json'};
  var body = jsonEncode({
    'studentNumber': studentNumber,
    'studentPassword': studentPassword,
  });

  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var token = data['token'];

    debugPrint('Token: $token');
    userToken = token;
  }
}
