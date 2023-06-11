import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skill_tracker/constants/endpoints.dart';

Future<List<Map<String, dynamic>>> getCourseAllMethod() async {
  List<Map<String, dynamic>> courses = [];
  var client = http.Client();
  var url = Uri.parse(getCourseAllEP);
  var headers = {'Content-Type': 'application/json'};

  try {
    var response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      courses = data
          .map((item) => {
                'courseName': item['courseName'],
                'courseImageUrl': item['courseImageUrl'],
              })
          .toList();
    } else {
      throw Exception('Failed to load courses');
    }
  } finally {
    client.close();
  }
  return courses;
}
