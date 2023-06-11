import 'package:flutter/material.dart';
import 'package:skill_tracker/pages/skill_detail_page.dart';

class SkillItem extends StatelessWidget {
  final Map<String, dynamic> skills;

  const SkillItem({Key? key, required this.skills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SkillDetailPage(skillName: skills['skillName'])));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage('${skills['skillImageUrl']}'),
              fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(

          bottom: 0,
          right: 10,
          left: 10,
          child: Column(
            children: [
              Text(
                '${skills['courseName']}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${skills['skillName']}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
