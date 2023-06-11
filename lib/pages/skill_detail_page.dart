import 'package:flutter/material.dart';
import 'package:skill_tracker/widgets/all_skill_list.dart';

class SkillDetailPage extends StatelessWidget {
  final String? skillName;
  const SkillDetailPage({Key? key, this.skillName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: allSkillsFuture,
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Oops! Something went wrong. Please try again later.'));
          } else if (snapshot.data != null) {
            List<Map<String, dynamic>> filteredSkills = snapshot.data!.where((skill) => skill['skillName'] == skillName).toList();

            if (filteredSkills.isNotEmpty) {
              Map<String, dynamic> skill = filteredSkills.first;
              return SkillDetail(skill: skill);
            } else {
              return const Center(child: Text('No available data.'));
            }
          } else {
            return const Center(child: Text('No available data.'));
          }
        },
      ),
    );
  }
}

class SkillDetail extends StatelessWidget {
  final Map<String, dynamic> skill;

  const SkillDetail({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkillImageSection(skill: skill),
        SkillTitleSection(skill: skill),
        SkillDescriptionSection(skill: skill),
        const SizedBox(height: 90),
        const AddToCartSection(),
      ],
    );
  }
}

class SkillImageSection extends StatelessWidget {
  final Map<String, dynamic> skill;

  const SkillImageSection({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(skill['skillImageUrl']),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
        Positioned(
            left: 15,
            top: 30,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ))
      ],
    );
  }
}

class SkillTitleSection extends StatelessWidget {
  final Map<String, dynamic> skill;

  const SkillTitleSection({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            skill['skillName'],
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.favorite, color: Colors.red, size: 15)
        ],
      ),
    );
  }
}

class SkillDescriptionSection extends StatelessWidget {
  final Map<String, dynamic> skill;

  const SkillDescriptionSection({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill['courseName'],
            style: const TextStyle(height: 1.7, fontSize: 15),
          ),
          Text(
            skill['skillDescription'],
            style: const TextStyle(height: 1.7, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: const [
            Text('Add To Cart', style: TextStyle(fontSize: 14)),
            SizedBox(width: 8),
            Icon(Icons.arrow_circle_up, size: 25),
          ],
        ));
  }
}
