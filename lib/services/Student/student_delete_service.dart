import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_tracker/constants/endpoints.dart';

Future<void> studentDelete(String token, studentNumber) async {
  try {
    var url = Uri.parse('$studentDeleteEP$studentNumber');
    var headers = {
      'Authorization': 'Bearer $token',
    };

    var request = http.Request('DELETE', url);
    request.headers.addAll(headers);

    var response = await http.Client().send(request);

    if (response.statusCode == 200) {
      debugPrint('Student deleted successfully!');
    } else {
      debugPrint('Error occurred: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Error occurred: $e');
  }
}
