import 'package:flutter/material.dart';
import 'package:skill_tracker/constants/localization.dart';
import 'package:skill_tracker/services/Skill/get_skill_all_service.dart';
import 'package:skill_tracker/widgets/search_bar.dart';
import 'package:skill_tracker/widgets/skill_item.dart';

class AllSkills extends StatefulWidget {
  const AllSkills({Key? key}) : super(key: key);

  @override
  State<AllSkills> createState() => _AllSkillsState();
}

Future<List<Map<String, dynamic>>>? allSkillsFuture;

class _AllSkillsState extends State<AllSkills> {
  @override
  void initState() {
    allSkillsFuture = getSkillAllMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: allSkillsFuture,
      initialData: const [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Oops! Something went wrong. Please try again later.');
        } else {
          return SkillList(skills: snapshot.data!);
        }
      },
    );
  }
}

class SkillList extends StatefulWidget {
  final List<Map<String, dynamic>> skills;

  const SkillList({Key? key, required this.skills}) : super(key: key);

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Map<String, dynamic>> filteredSkills;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSkills = widget.skills;
  }

  void _onSearch(String text) {
    setState(() {
      if (text.isEmpty) {
        filteredSkills = widget.skills;
      } else {
        filteredSkills = widget.skills.where((skill) {
          final skillName = skill['skillName'] as String;
          return skillName.toLowerCase().contains(text.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(controller: controller, onSearch: _onSearch, title: search),
        SizedBox(height: 10,),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredSkills.length,
            itemBuilder: (BuildContext context, int index) {
              return SkillItem(skills: filteredSkills[index]);
            },
          ),
        ),
      ],
    );
  }
}
