import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skill_tracker/constants/endpoints.dart';

Future<List<Map<String, dynamic>>> getSkillAllMethod() async {
  List<Map<String, dynamic>> skills = [];
  var client = http.Client();
  var url = Uri.parse(getSkillAllEP);
  var headers = {'Content-Type': 'application/json'};

  try {
    var response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      skills = data
          .map((item) => {
                "skillId": item['skillId'],
                "courseName": item['courseName'],
                "skillName": item['skillName'],
                "skillDescription": item['skillDescription'],
                "skillImageUrl": item['skillImageUrl'],
                "possibleMaxScore": item['possibleMaxScore'],
                "subSkillCount": item['subSkillCount']
              })
          .toList();
    } else {
      throw Exception('Failed to load courses');
    }
  } finally {
    client.close();
  }
  return skills;
}
