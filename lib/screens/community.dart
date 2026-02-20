import 'package:flutter/material.dart';
import 'package:whatsin/styles/color.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = ['Neighborhood', 'Office Team', 'Family', 'Weekend Football'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text('Communities'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.groups),
            ),
            title: const Text('New community'),
            onTap: () {},
          ),
          const Divider(color: AppColors.divider),
          ...groups.map(
            (group) => ListTile(
              leading: CircleAvatar(backgroundColor: AppColors.whatsappDarkGreen, child: Text(group[0])),
              title: Text(group),
              subtitle: const Text('Community announcements', style: TextStyle(color: AppColors.textSecondary)),
            ),
          ),
        ],
      ),
    );
  }
}
