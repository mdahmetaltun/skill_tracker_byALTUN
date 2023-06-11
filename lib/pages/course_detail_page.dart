import 'package:flutter/material.dart';
import 'package:skill_tracker/pages/skill_detail_page.dart';
import 'package:skill_tracker/widgets/all_skill_list.dart';

class CourseDetailPage extends StatefulWidget {
  final String courseName;
  const CourseDetailPage({Key? key, required this.courseName}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Beceriler', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0),
      body: FutureBuilder(
        future: allSkillsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Oops! Something went wrong. Please try again later.');
          } else if (snapshot.data != null) {
            var data = (snapshot.data as List<Map<String, dynamic>>).where((item) => item['courseName'] == widget.courseName).toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: GestureDetector(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => SkillDetailPage(skillName: data[index]['skillName'])));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 170,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: NetworkImage(data[index]['skillImageUrl']), fit: BoxFit.fill),
                                ),
                              ),
                              // Positioned(
                              //     left: 5,
                              //     top: 15,
                              //     child: badges.Badge(
                              //       badgeStyle: BadgeStyle(
                              //         shape: BadgeShape.square,
                              //         badgeColor: Colors.pink,
                              //         borderRadius: BorderRadius.circular(8),
                              //       ),
                              //       badgeContent:
                              //           Text('New', style: TextStyle(color: Colors.white)),
                              //     ))
                            ],
                          ),
                          Text(
                            data[index]['skillName'],
                            style: const TextStyle(fontWeight: FontWeight.bold, height: 1.6),
                          ),
                          Text(
                            data[index]['skillName'],
                            style: const TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text('No available data.');
          }
        },
      ),
    );
  }
}
