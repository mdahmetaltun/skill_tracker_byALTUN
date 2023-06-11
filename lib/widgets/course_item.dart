import 'package:flutter/material.dart';
import 'package:skill_tracker/pages/course_detail_page.dart';

class CourseItem extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailPage(courseName: course['courseName'])));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage('${course['courseImageUrl']}'),
              fit: BoxFit.cover
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          left: 10,
          child: Text(
            '${course['courseName']}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
