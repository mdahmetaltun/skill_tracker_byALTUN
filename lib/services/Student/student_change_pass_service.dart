import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:skill_tracker/constants/endpoints.dart';

Future<void> studentChangePassword(
  String studentNumber,
  String currentPassword,
  String newPassword,
  String newPasswordConfirm,
  String token,
) async {
  try {
    var url = Uri.parse(studentChangePassEP);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var body = jsonEncode({
      'studentNumber': studentNumber,
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'newPasswordConfirm': newPasswordConfirm,
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      debugPrint('Password change successful!');
    } else {
      debugPrint('Error occurred: ${response.body}');
    }
  } catch (e) {
    debugPrint('Error occurred: $e');
  }
}
