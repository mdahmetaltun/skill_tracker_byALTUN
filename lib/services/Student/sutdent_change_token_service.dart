import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_tracker/constants/endpoints.dart';
import 'package:skill_tracker/services/Student/student_login_service.dart';

Future<void> studentRefreshToken(String currentToken) async {
  try {
    var url = Uri.parse(studentRefreshTokenEP);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $currentToken',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var newToken = response.body;
      userToken = newToken;
      debugPrint('New Token: $newToken');
      debugPrint('Token refresh successful!');
    } else {
      debugPrint('Error occurred: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
    }
  } catch (e) {
    debugPrint('Error occurred: $e');
  }
}
