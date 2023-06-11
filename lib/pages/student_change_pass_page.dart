import 'package:flutter/material.dart';
import 'package:skill_tracker/constants/localization.dart';
import 'package:skill_tracker/services/Student/student_change_pass_service.dart';

import '../services/Student/student_login_service.dart';

class StudentChangePassPage extends StatefulWidget {
  const StudentChangePassPage({Key? key}) : super(key: key);

  @override
  State<StudentChangePassPage> createState() => _StudentChangePassPageState();
}

final TextEditingController studentNumberController = TextEditingController();
final TextEditingController oldPassController = TextEditingController();
final TextEditingController newPassController = TextEditingController();
final TextEditingController againNewPassController = TextEditingController();

class _StudentChangePassPageState extends State<StudentChangePassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(changePass)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: studentNumberController,
              decoration: const InputDecoration(labelText: studentNumber),
            ),
            TextField(
              controller: oldPassController,
              decoration: const InputDecoration(labelText: oldPass),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: newPassController,
              obscureText: true,
              decoration: const InputDecoration(labelText: newPass),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: againNewPassController,
              obscureText: true,
              decoration: const InputDecoration(labelText: againNewPass),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  studentChangePassword(
                      studentNumberController.text, oldPassController.text, newPassController.text, againNewPassController.text, userToken!);
                },
                child: const Text(changePass)),
          ],
        ),
      ),
    );
  }
}
