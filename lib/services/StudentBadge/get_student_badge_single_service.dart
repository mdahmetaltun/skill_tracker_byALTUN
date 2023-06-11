import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skill_tracker/constants/endpoints.dart';

Future<void> getStudentBadgeSingleMethod(int studentBadgeID) async {
  var url = Uri.parse(getStudentBadgeSingleEP + studentBadgeID.toString());
  var headers = {'Content-Type': 'application/json'};

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    debugPrint(data.toString());
  } else {
    debugPrint(response.body);
  }
}
