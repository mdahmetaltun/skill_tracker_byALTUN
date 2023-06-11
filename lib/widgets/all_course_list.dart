import 'package:flutter/material.dart';
import 'package:skill_tracker/constants/localization.dart';
import 'package:skill_tracker/services/Course/get_course_all_service.dart';
import 'package:skill_tracker/widgets/course_item.dart';
import 'package:skill_tracker/widgets/search_bar.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

Future<List<Map<String, dynamic>>>? allCoursesFuture;

class _CoursesState extends State<Courses> {
  final controller = TextEditingController();
  late List<Map<String, dynamic>> filteredCourses = [];
  List<Map<String, dynamic>> courses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  void _fetchCourses() async {
    final fetchedCourses = await getCourseAllMethod();
    setState(() {
      courses = fetchedCourses;
      filteredCourses = courses;
    });
  }

  void _onSearch(String text) {
    setState(() {
      if (text.isEmpty) {
        filteredCourses = courses;
      } else {
        filteredCourses = courses.where((course) {
          final courseName = course['courseName'] as String;
          return courseName.toLowerCase().contains(text.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          SearchBar(controller: controller, onSearch: _onSearch, title: search),
          const SizedBox(height: 10,),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredCourses.length,
              itemBuilder: (BuildContext context, int index) {
                return CourseItem(course: filteredCourses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
