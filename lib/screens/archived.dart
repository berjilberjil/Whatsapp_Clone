import 'package:flutter/material.dart';
import 'package:whatsin/styles/color.dart';

class ArchivedChat extends StatelessWidget {
  const ArchivedChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.appBar, title: const Text('Archived')),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(child: Text('R')),
            title: Text('Rahul'),
            subtitle: Text('See you soon!', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ListTile(
            leading: CircleAvatar(child: Text('P')),
            title: Text('Project Team'),
            subtitle: Text('Archived 2 days ago', style: TextStyle(color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }
}
