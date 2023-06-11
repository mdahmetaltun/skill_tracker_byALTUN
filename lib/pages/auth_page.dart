import 'package:flutter/material.dart';
import 'package:skill_tracker/constants/localization.dart';
import 'package:skill_tracker/pages/student_change_pass_page.dart';
import 'package:skill_tracker/services/Student/student_delete_service.dart';
import 'package:skill_tracker/services/Student/student_login_service.dart';
import 'package:skill_tracker/services/Student/sutdent_change_token_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

final TextEditingController _studentNumberController = TextEditingController();
final TextEditingController _studentPasswordController = TextEditingController();

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(studentLogin)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _studentNumberController,
              decoration: const InputDecoration(labelText: studentNumber),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _studentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: password),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  studentLoginMethod(_studentNumberController.text, _studentPasswordController.text);
                },
                child: const Text(login)),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentChangePassPage()));
                },
                child: const Text(changePass)),
            ElevatedButton(onPressed: () => studentRefreshToken(userToken!), child: const Text(changeToken)),
            ElevatedButton(onPressed: () => studentDelete(userToken!, _studentNumberController.text), child: const Text(deleteStudent)),
          ],
        ),
      ),
    );
  }
}
